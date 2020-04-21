//
//  SensorDefinition.swift
//  
//
//  Created by Jorge Loc Rubio on 4/14/20.
//

import Foundation

/**
 Sensor Definition
 
 - See Also: ANSI E1.20 – 2010, page 75
*/
public struct SensorDefinition: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Sensor Requested
    ///
    /// The sensor number requested is in the range from `0x00 to 0xFE.`
    public var sensorRequested: SensorNumber
    
    /// Sensor Type
    ///
    /// Type is an unsigned 8-bit value enumerated by `Table A-12`.
    /// It defines the type of data that is measured by the sensor.
    public var sensorType: SensorType
    
    /// Unit
    ///
    /// Unit is an unsigned 8-bit value enumerated by `Table A-13`.
    /// It defines the SI unit of the sensor data.
    public var unit: SensorUnit
    
    /// Prefix
    /// Prefix is an unsigned 8 bit value enumerated by `Table A-14`.
    /// It defines the SI Prefix and multiplication factor of the units.
    public var prefix: SensorUnitPrefix
    
    /// Range Minimun Value
    ///
    /// This is a 2’s compliment signed 16-bit value that represents the lowest value the sensor can report.
    /// A value of `–32768` indicates that the minimum is not defined.
    public var rangeMinimumValue: Int16
    
    /// Range Minimun Value
    ///
    /// This is a 2’s compliment signed 16-bit value that represents the highest value the sensor can report.
    /// This also defines the maximum capacity. A value of `+32767` indicates that the maximum is not defined.
    public var rangeMaximumValue: Int16
    
    /// Range Minimun Value
    ///
    /// This is a 2’s compliment signed 16-bit value that defines the lowest sensor value for which the device is in normal operation.
    /// A value of `–32768` indicates that the minimum is not defined.
    public var normalMinimumValue: Int16
    
    /// Range Minimun Value
    ///
    /// This is a 2’s compliment signed 16-bit value that defines the highest value that for which the device is in normal operation.
    /// A value of `+32767` indicates that the maximum is not defined.
    public var normalMaximumValue: Int16
    
    
    /// RecordedValueSupport
    ///
    /// This field is a bit-masked field to indicate the support for recorded values.
    /// The Detected and Recorded Value fields are described in Section 10.7.2 `Get/Set Sensor`.
    public var recordedValueSupport: BitMaskOptionSet<RecordedValueSupport>
    
    /// Description
    ///
    /// The Description field is used to describe the function of the specified Sensor.
    /// This text field shall be variable up to 32 characters in length.
    public var description: TextDescription
    
    // MARK: - Initialization
    
    public init(sensorRequested: SensorNumber,
                sensorType: SensorType,
                unit: SensorUnit,
                prefix: SensorUnitPrefix,
                rangeMinimumValue: Int16,
                rangeMaximumValue: Int16,
                normalMinimumValue: Int16,
                normalMaximumValue: Int16,
                recordedValueSupport: BitMaskOptionSet<RecordedValueSupport>,
                description: TextDescription) {
        
        assert(SensorNumber.range.contains(sensorRequested))
        self.sensorRequested = sensorRequested
        self.sensorType = sensorType
        self.unit = unit
        self.prefix = prefix
        self.rangeMinimumValue = rangeMinimumValue
        self.rangeMaximumValue = rangeMaximumValue
        self.normalMinimumValue = normalMinimumValue
        self.normalMaximumValue = normalMaximumValue
        self.recordedValueSupport = recordedValueSupport
        self.description = description
    }
}

// MARK: - Data

public extension SensorDefinition {
    
    internal static var maxLength: Int { return 45 } // 2D
    
    internal static var minLength: Int { return 13 } // 0D
    
    init?(data: Data) {
        guard data.count >= type(of: self).minLength,
              data.count <= type(of: self).maxLength
            else { return nil }
        let sensorNumber = SensorNumber(rawValue: data[0])
        assert(SensorNumber.range.contains(sensorNumber))
        self.sensorRequested = sensorNumber
        self.sensorType = SensorType(rawValue: data[1])
        self.unit = SensorUnit(rawValue: data[2])
        guard let sensorPrefix = SensorUnitPrefix(rawValue: data[3])
        else { return nil }
        self.prefix = sensorPrefix
        self.rangeMinimumValue = Int16(bigEndian: Int16(bytes: (data[4], data[5])))
        self.rangeMaximumValue = Int16(bigEndian: Int16(bytes: (data[6], data[7])))
        self.normalMinimumValue = Int16(bigEndian: Int16(bytes: (data[8], data[9])))
        self.normalMaximumValue = Int16(bigEndian: Int16(bytes: (data[10], data[11])))
        self.recordedValueSupport = BitMaskOptionSet<RecordedValueSupport>(rawValue: data[12])
        self.description = TextDescription(data: data.subdataNoCopy(in: type(of: self).minLength ..< data.count)) ?? ""
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SensorDefinition: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).minLength + description.dataLength
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.sensorRequested.rawValue
        data += value.sensorType.rawValue
        data += value.unit.rawValue
        data += value.prefix.rawValue
        data += UInt16(bigEndian: UInt16 (bitPattern: value.rangeMinimumValue.bigEndian)).bigEndian
        data += UInt16(bigEndian: UInt16 (bitPattern: value.rangeMaximumValue.bigEndian)).bigEndian
        data += UInt16(bigEndian: UInt16 (bitPattern: value.normalMinimumValue.bigEndian)).bigEndian
        data += UInt16(bigEndian: UInt16 (bitPattern: value.normalMaximumValue.bigEndian)).bigEndian
        data += value.recordedValueSupport.rawValue
        data += value.description
        
    }
}


// MARK: - Supporting Types

// MARK: - RecordedValueSupport

public extension SensorDefinition {
    
    /// Recorded Value Support
    enum RecordedValueSupport: UInt8, Codable, CaseIterable, BitMaskOption {
        
        /// Recorded Value Supported
        case recordedValueSupported     = 0b00000001
        
        /// Lowest / Highest Detected Values Supported
        case detectedValuesSupported    = 0b00000010
        
        /// Bits 7-2
        /// Reserved (Always set to 0)
    }
}
