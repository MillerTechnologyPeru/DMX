//
//  SensorValue.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 Sensor Value
 
 - See Also: ANSI E1.20 – 2010, page 78
*/
public struct SensorValue: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Sensor Number
    ///
    /// The sensor number is in the range `0x00 to 0xFE.`
    /// A value` 0xFF` is used to represent all sensors for the Set command.
    ///
    /// The Sensor Value fields in the response to a SET Command sent to Sensor `0x0FF` shall be ignored by the Controller.
    /// There is no requirement on a responder to provide specific values in this response.”
    public var sensorRequested: SensorNumber
    
    /// Present Value
    ///
    /// This is a 2’s compliment signed 16-bit value that represents the present value of the sensor data.
    public var presentValue: Int16
    
    /// Lowest Detected Value
    ///
    /// This is a 2’s compliment signed 16-bit value that represents the lowest value registered by the sensor.
    /// Support for this data is optional.
    /// If this value is not supported, then this field shall be set to `0x0000.`
    public var lowestDetectedValue: Int16
    
    /// Highest Detected Value
    ///
    /// This is a 2’s compliment signed 16-bit value that represents the highest value registered by the sensor.
    /// Support for this data is optional.
    /// If this value is not supported, then this field shall be set to `0x0000.`
    public var highestDetectedValue: Int16
    
    // RecordedValue
    ///
    /// This is a 2’s compliment signed 16-bit value that represents the value that was recorded when the last `RECORD_SENSORS` was issued.
    /// Support for this data is optional.
    /// If this value is not supported, then this field shall be set to `0x0000.`
    public var recordedValue: Int16
    
    // MARK: - Initialization
    
    public init(sensorRequested: SensorNumber,
                presentValue: Int16,
                lowestDetectedValue: Int16 = 0,
                highestDetectedValue: Int16 = 0,
                recordedValue: Int16 = 0) {
        
        self.sensorRequested = sensorRequested
        self.presentValue = presentValue
        self.lowestDetectedValue = lowestDetectedValue
        self.highestDetectedValue = highestDetectedValue
        self.recordedValue = recordedValue
    }
}

// MARK: - Data

public extension SensorValue {
    
    internal static var length: Int { return 9 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.sensorRequested = SensorNumber(rawValue: data[0])
        self.presentValue = Int16(bigEndian: Int16(bytes: (data[1], data[2])))
        self.lowestDetectedValue = Int16(bigEndian: Int16(bytes: (data[3], data[4])))
        self.highestDetectedValue = Int16(bigEndian: Int16(bytes: (data[5], data[6])))
        self.recordedValue = Int16(bigEndian: Int16(bytes: (data[7], data[8])))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SensorValue: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.sensorRequested.rawValue
        data += UInt16(bigEndian: UInt16 (bitPattern: value.presentValue.bigEndian)).bigEndian
        data += UInt16(bigEndian: UInt16 (bitPattern: value.lowestDetectedValue.bigEndian)).bigEndian
        data += UInt16(bigEndian: UInt16 (bitPattern: value.highestDetectedValue.bigEndian)).bigEndian
        data += UInt16(bigEndian: UInt16 (bitPattern: value.recordedValue.bigEndian)).bigEndian
    }
}
