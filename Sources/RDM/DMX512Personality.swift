//
//  DMX512Personality.swift
//  
//
//  Created by Jorge Loc Rubio on 4/7/20.
//

/**
 DMX512 Personality

 The 16-bit field is encoded into two 8-bit fields.
 
 - SeeAlso: ANSI E1.20 – 2010, Page 59
 */
public struct DMX512Personality: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Current Personality
    public var current: UInt8
    
    /// Total number of Personalities
    public var total: UInt8
    
    // MARK: - Initialization
    
    /// Initialize with major and minor versions
    init(current: UInt8, total: UInt8) {
        self.current = current
        self.total = total
    }
}

// MARK: - RawRepresentable

extension DMX512Personality: RawRepresentable {
    
    // MARK: - Initialization
    
    public init(rawValue: UInt16) {
        let bytes = rawValue.bigEndian.bytes
        self.init(current: bytes.0, total: bytes.1)
    }
    
    public var rawValue: UInt16 {
        return UInt16(bigEndian: UInt16(bytes: (current, total)))
    }
}

// MARK: - CustomStringConvertible

extension DMX512Personality: CustomStringConvertible {
    
    public var description: String {
        return "Current Personality \(current), Total \(total) of Personalities"
    }
}
