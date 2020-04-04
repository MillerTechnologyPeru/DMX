//
//  SensorUnitPrefix.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
Sensor Units Prefix
 
When a prefix is used with MEMORY, the multiplier refers to binary multiple. i.e. KILO means multiply by 1024.
 
When a prefix is used with MASS, note that the UNIT is Kilogram. The prefix PREFIX_MILLI is used to denote grams.
 
- SeeAlso: ANSI E1.20 – 2010, page 114, Table A-14: Sensor Unit Prefix Defines
*/
public struct SensorUnitPrefix: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension SensorUnitPrefix: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension SensorUnitPrefix: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension SensorUnitPrefix {
    
    /// None
    ///
    /// Multiply by 10 ^ 0
    static var none: SensorUnitPrefix { return 0x00 } // UNITS_NONE
    
    /// Deci
    ///
    /// Multiply by 10 ^ -1
    static var deci: SensorUnitPrefix { return 0x01 } // PREFIX_DECI
    
    /// Centi
    ///
    /// Multiply by 10 ^ -2
    static var centi: SensorUnitPrefix { return 0x02 } // PREFIX_CENTI
    
    /// Milli
    ///
    /// Multiply by 10 ^ -3
    static var milli: SensorUnitPrefix { return 0x03 } // PREFIX_MILLI
    
    /// Micro
    ///
    /// Multiply by 10 ^ -6
    static var micro: SensorUnitPrefix { return 0x04 } // PREFIX_MICRO
    
    /// Nano
    ///
    /// Multiply by 10 ^ -9
    static var nano: SensorUnitPrefix { return 0x05 } // PREFIX_NANO
    
    /// Pico
    ///
    /// Multiply by 10 ^ -12
    static var pico: SensorUnitPrefix { return 0x06 } // PREFIX_PICO
    
    /// Fempto
    ///
    /// Multiply by 10 ^ -15
    static var fempto: SensorUnitPrefix { return 0x07 } // PREFIX_FEMPTO
    
    /// Atto
    ///
    /// Multiply by 10 ^ -18
    static var atto: SensorUnitPrefix { return 0x08 } // PREFIX_ATTO
    
    /// Zepto
    ///
    /// Multiply by 10 ^ -21
    static var zepto: SensorUnitPrefix { return 0x09 } // PREFIX_ZEPTO
    
    /// Yocto
    ///
    /// Multiply by 10 ^ -24
    static var yocto: SensorUnitPrefix { return 0x0A } // PREFIX_YOCTO
    
    /// Deca
    ///
    /// Multiply by 10 ^ 1
    static var deca: SensorUnitPrefix { return 0x11 } // PREFIX_DECA
    
    /// Hecto
    ///
    /// Multiply by 10 ^ 2
    static var hecto: SensorUnitPrefix { return 0x12 } // PREFIX_HECTO
    
    /// Kilo
    ///
    /// Multiply by 10 ^ 3
    static var kilo: SensorUnitPrefix { return 0x13 } // PREFIX_KILO
    
    /// Mega
    ///
    /// Multiply by 10 ^ 6
    static var mega: SensorUnitPrefix { return 0x14 } // PREFIX_MEGA
    
    /// Giga
    ///
    /// Multiply by 10 ^ 9
    static var giga: SensorUnitPrefix { return 0x15 } // PREFIX_GIGA
    
    /// Terra
    ///
    /// Multiply by 10 ^ 12
    static var terra: SensorUnitPrefix { return 0x16 } // PREFIX_TERRA
    
    /// Peta
    ///
    /// Multiply by 10 ^ 15
    static var peta: SensorUnitPrefix { return 0x17 } // PREFIX_PETA
    
    /// Exa
    ///
    /// Multiply by 10 ^ 18
    static var exa: SensorUnitPrefix { return 0x18 } // PREFIX_EXA
    
    /// Zetta
    ///
    /// Multiply by 10 ^ 21
    static var zetta: SensorUnitPrefix { return 0x19 } // PREFIX_ZETTA
    
    /// Yotta
    ///
    /// Multiply by 10 ^ 24
    static var yotta: SensorUnitPrefix { return 0x1A } // PREFIX_YOTTA
    
}

// MARK: - Names

public extension SensorUnitPrefix {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [SensorUnitPrefix: String] = [
        .none: "None",
        .deci: "Deci",
        .centi: "Centi",
        .milli: "Milli",
        .micro: "Micro",
        .nano: "Nano",
        .pico: "Pico",
        .fempto: "Fempto",
        .atto: "Atto",
        .zepto: "Zepto",
        .yocto: "Yocto",
        .deca: "Deca",
        .hecto: "Hecto",
        .kilo: "Kilo",
        .mega: "Mega",
        .terra: "Terra",
        .peta: "Peta",
        .exa: "Exa",
        .zetta: "Zetta",
        .yotta: "Yotta"
    ]
}
