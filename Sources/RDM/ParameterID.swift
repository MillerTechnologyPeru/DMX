//
//  ParameterID.swift
//  
//
//  Created by Alsey Coleman Miller on 3/12/20.
//

/// RDM  Categories/Parameter ID definitions
///
/// - SeeAlso: ANSI E1.20 – 2010, page 102, Table A-3: RDM Categories Defines
public struct ParameterID: RawRepresentable, Equatable, Hashable, Codable {
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension ParameterID: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension ParameterID: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension ParameterID {
    
    // MARK: Network Management
    
    /// Unique Branch
    static var uniqueBranch: ParameterID { return 0x0001 } // DISC_UNIQUE_BRANCH
        
    /// Mute
    static var mute: ParameterID { return 0x0002 } // DISC_MUTE
    
    // TODO: Complete list
}

// MARK: - Names

public extension ParameterID {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [ParameterID: String] = [
        .uniqueBranch: "Unique Branch",
        .mute: "Mute"
    ]
}

// MARK: - Get

public extension ParameterID {
    
    var getAllowed: Bool {
        return type(of: self).getAllowed.contains(self)
    }
    
    internal static let getAllowed: Set<ParameterID> = [
        // .proxiedDevices
    ]
}

// MARK: - Set

public extension ParameterID {
    
    var setAllowed: Bool {
        return type(of: self).setAllowed.contains(self)
    }
    
    internal static let setAllowed: Set<ParameterID> = [
        // .commsStatus
    ]
}
