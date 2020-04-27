//
//  SetSensorResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter shall be used to retrieve or reset sensor data.
 
 The` SET_COMMAND` may be used in conjunction with `SENSOR_VALUE` to reset or clear a given sensor.
 When a sensor is successfully reset the values for Present, Lowest/Highest, Recorded values in the response message shall all be equal.
 */
public struct SetSensorResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .setResponse }
    
    public static var parameterID: ParameterID { return .sensorValue }
    
    public let sensorValue: SensorValue
    
    // MARK: - Initialization
    
    public init(sensorValue: SensorValue) {
        self.sensorValue = sensorValue
    }
}

public extension SetSensorResponse {
    
    init?(data: Data) {
        guard let sensorValue = SensorValue(data: data)
            else { return nil }
        self.init(sensorValue: sensorValue)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetSensorResponse: DataConvertible {
    
    var dataLength: Int {
        return sensorValue.dataLength
    }
    
    static func += (data: inout Data, value: SetSensorResponse) {
        data += value.sensorValue
    }
}
