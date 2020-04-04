//
//  DataType.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
Data Type
- SeeAlso: ANSI E1.20 – 2010, page 115, Table A-15: Data Type Defines
*/
public struct DataType: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension DataType: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension DataType: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension DataType {
    
    /// Not Defined
    ///
    /// Data type is not defined
    static var notDefined: DataType { return 0x00 } // DS_NOT_DEFINED
    
    /// Bit Field
    ///
    /// Data is bit packed
    static var bitField: DataType { return 0x01 } // DS_BIT_FIELD
    
    /// ASCII
    ///
    /// Data is a string
    static var ascii: DataType { return 0x02 } // DS_ASCII
    
    /// Unsigned Byte
    ///
    /// Data is an array of unsigned bytes
    static var unsignedByte: DataType { return 0x03 } // DS_UNSIGNED_BYTE
    
    /// Signed Byte
    ///
    /// Data is an array of signed bytes
    static var signedByte: DataType { return 0x04 } // DS_SIGNED_BYTE
    
    /// Unsigned Word
    ///
    /// Data is an array of unsigned 16-bit words
    static var unsignedWord: DataType { return 0x05 } // DS_UNSIGNED_WORD
    
    /// Signed Word
    ///
    /// Data is an array of signed 16-bit words
    static var signedWord: DataType { return 0x06 } // DS_SIGNED_WORD
    
    /// Unsigned DWord
    ///
    /// Data is an array of unsigned 32-bit words
    static var unsignedDword: DataType { return 0x07 } // DS_UNSIGNED_DWORD
    
    /// Signed DWord
    ///
    /// Data is an array of signed 32-bit words
    static var signedDword: DataType { return 0x08 } // DS_SIGNED_DWORD
    
    /// Manufacturer-Specific Units `0x80 - 0xDF`
}

// MARK: - Names

public extension DataType {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [DataType: String] = [
        .notDefined: "Not Defined",
        .bitField: "Bit Field",
        .ascii: "ASCII",
        .unsignedByte: "Unsigned Byte",
        .signedByte: "Signed Byte",
        .unsignedWord: "Unsigned Word",
        .signedWord: "Signed Word",
        .unsignedDword: "Unsigned DWord",
        .signedDword: "Signed DWord"
    ]
}
