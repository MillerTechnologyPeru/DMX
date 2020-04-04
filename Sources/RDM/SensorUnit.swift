//
//  SensorUnit.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
Sensor Units
- SeeAlso: ANSI E1.20 – 2010, page 113, Table A-13: Sensor Unit Defines
*/
public struct SensorUnit: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension SensorUnit: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension SensorUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension SensorUnit {
    
    /// None
    ///
    /// - SeeAlso: `SensorTypes.contacts`
    static var none: SensorUnit { return 0x00 } // UNITS_NONE
    
    /// Centigrade
    ///
    /// - SeeAlso: `SensorTypes.temperature`
    static var centigrade: SensorUnit { return 0x01 } // UNITS_CENTIGRADE
    
    /// Volts DC
    ///
    /// - SeeAlso: `SensorTypes.voltage`
    static var voltsDC: SensorUnit { return 0x02 } // UNITS_VOLTS_DC
    
    /// Volts AC Peak
    ///
    /// - SeeAlso: `SensorTypes.voltage`
    static var voltsACPeak: SensorUnit { return 0x03 } // UNITS_VOLTS_AC_PEAK
    
    /// Volts AC RMS
    ///
    /// - SeeAlso: `SensorTypes.voltage`
    static var voltsACRms: SensorUnit { return 0x04 } // UNITS_VOLTS_AC_RMS
    
    /// Ampere DC
    ///
    /// - SeeAlso: `SensorTypes.current`
    static var ampereDC: SensorUnit { return 0x05 } // UNITS_AMPERE_DC
    
    /// Ampere AC Peak
    ///
    /// - SeeAlso: `SensorTypes.current`
    static var ampereACPeak: SensorUnit { return 0x06 } // UNITS_AMPERE_AC_PEAK
    
    /// Ampere AC RMS
    ///
    /// - SeeAlso: `SensorTypes.current`
    static var ampereACRms: SensorUnit { return 0x07 } // UNITS_AMPERE_AC_RMS
    
    /// Hertz
    ///
    /// - SeeAlso: `SensorTypes.frequency`
    static var hertz: SensorUnit { return 0x08 } // UNITS_HERTZ
    
    /// OHM
    ///
    /// - SeeAlso: `SensorTypes.resistance`
    static var ohm: SensorUnit { return 0x09 } // UNITS_OHM
    
    /// WATT
    ///
    /// - SeeAlso: `SensorTypes.power`
    static var watt: SensorUnit { return 0x0A } // UNITS_WATT
    
    /// Kilogram
    ///
    /// - SeeAlso: `SensorTypes.mass`
    static var kilogram: SensorUnit { return 0x0B } // UNITS_KILOGRAM
    
    /// Meters
    ///
    /// - SeeAlso: `SensorTypes.length`
    static var meters: SensorUnit { return 0x0C } // UNITS_METERS
    
    /// Meters Squared
    ///
    /// - SeeAlso: `SensorTypes.area`
    static var metersSquared: SensorUnit { return 0x0D } // UNITS_METERS_SQUARED
    
    /// Meters Cubed
    ///
    /// - SeeAlso: `SensorTypes.volume`
    static var metersCubed: SensorUnit { return 0x0E } // UNITS_METERS_CUBED
    
    /// Kilograms Per Meter Cubed
    ///
    /// - SeeAlso: `SensorTypes.density`
    static var kilogramsPerMeterCubed: SensorUnit { return 0x0F } // UNITS_KILOGRAMMES_PER_METER_CUBED
    
    /// Meters Per Second
    ///
    /// - SeeAlso: `SensorTypes.velocity`
    static var metersPerSecond: SensorUnit { return 0x10 } // UNITS_METERS_PER_SECOND
    
    /// Meters Per Second Squared
    ///
    /// - SeeAlso: `SensorTypes.acceleration`
    static var metersPerSecondSquared: SensorUnit { return 0x11 } // UNITS_METERS_PER_SECOND_SQUARED
    
    /// Newton
    ///
    /// - SeeAlso: `SensorTypes.force`
    static var newton: SensorUnit { return 0x12 } // UNITS_NEWTON
    
    /// Joule
    ///
    /// - SeeAlso: `SensorTypes.energy`
    static var joule: SensorUnit { return 0x13 } // UNITS_JOULE
    
    /// Pascal
    ///
    /// - SeeAlso: `SensorTypes.pressure`
    static var pascal: SensorUnit { return 0x14 } // UNITS_PASCAL
    
    /// Second
    ///
    /// - SeeAlso: `SensorTypes.time`
    static var second: SensorUnit { return 0x15 } // UNITS_SECOND
    
    /// Degree
    ///
    /// - SeeAlso: `SensorTypes.angle`
    static var degree: SensorUnit { return 0x16 } // UNITS_DEGREE
    
    /// Steradian
    ///
    /// - SeeAlso: `SensorTypes.angle`
    static var steradian: SensorUnit { return 0x17 } // UNITS_STERADIAN
    
    /// Candela
    ///
    /// - SeeAlso: `SensorTypes.luminousIntensity`
    static var candela: SensorUnit { return 0x18 } // UNITS_CANDELA
    
    /// Lumen
    ///
    /// - SeeAlso: `SensorTypes.luminousFlux`
    static var lumen: SensorUnit { return 0x19 } // UNITS_LUMEN
    
    /// Lux
    ///
    /// - SeeAlso: `SensorTypes.illuminance`
    static var lux: SensorUnit { return 0x1A } // UNITS_LUX
    
    /// Ire
    ///
    /// - SeeAlso: `SensorTypes.chrominance`
    static var ire: SensorUnit { return 0x1B } // UNITS_IRE
    
    /// Byte
    ///
    /// - SeeAlso: `SensorTypes.memory`
    static var byte: SensorUnit { return 0x1C } // UNITS_BYTE
    
    /// Manufacturer-Specific Units `0x80 - 0xFF`
}

// MARK: - Names

public extension SensorUnit {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [SensorUnit: String] = [
        .none: "None",
        .centigrade: "Centigrade",
        .voltsDC: "Volts DC",
        .voltsACPeak: "Volts AC Peak",
        .voltsACRms: "Volts AC RMS",
        .ampereACRms: "Ampere DC",
        .ampereACPeak: "Ampere AC Peak",
        .ampereACRms: "Ampere AC RMS",
        .hertz: "Hertz",
        .ohm: "OHM",
        .watt: "WATT",
        .kilogram: "Kilogram",
        .meters: "Meters",
        .metersSquared: "Meters Squared",
        .metersCubed: "Meters Cubed",
        .kilogramsPerMeterCubed: "Kilograms Per Meter Cubed",
        .metersPerSecond: "Meters Per Second",
        .metersPerSecondSquared: "Meters Per Second Squared",
        .newton: "Newton",
        .joule: "Joule",
        .pascal: "Pascal",
        .second: "Second",
        .degree: "Degree",
        .steradian: "Steradian",
        .candela: "Candela",
        .lumen: "Lumen",
        .lux: "Lux",
        .ire: "Ire",
        .byte: "Byte"
    ]
}
