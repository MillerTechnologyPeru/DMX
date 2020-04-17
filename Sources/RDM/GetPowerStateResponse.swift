//
//  GetPowerStateResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/17/20.
//

import Foundation

/**
 This parameter is used to retrieve or change the current device Power State.
 Power State specifies the current operating mode of the device.
 
 Power State Modes are enumerated by `Table A-11`.
 */
public struct GetPowerStateResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .powerState }
    
    public var powerState: PowerState
    
    // MARK: - Initialization
    
    public init(powerState: PowerState) {
        self.powerState = powerState
    }
}

// MARK: - Data

public extension GetPowerStateResponse {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<PowerState>.size,
              let powerState = PowerState(rawValue: data[0])
            else { return nil }
        self.init(powerState: powerState)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetPowerStateResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<PowerState>.size
    }
    
    static func += (data: inout Data, value: GetPowerStateResponse) {
        data += value.powerState.rawValue
    }
}
