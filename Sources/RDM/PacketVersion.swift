//
//  PacketVersion.swift
//  
//
//  Created by Alsey Coleman Miller on 4/1/20.
//

/// RDM Sub Start Code
///
/// Sub-START Code within RDM that defines this packet structure (SC_SUB_MESSAGE).
/// - Note: Future versions of this standard which may have additional or different packet structures would use this field to identify the packet structure being used.
public struct PacketVersion: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension PacketVersion: CustomStringConvertible {
    
    public var description: String {
        return "0x" + rawValue.toHexadecimal()
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension PacketVersion: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension PacketVersion {
    
    /// Current valid RDM packet version `0x01`.
    static var current: PacketVersion { return 0x01 } // SC_SUB_MESSAGE
}
