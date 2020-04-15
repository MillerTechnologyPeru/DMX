//
//  GetSensorResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter shall be used to retrieve or reset sensor data.
 */
public struct GetSensorResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .sensorValue }
    
    public let sensorValue: SensorValue
    
    // MARK: - Initialization
    
    public init(sensorValue: SensorValue) {
        self.sensorValue = sensorValue
    }
}

public extension GetSensorResponse {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<SensorValue>.size, let sensorValue = SensorValue(data: data)
            else { return nil }
        self.init(sensorValue: sensorValue)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetSensorResponse: DataConvertible {
    
    var dataLength: Int {
        return sensorValue.dataLength
    }
    
    static func += (data: inout Data, value: GetSensorResponse) {
        data += value.sensorValue
    }
}
