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
public enum SensorUnitPrefix: UInt8, Equatable {
    
    /// None
    ///
    /// Multiply by 10 ^ 0
    case none = 0x00  // UNITS_NONE
    
    /// Deci
    ///
    /// Multiply by 10 ^ -1
    case deci = 0x01  // PREFIX_DECI
    
    /// Centi
    ///
    /// Multiply by 10 ^ -2
    case centi = 0x02  // PREFIX_CENTI
    
    /// Milli
    ///
    /// Multiply by 10 ^ -3
    case milli = 0x03  // PREFIX_MILLI
    
    /// Micro
    ///
    /// Multiply by 10 ^ -6
    case micro = 0x04  // PREFIX_MICRO
    
    /// Nano
    ///
    /// Multiply by 10 ^ -9
    case nano = 0x05  // PREFIX_NANO
    
    /// Pico
    ///
    /// Multiply by 10 ^ -12
    case pico = 0x06  // PREFIX_PICO
    
    /// Fempto
    ///
    /// Multiply by 10 ^ -15
    case fempto = 0x07  // PREFIX_FEMPTO
    
    /// Atto
    ///
    /// Multiply by 10 ^ -18
    case atto = 0x08  // PREFIX_ATTO
    
    /// Zepto
    ///
    /// Multiply by 10 ^ -21
    case zepto = 0x09  // PREFIX_ZEPTO
    
    /// Yocto
    ///
    /// Multiply by 10 ^ -24
    case yocto = 0x0A  // PREFIX_YOCTO
    
    /// Deca
    ///
    /// Multiply by 10 ^ 1
    case deca = 0x11  // PREFIX_DECA
    
    /// Hecto
    ///
    /// Multiply by 10 ^ 2
    case hecto = 0x12  // PREFIX_HECTO
    
    /// Kilo
    ///
    /// Multiply by 10 ^ 3
    case kilo = 0x13  // PREFIX_KILO
    
    /// Mega
    ///
    /// Multiply by 10 ^ 6
    case mega = 0x14  // PREFIX_MEGA
    
    /// Giga
    ///
    /// Multiply by 10 ^ 9
    case giga = 0x15  // PREFIX_GIGA
    
    /// Terra
    ///
    /// Multiply by 10 ^ 12
    case terra = 0x16  // PREFIX_TERRA
    
    /// Peta
    ///
    /// Multiply by 10 ^ 15
    case peta = 0x17  // PREFIX_PETA
    
    /// Exa
    ///
    /// Multiply by 10 ^ 18
    case exa = 0x18  // PREFIX_EXA
    
    /// Zetta
    ///
    /// Multiply by 10 ^ 21
    case zetta = 0x19  // PREFIX_ZETTA
    
    /// Yotta
    ///
    /// Multiply by 10 ^ 24
    case yotta = 0x1A  // PREFIX_YOTTA
}
