//
//  ParameterDescription.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
  Parameter Description
*/
public struct ParameterDescription: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// The manufacturer specific PID requested by the controller. Range `0x8000 to 0xFFDF`.
    public var pidRequested: ParameterID
        
    /// PDL Size defines the number used for the PDL field in all `GET_RESPONSE` and `SET `messages associated with this PID.
    /// In the case of the value of DS_ASCII, the PDL Size represents the maximum length of a variable sized ASCII string.
    public var pldSize: UInt8
    
    /// Data Type defines the size of the data entries in the PD of the message for this PID.
    /// For example: unsigned 8-bit character versus signed 16-bit word.
    /// - SeeAlso: Table A-15: Data Type
    public var dataType: DataType
    
    /// Command Class defines whether Get and or Set messages are implemented for the specified PID.
    /// - SeeAlso: Table A-16: Parameter Description Command Class
    public var commandClass: ParameterDescriptionCommandClass
    
    /// This field no longer has any meaning and should be filled with 0x00 in the response. Controllers should ignore the contents of this field.
    internal let filler: UInt8
    
    /// Unit is an unsigned 8-bit value enumerated by Table A-13.
    /// It defines the SI (International System of units) unit of the specified PID data.
    public var unit: SensorUnit
    
    /// Prefix is an unsigned 8-bit value enumerated by Table A-14.
    /// It defines the SI Prefix and multiplication factor of the units.
    public var prefix: SensorUnitPrefix
    
    /// This is a 32-bit field that represents the lowest value that data can reach.
    /// The format of the number is defined by DATA TYPE.
    /// This field has no meaning for a Data Type of DS_BIT_FIELD or DS_ASCII.
    /// For Data Types less than 32-bits, the Most Significant Bytes shall be padded with 0x00 out to 32-bits.
    /// For example, an 8-bit data value of 0x12 shall be represented in the field as: 0x00000012.
    public var minValidValue: UInt32
    
    /// This is a 32-bit field that represents the highest value that data can reach.
    /// The format of the number is defined by DATA TYPE.
    /// This field has no meaning for a Data Type of DS_BIT_FIELD or DS_ASCII.
    /// For Data Types less than 32-bits, the Most Significant Bytes shall be padded with 0x00 out to 32-bits.
    /// For example, an 8-bit data value of 0x12 shall be represented in the field as: 0x00000012.
    public var maxValidValue: UInt32
    
    /// This is a 32-bit field that represents the default value of that data.
    /// This field has no meaning for a Data Type of DS_BIT_FIELD or DS_ASCII.
    /// The default value shall be within the minimum and maximum range.
    /// For Data Types less than 32-bits, the Most Significant Bytes shall be padded with 0x00 out to 32-bits.
    /// For example, an 8-bit data value of 0x12 shall be represented in the field as: 0x00000012.
    public var maxDefaultValue: UInt32
    
    /// The Description field is used to describe the function of the specified PID. This text field shall be variable up to 32 characters in length.
    public var description: String
    
    // MARK: - Initialization
    
    public init(pidRequested: ParameterID,
                pldSize: UInt8,
                dataType: DataType,
                commandClass: ParameterDescriptionCommandClass,
                unit: SensorUnit,
                prefix: SensorUnitPrefix,
                minValidValue: UInt32,
                maxValidValue: UInt32,
                maxDefaultValue: UInt32,
                description: String) {
        assert(ParameterID.manufacturerSpecific.contains(pidRequested))
        self.pidRequested = pidRequested
        self.pldSize = pldSize
        self.dataType = dataType
        self.commandClass = commandClass
        self.filler = 0x00
        self.unit = unit
        self.prefix = prefix
        self.minValidValue = minValidValue
        self.maxValidValue = maxValidValue
        self.maxDefaultValue = maxDefaultValue
        self.description = description
    }
}

// MARK: - Data

extension ParameterDescription {
    
    internal static var descriptionMaxLength: Int { return 52 }
    
    internal static var maxLength: Int { return 52 }
    
    internal static var minLength: Int { return 20 }
    
    init?(data: Data) {
        guard data.count > type(of: self).minLength, data.count <= type(of: self).maxLength
            else { return nil }
        let descriptionLength = data.count - type(of: self).minLength
        let parameterID = ParameterID(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))))
        assert(ParameterID.manufacturerSpecific.contains(parameterID))
        self.pidRequested = parameterID
        self.pldSize = data[2]
        self.dataType = DataType(rawValue: data[3])
        guard let pdCommandClass = ParameterDescriptionCommandClass(rawValue: data[4])
            else { return nil }
        self.commandClass = pdCommandClass
        self.filler = data[5]
        assert(data[5] == 0)
        self.unit = SensorUnit(rawValue: data[6])
        guard let sensorPrefix = SensorUnitPrefix(rawValue: data[7])
            else { return nil }
        self.prefix = sensorPrefix
        self.minValidValue = UInt32(bigEndian: UInt32(bytes: (data[8], data[9], data[10], data[11])))
        self.maxValidValue = UInt32(bigEndian: UInt32(bytes: (data[12], data[13], data[14], data[15])))
        self.maxDefaultValue = UInt32(bigEndian: UInt32(bytes: (data[16], data[17], data[18], data[19])))
        if descriptionLength > 0 {
            guard let string = String(data: data.subdataNoCopy(in: type(of: self).minLength ..< data.count), encoding: .utf8)
                else { return nil }
            self.description = string
        } else {
            self.description = ""
        }
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ParameterDescription: DataConvertible {
    
    var dataLength: Int {
        return ParameterDescription.minLength + description.utf8.count
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.pidRequested.rawValue.bigEndian
        data += value.pldSize
        data += value.dataType.rawValue
        data += value.commandClass.rawValue
        data += value.filler
        data += value.unit.rawValue
        data += value.prefix.rawValue
        data += value.minValidValue.bigEndian
        data += value.maxValidValue.bigEndian
        data += value.maxDefaultValue.bigEndian
        let utf8 = value.description
            .prefix(type(of: value).descriptionMaxLength)
            .utf8
        data.append(contentsOf: utf8)
    }
}
