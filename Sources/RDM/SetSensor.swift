//
//  SetSensor.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter shall be used to retrieve or reset sensor data.
 
 The `SET_COMMAND` may be used in conjunction with `SENSOR_VALUE` to reset or clear a given sensor.
 When a sensor is successfully reset the values for Present, Lowest/Highest, Recorded values in the response message shall all be equal.
 */
public struct SetSensor: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .sensorValue }
    
    public let sensorRequested: SensorNumber
    
    // MARK: - Initialization
    
    public init(sensorRequested: SensorNumber) {
        self.sensorRequested = sensorRequested
    }
}

public extension SetSensor {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<SensorNumber>.size
            else { return nil }
        self.init(sensorRequested: SensorNumber(rawValue: data[0]))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetSensor: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<SensorNumber>.size
    }
    
    static func += (data: inout Data, value: SetSensor) {
        data += value.sensorRequested.rawValue
    }
}
