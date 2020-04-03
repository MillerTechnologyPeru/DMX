//
//  SlotIDType.swift
//  
//
//  Created by Jorge Loc Rubio on 4/2/20.
//

import Foundation

/**
 Defines the available Slot Types.
 */
public struct SlotIDType: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension SlotIDType: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension SlotIDType: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension SlotIDType {
    
    /// Primary
    ///
    /// Slot directly controls parameter (represents Coarse for 16-bit parameters)
    static var primary: SlotIDType { return 0x00 } // ST_PRIMARY
    
    /// Secondary Fine
    ///
    /// Fine, for 16-bit parameters
    static var secFine: SlotIDType { return 0x01 } // ST_SEC_FINE
    
    /// Secondary Timing
    ///
    /// Slot sets timing value for associated parameter
    static var secTiming: SlotIDType { return 0x02 } // ST_SEC_TIMING
    
    /// Secondary Speed
    ///
    /// Slot sets speed/velocity for associated parameter
    static var secSpeed: SlotIDType { return 0x03 } // ST_SEC_SPEED
    
    /// Secondary Control
    ///
    /// Slot provides control/mode info for parameter
    static var secControl: SlotIDType { return 0x04 } // ST_SEC_CONTROL
    
    /// Secondary Index
    ///
    /// Slot sets index position for associated parameter
    static var secIndex: SlotIDType { return 0x05 } // ST_SEC_INDEX
    
    /// Secondary Rotation
    ///
    /// Slot sets rotation speed for associated parameter
    static var secRotation: SlotIDType { return 0x06 } // ST_SEC_ROTATION
    
    /// Secondary Index Rotate
    ///
    /// Combined index/rotation control
    static var secIndexRotate: SlotIDType { return 0x07 } // ST_SEC_INDEX_ROTATE
    
    /// Secondary Undefined
    ///
    /// Undefined secondary type
    static var secUndenifed: SlotIDType { return 0xFF } // ST_SEC_UNDEFINED
}

// MARK: - Names

public extension SlotIDType {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [SlotIDType: String] = [
        .primary: "Primary",
        .secFine: "Secondary Fine",
        .secTiming: "Secondary Timing",
        .secSpeed: "Secondary Speed",
        .secControl: "Secondary Control",
        .secIndex: "Secondary Index",
        .secRotation: "Secondary Rotation",
        .secIndexRotate: "Secondary Index Rotate",
        .secUndenifed: "Undefined"
    ]
}
