//
//  SetLampStrikes.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter is used to retrieve the number of lamp strikes or to set the counter in the device to a specific starting value.
 */
public struct SetLampStrikes: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .lampStrikes }
    
    public let lampStrikes: UInt32
    
    // MARK: - Initialization
    
    public init(lampStrikes: UInt32) {
        self.lampStrikes = lampStrikes
    }
}

// MARK: - Data

public extension SetLampStrikes {
    
    internal static var length: Int { return MemoryLayout<UInt32>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(lampStrikes: UInt32(bigEndian: UInt32(bytes: (data[0], data[1], data[2], data[3]))))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetLampStrikes: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt32>.size
    }
    
    static func += (data: inout Data, value: SetLampStrikes) {
        data += value.lampStrikes.bigEndian
    }
}
