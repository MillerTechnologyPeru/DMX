//
//  SetDMX512StartingAddress.swift
//  
//
//  Created by Jorge Loc Rubio on 4/10/20.
//

import Foundation

/**
 This parameter is used to set or get the DMX512 start address.
 
 The DMX512 Starting Address can also be retrieved as part of the `DEVICE_INFO` Parameter Message in Section 10.5.1.
 When this message is directed to a Root Device or Sub-Device that has a DMX512 Footprint of 0 for that Root or Sub-Device, then the response shall be set to `0xFFFF`.
 The returned data represents the address in the range 1 to 512.
 */
public struct SetDMX512StartingAddress: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .dmxStartAddress }
    
    public let address: UInt16
    
    internal static var range: Range<UInt16> { return 0x0000 ..< 0x0201 }
    
    // MARK: - Initialization
    
    public init(address: UInt16) {
        assert(SetDMX512StartingAddress.range.contains(address))
        self.address = address
    }
}

// MARK: - Data

public extension SetDMX512StartingAddress {
    
    internal static var length: Int { return MemoryLayout<UInt16>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(address: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetDMX512StartingAddress: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt16>.size
    }
    
    static func += (data: inout Data, value: SetDMX512StartingAddress) {
        data += value.address.bigEndian
    }
}
