//
//  PresetLevel.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

/**
Preset Level
 
 A Level value of `0x00` means preset scaled at 0 and a level value of `0xFF` represents a Preset scaled at full.
 
  - SeeAlso: ANSI E1.20 – 2010, page 98
 */
public struct PresetLevel: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension PresetLevel: CustomStringConvertible {
    
    public var description: String {
        return "0x\(rawValue.toHexadecimal())"
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension PresetLevel: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension PresetLevel {
    
    /// zero
    ///
    /// Preset scaled at 0
    static var zero: PresetLevel { return 0x00 }
    
    /// Full
    ///
    /// Preset scaled at full
    static var full: PresetLevel { return 0xFF }
}
