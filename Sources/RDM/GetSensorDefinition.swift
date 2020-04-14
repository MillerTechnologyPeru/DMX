//
//  GetSensorDefinition.swift
//  
//
//  Created by Jorge Loc Rubio on 4/14/20.
//

import Foundation

/**
 This parameter is used to retrieve the definition of a specific sensor.
 When this parameter is directed to a Sub-Device, the reply shall be identical for any given sensor number in all Sub- Devices owned by a specific Root Device.
*/
public struct GetSensorDefinition: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .get }
    
    public static var parameterID: ParameterID { return .sensorDefinition }
    
    public let sensorRequested: SensorNumber
    
    // MARK: - Initialization
    
    public init(sensorRequested: SensorNumber) {
        assert(SensorNumber.range.contains(sensorRequested))
        self.sensorRequested = sensorRequested
    }
}

// MARK: - Data

public extension GetSensorDefinition {
    
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

extension GetSensorDefinition: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<SensorNumber>.size
    }
    
    static func += (data: inout Data, value: GetSensorDefinition) {
        data += value.sensorRequested.rawValue
    }
}
