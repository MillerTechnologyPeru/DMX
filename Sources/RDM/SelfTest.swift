//
//  SelfTest.swift
//  
//
//  Created by Jorge Loc Rubio on 4/17/20.
//

import Foundation

/**
 Self Test
 
 - See Also: ANSI E1.20 – 2010, page 111 Table A-10: Self Test Defines
 */
public struct SelfTest: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension SelfTest: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension SelfTest: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension SelfTest {
    
    /// Off
    ///
    /// Turns Self Tests Off
    static var off: SelfTest { return 0x00 } // SELF_TEST_OFF
    
    /// All
    ///
    /// Self Test All, if applicable
    static var all: SelfTest { return 0xFF } // SELF_TEST_ALL
    
    /// Various Manufacturer Self Tests
    /// Manufacturer Tests -  `0x01 – 0xFE`
}

// MARK: - Names

public extension SelfTest {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [SelfTest: String] = [
        .off: "Off",
        .all: "All"
    ]
}
