//
//  ResetDevice.swift
//  
//
//  Created by Jorge Loc Rubio on 4/17/20.
//

import Foundation

/**
 This parameter is used to instruct the responder to reset itself.
 This parameter shall also clear the` Discovery Mute flag`.
 A cold reset is the equivalent of removing and reapplying power to the device.
 */
public struct ResetDevice: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .resetDevice }
    
    public let resetDevice: Reset
    
    // MARK: - Initialization
    
    public init(resetDevice: Reset) {
        self.resetDevice = resetDevice
    }
}

// MARK: - Data

public extension ResetDevice {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<UInt8>.size,
              let response = Reset(rawValue: data[0])
            else { return nil }
        self.init(resetDevice: response)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ResetDevice: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt8>.size
    }
    
    static func += (data: inout Data, value: ResetDevice) {
        data += value.resetDevice.rawValue
    }
}

// MARK: - Supporting Types

// MARK: - Reset

public extension ResetDevice {
    
    /// Reset
    enum Reset: UInt8 {
        
        /// Warm Reset
        case warmReset      = 0x01
        
        /// Cold Reset
        case coldReset      = 0xFF
    }
}
