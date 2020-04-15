//
//  LampState.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
Lamp State
- SeeAlso: ANSI E1.20 – 2010, page 109, Table A-8: Lamp State Defines
*/
public struct LampState: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension LampState: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension LampState: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension LampState {
    
    /// Off
    ///
    /// No demonstrable light output
    static var off: LampState { return 0x00 } // LAMP_OFF
    
    /// On
    static var on: LampState { return 0x01 } // LAMP_ON
    
    /// Strike
    ///
    /// Arc-Lamp ignite
    static var strike: LampState { return 0x02 } // LAMP_STRIKE
    
    /// Standby
    ///
    /// Arc-Lamp Reduced Power Mode
    static var standby: LampState { return 0x03 } // LAMP_STANDBY
    
    /// Not Present
    ///
    /// Lamp not installed
    static var notPresent: LampState { return 0x04 } // LAMP_NOT_PRESENT
    
    /// Error
    static var error: LampState { return 0x7F } // LAMP_ERROR
    
    /// Manufacturer-Specific Units `0x80 - 0xDF`
}

// MARK: - Names

public extension LampState {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [LampState: String] = [
        .off: "Off",
        .on: "On",
        .strike: "Strike",
        .standby: "Standby",
        .notPresent: "Not Present",
        .error: "Error"
    ]
}
