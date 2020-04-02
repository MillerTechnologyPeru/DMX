//
//  ProductDetail.swift
//  
//
//  Created by Alsey Coleman Miller on 3/12/20.
//

/// RDM Product Detail definitions
///
/// - See Also: ANSI E1.20 – 2010, page 106
public struct ProductDetail: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension ProductDetail: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension ProductDetail: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension ProductDetail {
    
    /// Not Declared
    static var notDeclared: ProductDetail { return 0x0000 } // PRODUCT_DETAIL_NOT DECLARED
    
    // MARK: Generally applied to fixtures
    
    /// ARC
    ///
    /// Intended for constant light output.
    static var arc: ProductDetail { return 0x0001 } // PRODUCT_DETAIL_ARC
    
    /// Metal Halide
    static var metalHalide: ProductDetail { return 0x0002 } // PRODUCT_DETAIL_METAL_HALIDE
    
    /// Incandescent
    static var incandescent: ProductDetail { return 0x0003 } // PRODUCT_DETAIL_INCANDESCENT
    
    /// Led
    static var led: ProductDetail { return 0x0004 } // PRODUCT_DETAIL_LED
    
    /// Fluroescent
    static var fluroescent: ProductDetail { return 0x0005 } // PRODUCT_DETAIL_FLUROESCENT
    
    /// Coldcathode
    ///
    /// Includes Neon / Argon
    static var coldcathode: ProductDetail { return 0x0006 } // PRODUCT_DETAIL_COLDCATHODE
    
    /// Electroluminescent
    static var electroluminescent: ProductDetail { return 0x0007 } // PRODUCT_DETAIL_ELECTROLUMINESCENT
    
    /// Laser
    static var laser: ProductDetail { return 0x0008 } // PRODUCT_DETAIL_LASER
    
    /// Flashtube
    ///
    /// Strobes or other flashtubes
    static var flashtube: ProductDetail { return 0x0009 } // PRODUCT_DETAIL_FLASHTUBE
    
    // MARK: Generally applied to fixture accessories
    
    /// Color Scroller
    static var colorScroller: ProductDetail { return 0x0100 } // PRODUCT_DETAIL_COLORSCROLLER
    
    /// Color Wheel
    static var colorWheel: ProductDetail { return 0x0101 } // PRODUCT_DETAIL_COLORWHEEL
    
    /// Color Change
    ///
    /// Semaphore or other type
    static var colorChange: ProductDetail { return 0x0102 } // PRODUCT_DETAIL_COLORCHANGE
    
    /// Iris Douser
    static var irisDouser: ProductDetail { return 0x0103 } // PRODUCT_DETAIL_IRIS_DOUSER
    
    /// Dimming Shutter
    static var dimmingShutter: ProductDetail { return 0x0104 } // PRODUCT_DETAIL_DIMMING_SHUTTER
    
    /// Profile Shitter
    ///
    /// hard-edge beam masking
    static var profileShutter: ProductDetail { return 0x0105 } // PRODUCT_DETAIL_PROFILE_SHUTTER
    
    /// Barndoor Shutter
    ///
    /// soft-edge beam masking
    static var barndootShutter: ProductDetail { return 0x0106 } // PRODUCT_DETAIL_BARNDOOR_SHUTTER
    
    /// Effects Disc
    static var effectsDisc: ProductDetail { return 0x0107 } // PRODUCT_DETAIL_EFFECTS_DISC
    
    /// Gobo Rotator
    static var goboRotator: ProductDetail { return 0x0108 } // PRODUCT_DETAIL_GOBO_ROTATOR
    
    // MARK: Generally applied to Projectors
    
    /// Video
    static var video: ProductDetail { return 0x0200 } // PRODUCT_DETAIL_VIDEO
    
    /// Slide
    static var slide: ProductDetail { return 0x0201 } // PRODUCT_DETAIL_SLIDE
    
    /// Film
    static var film: ProductDetail { return 0x0202 } // PRODUCT_DETAIL_FILM
    
    /// Oil Wheel
    static var oilwheel: ProductDetail { return 0x0203 } // PRODUCT_DETAIL_OILWHEEL
    
    /// LCD Gate
    static var lcdgate: ProductDetail { return 0x0204 } // PRODUCT_DETAIL_LCDGATE
    
    // MARK: Generally applied to Atmospheric Effects
    
    /// Fooger Glycol
    ///
    /// Glycol / Glycerin hazer
    static var foogerGlycol: ProductDetail { return 0x0300 } // PRODUCT_DETAIL_FOGGER_GLYCOL
    
    /// Fooger Mineral Oil
    ///
    /// White Mineral oil hazer
    static var foogerMineralOil: ProductDetail { return 0x0301 } // PRODUCT_DETAIL_FOGGER_MINERALOIL
    
    /// Fogger Water
    ///
    /// Water hazer
    static var foggerWater: ProductDetail { return 0x0302 } // PRODUCT_DETAIL_FOGGER_WATER
    
    /// CO2
    ///
    /// Dry Ice/Carbon Dioxide based
    static var co2: ProductDetail { return 0x0303 } // PRODUCT_DETAIL_C02
    
    /// LN2
    ///
    /// Nitrogen based
    static var ln2: ProductDetail { return 0x0304 } // PRODUCT_DETAIL_LN2
    
    /// Bubble
    ///
    /// Including foam
    static var bubble: ProductDetail { return 0x0305 } // PRODUCT_DETAIL_BUBBLE
    
    /// Flame Propane
    static var flamePropane: ProductDetail { return 0x0306 } // PRODUCT_DETAIL_FLAME_PROPANE
    
    /// Flame Other
    static var flameOther: ProductDetail { return 0x0307 } // PRODUCT_DETAIL_FLAME_OTHER
    
    /// Ole Factory Stimulator
    ///
    /// Scents
    static var oleFactoryStimulator: ProductDetail { return 0x0308 } // PRODUCT_DETAIL_OLEFACTORY_STIMULATOR
    
    /// Snow
    static var snow: ProductDetail { return 0x0309 } // PRODUCT_DETAIL_SNOW
    
    /// Water Jet
    ///
    /// Fountain Controls etc
    static var waterJet: ProductDetail { return 0x030A } // PRODUCT_DETAIL_WATER_JET
    
    /// Wind
    ///
    /// Air Mover
    static var wind: ProductDetail { return 0x030B } // PRODUCT_DETAIL_WIND
    
    /// Confetti
    static var confetti: ProductDetail { return 0x030C } // PRODUCT_DETAIL_CONFETTI
    
    /// Hazard
    ///
    /// Any form of pyrotechnic control or device.
    static var hazard: ProductDetail { return 0x030D } // PRODUCT_DETAIL_HAZARD
    
    // MARK: Generally applied to Dimmers/Power controllers
    // - See Also: ANSI E1.20 – 2010, page 109 `Note 1`
    
    /// Phase Control
    static var phaseControl: ProductDetail { return 0x0400 } // PRODUCT_DETAIL_PHASE_CONTROL
    
    /// Reverse Phase Control
    ///
    /// includes FET/IGBT
    static var reversePhaseControl: ProductDetail { return 0x0401 } // PRODUCT_DETAIL_REVERSE_PHASE_CONTROL
    
    /// Sine
    static var sine: ProductDetail { return 0x0402 } // PRODUCT_DETAIL_SINE
    
    /// PWM
    static var pwm: ProductDetail { return 0x0403 } // PRODUCT_DETAIL_PWM
    
    /// DC
    ///
    /// Variable voltage
    static var dc: ProductDetail { return 0x0404 } // PRODUCT_DETAIL_DC
    
    /// HF Ballast
    ///
    /// For Fluroescent
    static var hfballast: ProductDetail { return 0x0405 } // PRODUCT_DETAIL_HFBALLAST
    
    /// HFVH Neonballast
    ///
    /// For Neon/Argon and other coldcathode.
    static var hfhvNeonballast: ProductDetail { return 0x0406 } // PRODUCT_DETAIL_HFHV_NEONBALLAST
    
    /// HFV EL
    ///
    /// For Electroluminscent
    static var hfvEl: ProductDetail { return 0x0407 } // PRODUCT_DETAIL_HFHV_EL
    
    /// MHR Ballast
    ///
    /// For Metal Halide
    static var mhrBallast: ProductDetail { return 0x0408 } // PRODUCT_DETAIL_MHR_BALLAST
    
    /// Bitangle Modulation
    static var bitangleModulation: ProductDetail { return 0x0409 } // PRODUCT_DETAIL_BITANGLE_MODULATION
    
    /// Frequency Modulation
    static var frequencyModulation: ProductDetail { return 0x040A } // PRODUCT_DETAIL_FREQUENCY_MODULATION
    
    /// High Frequency 12V
    ///
    /// As commonly used with MR16 lamps
    static var highFrequency: ProductDetail { return 0x040B } // PRODUCT_DETAIL_HIGHFREQUENCY_12V
    
    /// Relay Mechanical
    ///
    /// - See Also: ANSI E1.20 – 2010, page 109 `Note 1`
    static var relayMechanical: ProductDetail { return 0x040C } // PRODUCT_DETAIL_RELAY_MECHANICAL
    
    /// Relay Electronic
    ///
    /// - See Also: ANSI E1.20 – 2010, page 109 `Note 1`
    /// - See Also: ANSI E1.20 – 2010, page 109 `Note 2`
    static var relayElectronic: ProductDetail { return 0x040D } // PRODUCT_DETAIL_RELAY_ELECTRONIC
    
    /// Switch Electronic
    ///
    /// - See Also: ANSI E1.20 – 2010, page 109 `Note 1`
    /// - See Also: ANSI E1.20 – 2010, page 109 `Note 2`
    static var switchElectronic: ProductDetail { return 0x040E } // PRODUCT_DETAIL_SWITCH_ELECTRONIC
    
    /// Contactor
    ///
    /// - See Also: ANSI E1.20 – 2010, page 109 `Note 1`
    static var contactor: ProductDetail { return 0x040F } // PRODUCT_DETAIL_CONTACTOR
    
    // MARK: Generally applied to Scenic drive
    
    /// Mirrorball Rotator
    static var mirrorballRotator: ProductDetail { return 0x0500 } // PRODUCT_DETAIL_MIRRORBALL_ROTATOR
    
    /// Other Rotator
    ///
    /// Includes turntables
    static var otherRotator: ProductDetail { return 0x0501 } // PRODUCT_DETAIL_OTHER_ROTATOR
    
    /// Kabuki Drop
    static var kabukiDrop: ProductDetail { return 0x0502 } // PRODUCT_DETAIL_KABUKI_DROP
    
    /// Curtain
    ///
    /// Flown or traveller
    static var curtain: ProductDetail { return 0x0503 } // PRODUCT_DETAIL_CURTAIN
    
    /// Lineset
    static var lineset: ProductDetail { return 0x0504 } // PRODUCT_DETAIL_LINESET
    
    /// Motor Control
    static var motorControl: ProductDetail { return 0x0505 } // PRODUCT_DETAIL_MOTOR_CONTROL
    
    /// Damper Control
    ///
    /// HVAC Damper
    static var damperControl: ProductDetail { return 0x0506 } // PRODUCT_DETAIL_DAMPER_CONTROL
    
    // MARK: Generally applied to Data Distribution
    
    /// Splitter
    ///
    /// Includes buffers/repeaters
    static var splitter: ProductDetail { return 0x0600 } // PRODUCT_DETAIL_SPLITTER
    
    /// Ethernet Node
    ///
    /// DMX512 to/from Ethernet
    static var ethernetNode: ProductDetail { return 0x0601 } // PRODUCT_DETAIL_ETHERNET_NODE
    
    /// Merge
    ///
    /// DMX512 combiner
    static var merge: ProductDetail { return 0x0602 } // PRODUCT_DETAIL_MERGE
    
    /// Data Patch
    ///
    /// Electronic Datalink Patch
    static var dataPatch: ProductDetail { return 0x0603 } // PRODUCT_DETAIL_DATAPATCH
    
    /// Wireless Link
    ///
    /// Radio / Infrared
    static var wirelessLink: ProductDetail { return 0x0604 } // PRODUCT_DETAIL_WIRELESS_LINK
    
    // MARK: Generally applied to Data Conversion and Interfaces
    
    /// Protocol Convertor
    ///
    /// D54/AMX192/Non DMX serial links, etc to/from DMX512
    static var protocolConvertor: ProductDetail { return 0x0701 } // PRODUCT_DETAIL_PROTOCOL_CONVERTOR
    
    /// Analog Demultiplex
    ///
    /// DMX to DC voltage
    static var analogDemultiplex: ProductDetail { return 0x0702 } // PRODUCT_DETAIL_ANALOG_DEMULTIPLEX
    
    /// Analog Multiplex
    ///
    /// DC Voltage to DMX
    static var analogMultiplex: ProductDetail { return 0x0703 } // PRODUCT_DETAIL_ANALOG_MULTIPLEX
    
    /// Switch Panel
    ///
    /// Pushbuttons to DMX or polled using RDM
    static var switchPanel: ProductDetail { return 0x0704 } // PRODUCT_DETAIL_SWITCH_PANEL
    
    // MARK: Generally applied to Audio or Video (AV) devices
    
    /// Router
    ///
    /// Switching device
    static var router: ProductDetail { return 0x0800 } // PRODUCT_DETAIL_ROUTER
    
    /// Fader
    ///
    /// Single channel
    static var fader: ProductDetail { return 0x0801 } // PRODUCT_DETAIL_FADER
    
    /// Mixer
    ///
    /// Multi-channel
    static var mixer: ProductDetail { return 0x0802 } // PRODUCT_DETAIL_MIXER
    
    // MARK: Generally applied to Controllers, Backup devices and Test Equipment
    
    /// Change Over Manual
    ///
    /// Requires manual intervention to assume control of DMX line
    static var changeOverManual: ProductDetail { return 0x0900 } // MultiPRODUCT_DETAIL_CHANGEOVER_MANUAL
    
    /// Change Over Auto
    ///
    /// May automatically assume control of DMX line
    static var changeOverAuto: ProductDetail { return 0x0901 } // PRODUCT_DETAIL_CHANGEOVER_AUTO
    
    /// Test
    ///
    /// Test equipment
    static var test: ProductDetail { return 0x0902 } // PRODUCT_DETAIL_TEST
    
    // MARK: Could be applied to any category
    
    /// GFI RCD
    ///
    /// Device includes GFI/RCD trip
    static var gfiRcd: ProductDetail { return 0x0A00 } // PRODUCT_DETAIL_GFI_RCD
    
    /// Battery
    ///
    /// Device is battery operated
    static var battery: ProductDetail { return 0x0A01 } // PRODUCT_DETAIL_BATTERY
    
    /// Controllable Breaker
    static var controllableBreaker: ProductDetail { return 0x0A02 } // PRODUCT_DETAIL_CONTROLLABLE_BREAKER
    
    // MARK: Manufacturer Specific Types `0x8000` - `0xDFFF`
    
    /// Other
    /// For use where the Manufacturer believes that none of the defined details apply.
    static var other: ProductDetail { return 0x07FFF } // PRODUCT_DETAIL_OTHER
}

// MARK: - Names

public extension ProductDetail {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [ProductDetail: String] = [
        .notDeclared: "Not Declared",
        .arc: "ARC",
        .metalHalide: "Metal Halide",
        .incandescent: "Incandescent",
        .led: "Led",
        .fluroescent: "Fluroescent",
        .coldcathode: "Coldcathode",
        .electroluminescent: "Electroluminescent",
        .laser: "Laser",
        .flashtube: "Flashtube",
        .colorScroller: "Color Scroller",
        .colorWheel: "Color Wheel",
        .colorChange: "Color Change",
        .irisDouser: "Iris Douser",
        .dimmingShutter: "Dimming Shutter",
        .profileShutter: "Profile Shitter",
        .barndootShutter: "Barndoor Shutter",
        .effectsDisc: "Effects Disc",
        .goboRotator: "Gobo Rotator",
        .video: "Video",
        .slide: "Slide",
        .film: "Film",
        .oilwheel: "Oil Wheel",
        .lcdgate: "LCD Gate",
        .foogerGlycol: "Fooger Glycol",
        .foogerMineralOil: "Fooger Mineral Oil",
        .foggerWater: "Fogger Water",
        .co2: "CO2",
        .ln2: "LN2",
        .bubble: "Bubble",
        .flamePropane: "Flame Propane",
        .flameOther: "Flame Other",
        .oleFactoryStimulator: "Ole Factory Stimulator",
        .snow: "snow",
        .waterJet: "Water Jet",
        .wind: "Wind",
        .confetti: "Confetti",
        .hazard: "Hazard",
        .phaseControl: "Phase Control",
        .reversePhaseControl: "Reverse Phase Control",
        .sine: "SINE",
        .pwm: "PWM",
        .dc: "DC",
        .hfballast: "HF Ballast",
        .hfhvNeonballast: "HFVH Neonballast",
        .hfvEl: "HFV EL",
        .mhrBallast: "MHR Ballast",
        .bitangleModulation: "Bitangle Modulation",
        .frequencyModulation: "Frequency Modulation",
        .highFrequency: "High Frequency 12V",
        .relayMechanical: "Relay Mechanical",
        .relayElectronic: "Relay Electronic",
        .switchElectronic: "Switch Electronic",
        .contactor: "Contactor",
        .mirrorballRotator: "Mirrorball Rotator",
        .otherRotator: "Other Rotator",
        .kabukiDrop: "Kabuki Drop",
        .curtain: "Curtain",
        .lineset: "Lineset",
        .motorControl: "Motor Control",
        .damperControl: "Damper Control",
        .splitter: "Splitter",
        .ethernetNode: "Ethernet Node",
        .merge: "Merge",
        .dataPatch: "Data Patch",
        .wirelessLink: "Wireless Link",
        .protocolConvertor: "Protocol Convertor",
        .analogDemultiplex: "Analog Demultiplex",
        .analogMultiplex: "Analog Multiplex",
        .switchPanel: "Switch Panel",
        .router: "Router",
        .fader: "Fader",
        .mixer: "Mixer",
        .changeOverManual: "Change Over Manual",
        .changeOverAuto: "Change Over Auto",
        .test: "Test",
        .gfiRcd: "GFI RCD",
        .battery: "Battery",
        .controllableBreaker: "Controllable Breaker",
        .other: "Other"
    ]
}
