//
//  GetDevicePowerCyclesResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter is used to retrieve or set the number of Power-up cycles for the device.
 Some devices may only support the `GET_COMMAND` for this operation and not allow the device’s power-up cycles to be set.
 
 The value for Power Cycle Count shall be unsigned and not roll over when maximum value is reached.
 */
public struct GetDevicePowerCyclesResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .devicePowerCycles }
    
    public let powerCyclesCount: UInt32
    
    // MARK: - Initialization
    
    public init(powerCyclesCount: UInt32) {
        self.powerCyclesCount = powerCyclesCount
    }
}

// MARK: - Data

public extension GetDevicePowerCyclesResponse {
    
    internal static var length: Int { return MemoryLayout<UInt32>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(powerCyclesCount: UInt32(bigEndian: UInt32(bytes: (data[0], data[1], data[2], data[3]))))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetDevicePowerCyclesResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt32>.size
    }
    
    static func += (data: inout Data, value: GetDevicePowerCyclesResponse) {
        data += value.powerCyclesCount.bigEndian
    }
}
