//
//  SlotID.swift
//  
//
//  Created by Jorge Loc Rubio on 4/2/20.
//

/**
  Defines some publicly available Slot IDs.
 
  Informative note: The ESTA website (http://www.esta.org/rdm) may document new publicly defined Slot IDs in addition to those enumerated in this document.
  Implementers of this standard are encouraged to check the ESTA website for applicable Slot IDs before creating manufacturer- specific codes.
 
  Manufacturers should, whenever possible, use publicly defined Slot IDs rather than developing their own Manufacturer-specific IDs.
  Publicly defined IDs are in the range of `0x0000 - 0x7FFF`.
  Manufacturer-specific IDs are in the range of `0x8000 – 0xFFDF`.
  
 The Slot IDs are organized into categories to provide logical groupings, which controllers can use to provide a more intuitive user interface for Manufacturer-specific codes.
 */
public struct SlotID: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension SlotID: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension SlotID: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension SlotID {
    
    //  MARK: Intensity Functions `0x00XX`
    
    /// Intensity
    static var intensity: SlotID { return 0x0001 } // SD_INTENSITY
    
    /// Intensity Master
    static var intensityMaster: SlotID { return 0x0002 } // SD_INTENSITY_MASTER
    
    //  MARK: Movement Functions `0x01XX`
    
    /// Pan
    static var pan: SlotID { return 0x0101 } // SD_PAN
    
    /// Tilt
    static var tilt: SlotID { return 0x0102 } // SD_TILT
    
    //  MARK: Color Functions `0x02XX`
    
    /// Color Wheel
    static var colorWheel: SlotID { return 0x0201 } // SD_COLOR_WHEEL
    
    /// Color Subtractive Cyan
    ///
    /// Subtractive Color Mixer – Cyan/Blue
    static var colorSubCyan: SlotID { return 0x0202 } // SD_COLOR_SUB_CYAN
    
    /// Color Subtractive Yellow
    ///
    /// Subtractive Color Mixer – Yellow/Amber
    static var colorSubYellow: SlotID { return 0x0203 } // SD_COLOR_SUB_YELLOW
    
    /// Color Subtractive Magenta
    ///
    /// Subtractive Color Mixer - Magenta
    static var colorSubMagenta: SlotID { return 0x0204 } // SD_COLOR_SUB_MAGENTA
    
    /// Color Additive Red
    ///
    /// Additive Color Mixer - Red
    static var colorAddRed: SlotID { return 0x0205 } // SD_COLOR_ADD_RED
    
    /// Color Additive Green
    ///
    /// Additive Color Mixer - Green
    static var colorAddGreen: SlotID { return 0x0206 } // SD_COLOR_ADD_GREEN
    
    /// Color Additive Blue
    ///
    /// Additive Color Mixer - Blue
    static var colorAddBlue: SlotID { return 0x0207 } // SD_COLOR_ADD_BLUE
    
    /// Color Correction
    ///
    /// Color Temperature Correction
    static var colorCorrection: SlotID { return 0x0208 } // SD_COLOR_CORRECTION
    
    /// Color Scroll
    static var colorScroll: SlotID { return 0x0209 } // SD_COLOR_SCROLL
    
    /// Color Semaphore
    static var colorSemaphore: SlotID { return 0x0210 } // SD_COLOR_SEMAPHORE
    
    //  MARK: Image Functions `0x03XX`
    
    /// Static Gobo Wheel
    static var staticGogoWheel: SlotID { return 0x0301 } // SD_STATIC_GOBO_WHEEL
    
    /// Rotating Gobo Wheel
    static var rotatingGoboWheel: SlotID { return 0x0302 } // SD_ROTO_GOBO_WHEEL
    
    /// Prism Wheel
    static var prismWheel: SlotID { return 0x0303 } // SD_PRISM_WHEEL
    
    /// Effects Wheel
    static var effectsWheel: SlotID { return 0x0304 } // SD_EFFECTS_WHEEL
    
    //  MARK: Beam Functions `0x04XX`
    
    /// Beam Size Iris
    static var beamSizeIris: SlotID { return 0x0401 } // SD_BEAM_SIZE_IRIS
    
    /// Edge
    ///
    /// Edge / Lens Focus
    static var edge: SlotID { return 0x0402 } // SD_EDGE
    
    /// Frost
    ///
    /// Frost / Diffusion
    static var frost: SlotID { return 0x0403 } // SD_FROST
    
    /// Strobe
    ///
    /// Strobe / Shutter
    static var strobe: SlotID { return 0x0404 } // SD_STROBE
    
    /// Zoom Lens
    static var zoom: SlotID { return 0x0405 } // SD_ZOOM
    
    /// Framing Shutter
    static var framingShutter: SlotID { return 0x0406 } // SD_FRAMING_SHUTTER
    
    /// Framing Shutter Rotation
    static var shutterRotate: SlotID { return 0x0407 } // SD_SHUTTER_ROTATE
    
    /// Douser
    static var douser: SlotID { return 0x0408 } // SD_DOUSER
    
    /// Barn Door
    static var barnDoor: SlotID { return 0x0409 } // SD_BARN_DOOR
    
    //  MARK: Control Functions `0x05XX`
    
    /// Lamp Control Functions
    static var lampControl: SlotID { return 0x0501 } // SD_LAMP_CONTROL
    
    /// Fixture Control Channel
    static var fixtureControl: SlotID { return 0x0502 } // SD_FIXTURE_CONTROL
    
    /// Fixture Speed
    ///
    /// Overall speed setting applied to multiple or all parameters
    static var fixtureSpeed: SlotID { return 0x0503 } // SD_FIXTURE_SPEED
    
    /// Macro Control
    static var macro: SlotID { return 0x0504 } // SD_MACRO
    
    //  MARK: Other
    
    /// Undefined
    static var undenifed: SlotID { return 0xFFFF } // SD_UNDEFINED
}

// MARK: - Names

public extension SlotID {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [SlotID: String] = [
        .intensity: "Intensity",
        .intensityMaster: "Intensity Master",
        .pan: "Pan",
        .tilt: "Tilt",
        .colorWheel: "Color Wheel",
        .colorSubCyan: "Color Subtractive Cyan",
        .colorSubYellow: "Color Subtractive Yellow",
        .colorSubMagenta: "Color Subtractive Magenta",
        .colorAddRed: "Color Additive Red",
        .colorAddGreen: "Color Additive Green",
        .colorAddBlue: "Color Additive Blue",
        .colorCorrection: "Color Correction",
        .colorScroll: "Color Scroll",
        .colorSemaphore: "Color Semaphore",
        .staticGogoWheel: "Static Gobo Wheel",
        .rotatingGoboWheel: "Rotating Gobo Wheel",
        .prismWheel: "Prism Wheel",
        .effectsWheel: "Effects Wheel",
        .beamSizeIris: "Beam Size Iris",
        .edge: "Edge",
        .frost: "Frost",
        .strobe: "Strobe",
        .zoom: "Zoom",
        .framingShutter: "Framing Shutter",
        .shutterRotate: "Framing Shutter Rotation",
        .douser: "Douser",
        .barnDoor: "Barn Door",
        .lampControl: "Lamp Control Functions",
        .fixtureControl: "Fixture Control Channel",
        .fixtureSpeed: "Fixture Speed",
        .macro: "Macro Control",
        .undenifed: "Undefined"
    ]
}
