//
//  SensorNumber.swift
//  
//
//  Created by Jorge Loc Rubio on 4/14/20.
//

import Foundation

/**
Sensor Number
- SeeAlso: ANSI E1.20 – 2010, page 75
*/
public struct SensorNumber: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension SensorNumber: CustomStringConvertible {
    
    public var description: String {
        return "0x" + rawValue.toHexadecimal()
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension SensorNumber: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Comparable

extension SensorNumber: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

// MARK: - Definitions

public extension SensorNumber {
    
    /// All sensors
    ///
    /// Only usable on Set command.
    static var allSensors: SensorNumber { return 0xFF }
    
    /// Range
    static var range: Range<SensorNumber> { return 0x00 ..< 0xFF }
}
