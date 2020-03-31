//
//  ProductCategory.swift
//  
//
//  Created by Jorge Loc Rubio on 3/31/20.
//

/// RDM Product Category definitions
///
/// - See Also: ANSI E1.20 – 2010, page 103 Table A-5
public struct ProductCategory: RawRepresentable, Equatable, Hashable, Codable {
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension ProductCategory: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension ProductCategory: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension ProductCategory {
    
    /// Not Declared
    static var notDeclared: ProductCategory { return 0x0000 } // PRODUCT_CATEGORY_NOT_DECLARED
    
    // MARK: Fixtures – intended as source of illumination
    
    /// Fixture
    ///
    /// No Fine Category declared
    static var fixture: ProductCategory { return 0x0100 } // PRODUCT_CATEGORY_FIXTURE
    
    /// Fixture Fixed
    ///
    /// No pan / tilt / focus style functions
    static var fixtureFixed: ProductCategory { return 0x0101 } // PRODUCT_CATEGORY_FIXTURE_FIXED
    
    /// Fixture Moving Yoke
    static var fixtureMovingYoke: ProductCategory { return 0x0102 } // PRODUCT_CATEGORY_FIXTURE_MOVING_YOKE
    
    /// Fixture Moving Mirror
    static var fixtureMovingMirror: ProductCategory { return 0x0103 } // PRODUCT_CATEGORY_FIXTURE_MOVING_MIRROR
    
    /// Fixture Other
    ///
    /// For example, focus but no pan/tilt.
    static var fixtureOther: ProductCategory { return 0x01FF } // PRODUCT_CATEGORY_FIXTURE_OTHER
    
    // MARK: Fixture Accessories – add-ons to fixtures or projectors
    
    /// Fixture Accessory
    ///
    /// No Fine Category declared.
    static var fixtureAccessory: ProductCategory { return 0x0200 } // PRODUCT_CATEGORY_FIXTURE_ACCESSORY
    
    /// Fixture Accessory Color
    ///
    /// Scrollers / Color Changers
    static var fixtureAccessoryColor: ProductCategory { return 0x0201 } // PRODUCT_CATEGORY_FIXTURE_ACCESSORY_COLOR
    
    /// Fixture Accessory Yoke
    ///
    /// Yoke add-on
    static var fixtureAccessoryYoke: ProductCategory { return 0x0202 } // PRODUCT_CATEGORY_FIXTURE_ACCESSORY_YOKE
    
    /// Fixture Accessory Mirror
    ///
    /// Moving mirror add-on
    static var fixtureAccessoryMirror: ProductCategory { return 0x0203 } // PRODUCT_CATEGORY_FIXTURE_ACCESSORY_MIRROR
    
    /// Fixture Accessory Effect
    ///
    /// Effects Discs
    static var fixtureAccessoryEffect: ProductCategory { return 0x0204 } // PRODUCT_CATEGORY_FIXTURE_ACCESSORY_EFFECT
    
    /// Fixture Accessory Beam
    ///
    /// Gobo Rotators / Iris / Shutters / Dousers Beam modifiers.
    static var fixtureAccessoryBeam: ProductCategory { return 0x0205 } // PRODUCT_CATEGORY_FIXTURE_ACCESSORY_BEAM
    
    /// Fixture Accessory Other
    static var fixtureAccessoryOther: ProductCategory { return 0x02FF } // PRODUCT_CATEGORY_FIXTURE_ACCESSORY_OTHER
    
    // MARK: Projectors - light source capable of producing realistic images from another media
    // - See Also: ANSI E1.20 – 2010, page 106 `Note 1`
    
    /// Projector
    ///
    /// No Fine Category declared.
    static var projector: ProductCategory { return 0x0300 } // PRODUCT_CATEGORY_PROJECTOR
    
    /// Projector Fixed
    ///
    /// No pan / tilt functions.
    static var projectorFixed: ProductCategory { return 0x0301 } // PRODUCT_CATEGORY_PROJECTOR_FIXED
    
    /// Projector Moving Yoke
    static var projectorMovingYoke: ProductCategory { return 0x0302 } // PRODUCT_CATEGORY_PROJECTOR_MOVING_YOKE
    
    /// Projector Moving Mirror
    static var projectorMovingMirror: ProductCategory { return 0x0303 } // PRODUCT_CATEGORY_PROJECTOR_MOVING_MIRROR
    
    /// Projector Other
    static var projectorOther: ProductCategory { return 0x03FF } // PRODUCT_CATEGORY_PROJECTOR_OTHER
    
    // MARK: Atmospheric Effect – earth/wind/fire
    
    /// Atmospheric
    ///
    /// No Fine Category declared.
    static var atmospheric: ProductCategory { return 0x0400 } // PRODUCT_CATEGORY_ATMOSPHERIC
    
    /// Atmospheric Effect
    ///
    /// Fogger / Hazer / Flame, etc.
    static var atmosphericEffect: ProductCategory { return 0x0401 } // PRODUCT_CATEGORY_ATMOSPHERIC_EFFECT
    
    /// Atmospheric Pyro
    ///
    /// - See Also: ANSI E1.20 – 2010, page 106 `Note 2`
    static var atmosphericPyro: ProductCategory { return 0x0402 } // PRODUCT_CATEGORY_ATMOSPHERIC_PYRO
    
    /// Atmospheric Other
    static var atmosphericOther: ProductCategory { return 0x04FF } // PRODUCT_CATEGORY_ATMOSPHERIC_OTHER
    
    // MARK: Intensity Control (specifically Dimming equipment)
    
    /// Dimmer
    ///
    /// No Fine Category declared.
    static var dimmer: ProductCategory { return 0x0500 } // PRODUCT_CATEGORY_DIMMER
    
    /// Dimmer AC Incandescent
    ///
    /// AC > 50VAC
    static var dimmerAcIncandescent: ProductCategory { return 0x0501 } // PRODUCT_CATEGORY_DIMMER_AC_INCANDESCENT
    
    /// Dimmer AC Flouorescent
    static var dimmerAcFluorescent: ProductCategory { return 0x0502 } // PRODUCT_CATEGORY_DIMMER_AC_FLUORESCENT
    
    /// Dimmer AC Coldcathode
    ///
    /// High Voltage outputs such as Neon or other cold cathode.
    static var dimmerAcColdcathode: ProductCategory { return 0x0503 } // PRODUCT_CATEGORY_DIMMER_AC_COLDCATHODE
    
    /// Dimmer AC Nondim
    ///
    /// Non-Dim module in dimmer rack.
    static var dimmerAcNondim: ProductCategory { return 0x0504 } // PRODUCT_CATEGORY_DIMMER_AC_NONDIM
    
    /// Dimmer AC Elv
    ///
    /// AC <= 50V such as 12/24V AC Low voltage lamps.
    static var dimmerAcElv: ProductCategory { return 0x0505 } // PRODUCT_CATEGORY_DIMMER_AC_ELV
    
    /// Dimmer AC Other
    static var dimmerAcOther: ProductCategory { return 0x0506 } // PRODUCT_CATEGORY_DIMMER_AC_OTHER
    
    /// Dimmer DC Level
    ///
    /// Variable DC level output.
    static var dimmerDcLevel: ProductCategory { return 0x0507 } // PRODUCT_CATEGORY_DIMMER_DC_LEVEL
    
    /// Dimmer DC PWM
    ///
    /// Chopped (PWM) output.
    static var dimmerDcPwm: ProductCategory { return 0x0508 } // PRODUCT_CATEGORY_DIMMER_DC_PWM
    
    /// Dimmer CS Led
    ///
    /// Specialized LED dimmer.
    static var dimmerCsLed: ProductCategory { return 0x0509 } // PRODUCT_CATEGORY_DIMMER_CS_LED
    
    /// Dimmer Other
    static var dimmerOther: ProductCategory { return 0x05FF } // PRODUCT_CATEGORY_DIMMER_OTHER
    
    // MARK: Power Control (other than Dimming equipment)
    
    /// Power
    ///
    /// No Fine Category declared.
    static var power: ProductCategory { return 0x0600 } // PRODUCT_CATEGORY_POWER
    
    /// Power Control
    ///
    /// Contactor racks, other forms of Power Controllers.
    static var powerControl: ProductCategory { return 0x0601 } // PRODUCT_CATEGORY_POWER_CONTROL
    
    /// Power Source
    ///
    /// Generators
    static var powerSource: ProductCategory { return 0x0602 } // PRODUCT_CATEGORY_POWER_SOURCE
    
    /// Power Other
    static var powerOther: ProductCategory { return 0x06FF } // PRODUCT_CATEGORY_POWER_OTHER
    
    // MARK: Scenic Drive – including motorized effects unrelated to light source.
    
    /// Scenic
    ///
    /// No Fine Category declared
    static var scenic: ProductCategory { return 0x0700 } // PRODUCT_CATEGORY_SCENIC
    
    /// Scenic Drive
    ///
    /// Rotators / Kabuki drops, etc.
    /// - See Also: ANSI E1.20 – 2010, page 106 `Note 2`
    static var scenicDrive: ProductCategory { return 0x0701 } // PRODUCT_CATEGORY_SCENIC_DRIVE
    
    /// Scenic Other
    static var scenicOther: ProductCategory { return 0x07FF } // PRODUCT_CATEGORY_SCENIC_OTHER
    
    // MARK: DMX Infrastructure, conversion and interfaces
    
    /// Data
    ///
    /// No Fine Category declared.
    static var data: ProductCategory { return 0x0800 } // PRODUCT_CATEGORY_DATA
    
    /// Data Distribution
    ///
    /// Splitters / repeaters / data patch / Ethernet products used to distribute DMX universes.
    static var dataDistribution: ProductCategory { return 0x0801 } // PRODUCT_CATEGORY_DATA_DISTRIBUTION
    
    /// Data Conversion
    ///
    /// Protocol Conversion analog decoders.
    static var dataConversion: ProductCategory { return 0x0802 } // PRODUCT_CATEGORY_DATA_CONVERSION
    
    /// Data Other
    static var dataOther: ProductCategory { return 0x08FF } // PRODUCT_CATEGORY_DATA_OTHER
    
    // MARK: Audio-Visual Equipment
    
    /// AV
    ///
    /// No Fine Category declared.
    static var av: ProductCategory { return 0x0900 } // PRODUCT_CATEGORY_AV
    
    /// AV Audio
    ///
    /// Audio controller or device.
    static var avAudio: ProductCategory { return 0x0901 } // PRODUCT_CATEGORY_AV_AUDIO
    
    /// AV Video
    ///
    /// Video controller or display device.
    static var avVideo: ProductCategory { return 0x0902 } // PRODUCT_CATEGORY_AV_VIDEO
    
    /// AV Other
    static var avOther: ProductCategory { return 0x09FF } // PRODUCT_CATEGORY_AV_OTHER
    
    // MARK: Parameter Monitoring Equipment
    // - See Also: ANSI E1.20 – 2010, page 106 `Note 3`
    
    /// Monitor
    ///
    /// No Fine Category declared.
    static var monitor: ProductCategory { return 0x0A00 } // PRODUCT_CATEGORY_MONITOR
    
    /// Monitor AC Line Power
    ///
    /// Product that monitors AC line voltage, current or power.
    static var monitorAcLinePower: ProductCategory { return 0x0A01 } // PRODUCT_CATEGORY_MONITOR_ACLINEPOWER
    
    /// Monitor DC Power
    ///
    /// Product that monitors DC line voltage, current or power.
    static var monitorDcPower: ProductCategory { return 0x0A02 } // PRODUCT_CATEGORY_MONITOR_DCPOWER
    
    /// Monitor Environmental
    ///
    /// Temperature or other environmental parameter.
    static var monitorEnvironmental: ProductCategory { return 0x0A03 } // PRODUCT_CATEGORY_MONITOR_ENVIRONMENTAL
    
    /// Monitor Other
    static var monitorOther: ProductCategory { return 0x0AFF } // PRODUCT_CATEGORY_MONITOR_OTHER
    
    // MARK: Controllers, Backup devices
    
    /// Control
    ///
    /// No Fine Category declared.
    static var control: ProductCategory { return 0x7000 } // PRODUCT_CATEGORY_CONTROL
    
    /// Control Controller
    static var controlController: ProductCategory { return 0x7001 } // PRODUCT_CATEGORY_CONTROL_CONTROLLER
    
    /// Control Backup Device
    static var controlBackupDevice: ProductCategory { return 0x7002 } // PRODUCT_CATEGORY_CONTROL_BACKUPDEVICE
    
    /// Control Other
    static var controlOther: ProductCategory { return 0x70FF } // PRODUCT_CATEGORY_CONTROL_OTHER
    
    // MARK: Test Equipment
    
    /// Test
    ///
    /// No Fine Category declared.
    static var test: ProductCategory { return 0x7100 } // PRODUCT_CATEGORY_TEST
    
    /// Test Equipment
    static var testEquipment: ProductCategory { return 0x7101 } // PRODUCT_CATEGORY_TEST_EQUIPMENT
    
    /// Test Equipment Other
    static var testEquipmentOther: ProductCategory { return 0x71FF } // PRODUCT_CATEGORY_TEST_EQUIPMENT_OTHER
    
    // MARK: Miscellaneous
    
    /// Other
    ///
    /// For devices that aren’t described within this table.
    static var other: ProductCategory { return 0x7FFF } // PRODUCT_CATEGORY_OTHER
    
    // MARK: Manufacturer Specific Categories `0x8000` - `0xDFFF`
}

// MARK: - Names

public extension ProductCategory {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [ProductCategory: String] = [
        .notDeclared: "Not Declared",
        .fixture: "Fixture",
        .fixtureFixed: "Fixutre Fixed",
        .fixtureMovingYoke: "Fixture Moving Yoke",
        .fixtureMovingMirror: "Fixture Moving Mirror",
        .fixtureOther: "Fixture Other",
        .fixtureAccessory: "Fixture Accessory",
        .fixtureAccessoryColor: "Fixture Accessory Color",
        .fixtureAccessoryYoke: "Fixture Accessory Yoke",
        .fixtureAccessoryMirror: "Fixture Accessory Mirror",
        .fixtureAccessoryEffect: "Fixture Accessory Effect",
        .fixtureAccessoryBeam: "Fixture Accessory Beam",
        .fixtureAccessoryOther: "Fixture Accessory Other",
        .projector: "Projector",
        .projectorFixed: "Projector Fixed",
        .projectorMovingYoke: "Projector Moving Yoke",
        .projectorMovingMirror: "Projector Moving Mirror",
        .projectorOther: "Projector Other",
        .atmospheric: "Atmospheric",
        .atmosphericEffect: "Atmospheric Effect",
        .atmosphericPyro: "Atmospheric Pyro",
        .atmosphericOther: "Atmospheric Other",
        .dimmer: "Dimmer",
        .dimmerAcIncandescent: "Dimmer AC Incandescent",
        .dimmerAcFluorescent: "Dimmer AC Flouorescent",
        .dimmerAcColdcathode: "Dimmer AC Coldcathode",
        .dimmerAcNondim: "Dimmer AC Nondim",
        .dimmerAcElv: "Dimmer AC Elv",
        .dimmerAcOther: "Dimmer AC Other",
        .dimmerDcLevel: "Dimmer DC Level",
        .dimmerDcPwm: "Dimmer DC PWM",
        .dimmerCsLed: "Dimmer CS Led",
        .dimmerOther: "Dimmer Other",
        .power: "Power",
        .powerControl: "Power Control",
        .powerSource: "Power Source",
        .powerOther: "Power Other",
        .scenic: "Scenic",
        .scenicDrive: "Scenic Drive",
        .scenicOther: "Scenic Other",
        .data: "Data",
        .dataDistribution: "Data Distribution",
        .dataConversion: "Data Conversion",
        .dataOther: "Data Other",
        .av: "AV",
        .avVideo: "AV Video",
        .avAudio: "AV Audio",
        .avOther: "AV Other",
        .monitor: "Monitor",
        .monitorAcLinePower: "Monitor AC Power Line",
        .monitorDcPower: "Monitor DC Power",
        .monitorEnvironmental: "Monitor Environmental",
        .monitorOther: "Monitor Other",
        .control: "Control",
        .controlController: "Control Controller",
        .controlBackupDevice: "Control Backup Device",
        .controlOther: "Control Other",
        .test: "Test",
        .testEquipment: "Test Equipment",
        .testEquipmentOther: "Test Equipment Other",
        .other: "Other"
    ]
}
