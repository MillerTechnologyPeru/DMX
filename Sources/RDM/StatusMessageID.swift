//
//  StatusMessageID.swift
//  
//
//  Created by Jorge Loc Rubio on 4/2/20.
//

/**
 Manufacturers shall use publicly defined Status Message ID codes rather than developing their own Manufacturer-specific codes whenever possible.
 
 Publicly defined codes are in the range of `0x0000 - 0x7FFF`.
 Manufacturer-specific codes are in the range of `0x8000 – 0xFFDF`.
 
 Informative note: The ESTA website (http://www.esta.org/rdm) may document new publicly defined Status Message ID codes in addition to those enumerated in this document.
 Implementors of this standard are encouraged to check the ESTA website for applicable Status Message ID’s before creating manufacturer-specific codes.
 */
public struct StatusMessageID: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension StatusMessageID: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension StatusMessageID: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension StatusMessageID {
    
    /// Calibration Fail
    static var calibrationFail: StatusMessageID { return 0x0001 } // STS_CAL_FAIL
    
    /// Sensor Not Found
    static var sensorNotFound: StatusMessageID { return 0x0002 } // STS_SENS_NOT_FOUND
    
    /// Sensor Always On
    static var sensorAlwaysOn: StatusMessageID { return 0x0003 } // STS_SENS_ALWAYS_ON
    
    /// Lamp Doused
    static var lampDoused: StatusMessageID { return 0x0011 } // STS_LAMP_DOUSED
    
    /// Lamp Strike
    ///
    /// Lamp Failed To Strike
    static var lampStrike: StatusMessageID { return 0x0012 } // STS_LAMP_STRIKE
    
    /// Over Temperature
    static var overTemp: StatusMessageID { return 0x0021 } // STS_OVERTEMP
    
    /// Under Temperature
    static var underTemp: StatusMessageID { return 0x0022 } // STS_UNDERTEMP
    
    /// Sensor Out Of Range
    static var sensorOutOfRange: StatusMessageID { return 0x0023 } // STS_SENS_OUT_RANGE
    
    /// Over Voltage Phase
    static var overVoltagePhase: StatusMessageID { return 0x0031 } // STS_OVERVOLTAGE_PHASE
    
    /// Under Voltage Phase
    static var underVoltagePhase: StatusMessageID { return 0x0032 } // STS_UNDERVOLTAGE_PHASE
    
    /// Over Current
    static var overCurrent: StatusMessageID { return 0x0033 } // STS_OVERCURRENT
    
    /// Under Current
    static var underCurrent: StatusMessageID { return 0x0034 } // STS_UNDERCURRENT
    
    /// Phase
    static var phase: StatusMessageID { return 0x0035 } // STS_PHASE
    
    /// Phase Error
    static var phaseError: StatusMessageID { return 0x0036 } // STS_PHASE_ERROR
    
    /// AMPS
    static var apms: StatusMessageID { return 0x0037 } // STS_AMPS
    
    /// Volts
    static var volts: StatusMessageID { return 0x0038 } // STS_VOLTS
    
    /// Dimslot Occupied
    static var dimslotOccupied: StatusMessageID { return 0x0041 } // STS_DIMSLOT_OCCUPIED
    
    /// Breaker Trip
    static var breakerTrip: StatusMessageID { return 0x0042 } // STS_BREAKER_TRIP
    
    /// Watts
    static var watts: StatusMessageID { return 0x0043 } // STS_WATTS
    
    /// Dimmer Failure
    static var dimmerFailure: StatusMessageID { return 0x0044 } // STS_DIM_FAILURE
    
    /// Dimmer Panic
    static var dimmerPanic: StatusMessageID { return 0x0045 } // STS_DIM_PANIC
    
    /// Ready
    static var ready: StatusMessageID { return 0x0050 } // STS_READY
    
    /// Not Ready
    static var notReady: StatusMessageID { return 0x0051 } // STS_NOT_READY
    
    /// Low Fluid
    static var lowFluid: StatusMessageID { return 0x0052 } // STS_LOW_FLUID
}

// MARK: - Names

public extension StatusMessageID {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [StatusMessageID: String] = [
        .calibrationFail: "Calibration Fail",
        .sensorNotFound: "Sensor Not Found",
        .sensorAlwaysOn: "Sensor Always On",
        .lampDoused: "Lamp Doused",
        .lampStrike: "Lamp Failed To Strike",
        .overTemp: "Over Temperature",
        .underTemp: "Under Temperature",
        .sensorOutOfRange: "Sensor Out Of Range",
        .overVoltagePhase: "Over Voltage Phase",
        .underVoltagePhase: "Under Voltage Phase",
        .overCurrent: "Over Current",
        .underCurrent: "Under Current",
        .phase: "Phase",
        .phaseError: "Phase Error",
        .apms: "AMPS",
        .volts: "Volts",
        .dimslotOccupied: "Dimslot Occupied",
        .breakerTrip: "Breaker Trip",
        .watts: "Watts",
        .dimmerFailure: "Dimmer Failure",
        .dimmerPanic: "Dimmer Panic",
        .ready: "Ready",
        .notReady: "Not Ready",
        .lowFluid: "Low Fluid"
    ]
}
