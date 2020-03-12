//
//  StatusType.swift
//  
//
//  Created by Alsey Coleman Miller on 3/12/20.
//

/// RDM Status Type definitions
///
/// - See Also: ANSI E1.20 – 2010, page 103, Table A-4: Status Type Defines
public struct StatusType: RawRepresentable, Equatable, Hashable, Codable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension StatusType: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension StatusType: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension StatusType {
    
    /// None
    ///
    /// - Note: Not allowed for use with `GET: QUEUED_MESSAGE`
    static var none: StatusType { return 0x0000 } // STATUS_NONE
        
    ///
    static var getLastMessage: StatusType { return 0x0001 } // STATUS_GET_LAST_ MESSAGE
    
    // TODO: Complete list
}

// MARK: - Names

public extension StatusType {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [StatusType: String] = [
        .none: "None",
        .getLastMessage: "Get Last Message"
    ]
}
