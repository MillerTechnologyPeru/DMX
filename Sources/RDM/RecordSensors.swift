//
//  RecordSensors.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter instructs devices such as dimming racks that monitor load changes to store the current value for monitoring sensor changes.
 
 The Sensor Number identifies the sensor that is recorded.
 A Sensor Number value of `0xFF` indicates that all sensors shall be recorded.
 Any values recorded in this manner shall be available for retrieval using the `GET: SENSOR_VALUE` message.
 */
public struct RecordSensors: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .recordSensors }
    
    public let sensorNumber: SensorNumber
    
    // MARK: - Initialization
    
    public init(sensorNumber: SensorNumber) {
        self.sensorNumber = sensorNumber
    }
}

public extension RecordSensors {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<SensorNumber>.size
            else { return nil }
        self.init(sensorNumber: SensorNumber(rawValue: data[0]))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension RecordSensors: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<SensorNumber>.size
    }
    
    static func += (data: inout Data, value: RecordSensors) {
        data += value.sensorNumber.rawValue
    }
}
