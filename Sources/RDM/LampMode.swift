//
//  LampMode.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
Lamp State
- SeeAlso: ANSI E1.20 – 2010, page 109, Table A-9: Lamp On Mode Defines
*/
public struct LampMode: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension LampMode: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension LampMode: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension LampMode {
    
    /// Off
    ///
    /// Lamp Stays off until directly instructed to Strike.
    static var off: LampMode { return 0x00 } // LAMP_ON_MODE_OFF
    
    /// DMX
    ///
    /// Lamp Strikes upon receiving a DMX512 signal.
    static var dmx: LampMode { return 0x00 } // LAMP_ON_MODE_DMX
    
    /// ON
    ///
    /// Lamp Strikes automatically at Power-up.
    static var on: LampMode { return 0x00 } // LAMP_ON_MODE_ON
    
    /// After Calibration
    /// Lamp Strikes after Calibration or Homing procedure.
    static var afterCalibration: LampMode { return 0x00 } // LAMP_ON_MODE_AFTER_CAL
    
    /// Manufacturer-Specific Units `0x80 - 0xDF`
}

// MARK: - Names

public extension LampMode {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [LampMode: String] = [
        .off: "Off",
        .dmx: "DMX",
        .on: "On",
        .afterCalibration: "After Calibration"
    ]
}
