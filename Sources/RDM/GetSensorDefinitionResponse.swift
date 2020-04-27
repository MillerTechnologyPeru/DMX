//
//  GetSensorDefinitionResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/14/20.
//

import Foundation

/**
 This parameter is used to retrieve the definition of a specific sensor.
 When this parameter is directed to a Sub-Device, the reply shall be identical for any given sensor number in all Sub- Devices owned by a specific Root Device.
*/
public struct GetSensorDefinitionResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .sensorDefinition }
    
    public let sensorDefinition: SensorDefinition
    
    // MARK: - Initialization
    
    public init(sensorDefinition: SensorDefinition) {
        self.sensorDefinition = sensorDefinition
    }
}

// MARK: - Data

public extension GetSensorDefinitionResponse {
    
    init?(data: Data) {
        guard let sensorDefinition = SensorDefinition(data: data)
            else { return nil }
        self.init(sensorDefinition: sensorDefinition)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetSensorDefinitionResponse: DataConvertible {
    
    var dataLength: Int {
        return sensorDefinition.dataLength
    }
    
    static func += (data: inout Data, value: GetSensorDefinitionResponse) {
        data += value.sensorDefinition
    }
}
