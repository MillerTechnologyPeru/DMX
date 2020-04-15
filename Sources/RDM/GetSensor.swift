//
//  GetSensor.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter shall be used to retrieve or reset sensor data.
 */
public struct GetSensor: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .get }
    
    public static var parameterID: ParameterID { return .sensorValue }
    
    public let sensorRequested: SensorNumber
    
    // MARK: - Initialization
    
    public init(sensorRequested: SensorNumber) {
        assert(SensorNumber.range.contains(sensorRequested))
        self.sensorRequested = sensorRequested
    }
}

public extension GetSensor {
    
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

extension GetSensor: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<SensorNumber>.size
    }
    
    static func += (data: inout Data, value: GetSensor) {
        data += value.sensorRequested.rawValue
    }
}
