//
//  SubDevice.swift
//  
//
//  Created by Jorge Loc Rubio on 3/30/20.
//

/// RDM Sub Device definitions
///
/// - See Also: ANSI E1.20 – 2010, page 21
public struct SubDevice: RawRepresentable, Equatable, Hashable, Codable {
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension SubDevice: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension SubDevice: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension SubDevice {
    
    /// Root Device
    static var root: SubDevice { return 0x0000 } // ROOT
    
    /// Sub Device All Call
    static var allCall: SubDevice { return 0xFFFF } // SUB_DEVICE_ALL_CALL
}

// MARK: - Names

public extension SubDevice {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [SubDevice: String] = [
        .root: "Root Device",
        .allCall: "Sub Device All Call"
    ]
}
