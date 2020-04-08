//
//  DMX512Footprint.swift
//  
//
//  Created by Jorge Loc Rubio on 4/8/20.
//

/**
 DMX512 Footprint
 
 This field specifies the DMX512 footprint (number of consecutive DMX512 slots required).
 This information can be used in conjunction with `DMX_START_ADDRESS` for auto-patching capabilities.
 */
public struct DMX512Footprint: RawRepresentable, Equatable, Hashable {
    
    // MARK: - Properties
    
    public var rawValue: UInt16
    
    // MARK: - Initialization
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension DMX512Footprint: CustomStringConvertible {
    
    public var description: String {
        return "0x" + rawValue.toHexadecimal()
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension DMX512Footprint: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - Comparable

extension DMX512Footprint: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

// MARK: - Definitions

public extension DMX512Footprint {
    
    /// Null Start Code
    static var nullStartCode: DMX512Footprint { return 0x0000 }
    
    /// Range
    static var range: Range<DMX512Footprint> { return 0x0000 ..< 0x0201 }
}
