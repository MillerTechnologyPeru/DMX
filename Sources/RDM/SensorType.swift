//
//  SensorType.swift
//  
//
//  Created by Jorge Loc Rubio on 4/14/20.
//

import Foundation

/**
Sensor Type
- SeeAlso: ANSI E1.20 – 2010, page 111, Table A-12: Sensor Type Defines
*/
public struct SensorType: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension SensorType: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension SensorType: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - Comparable

extension SensorType: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

// MARK: - Definitions

public extension SensorType {
    
    /// Temperature
    static var temperature: SensorType { return 0x00 } // SENS_TEMPERATURE
    
    /// Voltage
    static var voltage: SensorType { return 0x01 } // SENS_VOLTAGE
    
    /// Current
    static var current: SensorType { return 0x02 } // SENS_CURRENT
    
    /// Frequency
    static var frequency: SensorType { return 0x03 } // SENS_FREQUENCY
    
    /// Resistance
    ///
    /// Eg: Cable resistance
    static var resistance: SensorType { return 0x04 } // SENS_RESISTANCE
    
    /// Power
    static var power: SensorType { return 0x05 } // SENS_POWER
    
    /// Mass
    ///
    /// Eg: Truss load Cell
    static var mass: SensorType { return 0x06 } // SENS_MASS
    
    /// Length
    static var length: SensorType { return 0x07 } // SENS_LENGTH
    
    /// Area
    static var area: SensorType { return 0x08 } // SENS_AREA
    
    /// Volume
    ///
    /// Eg: Smoke Fluid
    static var volume: SensorType { return 0x09 } // SENS_VOLUME
    
    /// Density
    static var density: SensorType { return 0x0A } // SENS_DENSITY
    
    /// Velocity
    static var velocity: SensorType { return 0x0B } // SENS_VELOCITY
    
    /// Acceleration
    static var acceleration: SensorType { return 0x0C } // SENS_ACCELERATION
    
    /// Force
    static var force: SensorType { return 0x0D } // SENS_FORCE
    
    /// Energy
    static var energy: SensorType { return 0x0E } // SENS_ENERGY
    
    /// Pressure
    static var pressure: SensorType { return 0x0F } // SENS_PRESSURE
    
    /// Time
    static var time: SensorType { return 0x10 } // SENS_TIME
    
    /// Angle
    static var angle: SensorType { return 0x11 } // SENS_ANGLE
    
    /// Position X
    ///
    /// E.g.: Lamp position on Truss
    static var positionX: SensorType { return 0x12 } // SENS_POSITION X
    
    /// Position Y
    static var positionY: SensorType { return 0x13 } // SENS_POSITION Y
    
    /// Position Z
    static var positionZ: SensorType { return 0x14 } // SENS_POSITION Z
    
    /// Angular Velocity
    ///
    /// E.g.: Wind speed
    static var angularVelocity: SensorType { return 0x15 } // SENS_ANGULAR_VELOCITY
    
    /// Luminous Intensity
    static var luminousIntensity: SensorType { return 0x16 } // SENS_LUMINOUS_INTENSITY
    
    /// Luminous Flux
    static var luminousFlux: SensorType { return 0x17 } // SENS_LUMINOUS_FLUX
    
    /// Illuminance
    static var Illuminance: SensorType { return 0x18 } // SENS_ILLUMINANCE
    
    /// Chromiance Red
    static var chrominanceRed: SensorType { return 0x19 } // SENS_CHROMINANCE_RED
    
    /// Chromiance Green
    static var chrominanceGreen: SensorType { return 0x1A } // SENS_CHROMINANCE_GREEN
    
    /// Chromiance Blue
    static var chrominanceBlue: SensorType { return 0x1B } // SENS_CHROMINANCE_BLUE
    
    /// Contacts
    ///
    /// E.g.: Switch inputs.
    static var contacts: SensorType { return 0x1C } // SENS_CONTACTS
    
    /// Memory
    ///
    /// E.g.: ROM Size
    static var memory: SensorType { return 0x1D } // SENS_MEMORY
    
    /// Items
    ///
    /// E.g.: Scroller gel frames.
    static var items: SensorType { return 0x1E } // SENS_ITEMS
    
    /// Humidity
    static var humidity: SensorType { return 0x1F } // SENS_HUMIDITY
    
    /// Counter 16 Bit
    static var counter16Bit: SensorType { return 0x2F } // SENS_COUNTER_16BIT
    
    /// Other
    static var Other: SensorType { return 0x7F } // SENS_OTHER
    
    /// Manufacturer-Specific Sensors `0x80 – 0xFF`
}

// MARK: - Names

public extension SensorType {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [SensorType: String] = [
        .temperature: "Temperature",
        .voltage: "Voltage",
        .current: "Current",
        .frequency: "Frequency",
        .resistance: "Resistance",
        .power: "Power",
        .mass: "Mass",
        .length: "Length",
        .area: "Area",
        .volume: "Volume",
        .density: "Density",
        .velocity: "Velocity",
        .acceleration: "Acceleration",
        .force: "Force",
        .energy: "Energy",
        .pressure: "Pressure",
        .time: "Time",
        .angle: "Angle",
        .positionX: "Position X",
        .positionY: "Position Y",
        .positionZ: "Position Z",
        .angularVelocity: "Angular Velocity",
        .luminousIntensity: "Luminous Intensity",
        .luminousFlux: "Luminous Flux",
        .Illuminance: "Illuminance",
        .chrominanceRed: "Chromiance Red",
        .chrominanceGreen: "Chromiance Green",
        .chrominanceBlue: "Chromiance Blue",
        .contacts: "Contacts",
        .memory: "Memory",
        .items: "Items",
        .humidity: "Humidity",
        .counter16Bit: "Counter 16 Bit",
        .Other: "Other"
    ]
}
