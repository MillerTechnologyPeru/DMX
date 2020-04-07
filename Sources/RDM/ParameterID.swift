//
//  ParameterID.swift
//  
//
//  Created by Alsey Coleman Miller on 3/12/20.
//

import Foundation

/**
 The Parameter ID is a 16-bit number that identifies a specific type of Parameter Data.
 
 The Parameter ID (PID) may represent either a well known Parameter such as those defined in this document, or a Manufacturer-specific parameter whose details are either published by the Manufacturer for third-party support or proprietary for the Manufacturer’s own use.
 
 - SeeAlso: ANSI E1.20 – 2010, page 102, Table A-3: RDM Categories Defines
 */
public struct ParameterID: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension ParameterID: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension ParameterID: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension ParameterID {
    
    // MARK: Network Management
    
    /// Unique Branch
    static var uniqueBranch: ParameterID { return 0x0001 } // DISC_UNIQUE_BRANCH
        
    /// Mute
    static var mute: ParameterID { return 0x0002 } // DISC_MUTE
    
    /// UnMute
    static var unMute: ParameterID { return 0x0003 } // DUSC_UN_MUTE
    
    /// Proxied Devices
    static var proxiedDevices: ParameterID { return 0x0010 } // PROXIED_DEVICES
    
    /// Proxied Devices Count
    static var proxiedDevicesCount: ParameterID { return 0x0011 } // PROXIED_DEVICE_COUNT
    
    /// Communication Status
    static var communicationStatus: ParameterID { return 0x0015 } // COMMS_STATUS
    
    //  MARK: Status Collection
    
    /// Queue Message
    /// - SeeAlso: Table A-4: Status Type
    static var queuedMessage: ParameterID { return 0x0020 } // QUEUED_MESSAGE
    
    /// Status Messages
    /// - SeeAlso: Table A-4: Status Type
    static var statusMessages: ParameterID { return 0x0030 } // STATUS_MESSAGES
    
    /// Status ID Description
    static var statusIdDescription: ParameterID { return 0x0031 } // STATUS_ID_DESCRIPTION
       
    /// Clear Status ID
    static var clearStatusId: ParameterID { return 0x0032 } // CLEAR_STATUS_ID
    
    /// Sub Device Status Report Threshold
    /// - SeeAlso: Table A-4: Status Type
    static var subDeviceStatusReport: ParameterID { return 0x0033 } // SUB_DEVICE_STATUS_REPORT_THRESHOLD
    
    //  MARK: RDM Information
    
    /// Supported Parameters
    /// Support required only if supporting Parameters beyond the minimum required set.
    static var supportedParameters: ParameterID { return 0x0050 } // SUPPORTED_PARAMETERS
    
    /// Parameter Description
    /// Support required for Manufacturer-Specific PIDs exposed in SUPPORTED_ PARAMETERS message.
    static var parameterDescription: ParameterID { return 0x0051 } // PARAMETER_DESCRIPTION
    
     //  MARK: Product Information
    
    /// Device Info
    static var deviceInfo: ParameterID { return 0x0060 } // DEVICE_INFO
    
    /// Product Detail ID List
    static var productDetail: ParameterID { return 0x0070 } // PRODUCT_DETAIL_ID_LIST
    
    /// Device Model Description
    static var deviceModelDescription: ParameterID { return 0x0080 } // DEVICE_MODEL_DESCRIPTION
    
    /// Manufacturer Label
    static var manufacturerLabel: ParameterID { return 0x0081 } // MANUFACTURER_LABEL
    
    /// Device Label
    static var deviceLabel: ParameterID { return 0x0082 } // DEVICE_LABEL
    
    /// Factory Defaults
    static var factoryDefaults: ParameterID { return 0x0090 } // FACTORY_DEFAULTS
    
    /// Language Capabilities
    static var languageCapabilities: ParameterID { return 0x00A0 } // LANGUAGE_CAPABILITIES
    
    /// Language
    static var language: ParameterID { return 0x00B0 } // LANGUAGE
    
    /// Software Version Label
    static var softwareVersionLabel: ParameterID { return 0x00C0 } // SOFTWARE_VERSION_LABEL
    
    /// Boot Software Version ID
    static var bootSoftwareVersionId: ParameterID { return 0x00C1 } // BOOT_SOFTWARE_VERSION_ID
    
    /// Boot Software Version Label
    static var bootSoftwareVersionLabel: ParameterID { return 0x00C2 } // BOOT_SOFTWARE_VERSION_LABEL
    
    //  MARK: DMX512 Setup
    
    /// DMX Personality
    static var dmxPersonality: ParameterID { return 0x00E0 } // DMX_PERSONALITY
    
    /// DMX Personality Description
    static var dmxPersonalityDescription: ParameterID { return 0x00E1 } // DMX_PERSONALITY_DESCRIPTION
    
    /// DMX Start Address
    static var dmxStartAddress: ParameterID { return 0x00F0 } // DMX_START_ADDRESS
    
    /// Slot Info
    static var slotInfo: ParameterID { return 0x0120 } // SLOT_INFO
    
    /// Slot Description
    static var slotDescription: ParameterID { return 0x0121 } // SLOT_DESCRIPTION
    
    /// Default Slot Value
    static var defaultSlotValue: ParameterID { return 0x0122 } // DEFAULT_SLOT_VALUE
    
    //  MARK: Sensors
    // `0x02XX`
    
    /// Sensor Definition
    static var sensorDefinition: ParameterID { return 0x0200 } // SENSOR_DEFINITION
    
    /// Sensor Value
    static var sensorValue: ParameterID { return 0x0201 } // SENSOR_VALUE
    
    /// Record Sensors
    static var recordSensors: ParameterID { return 0x0202 } // RECORD_SENSORS
    
    //  MARK: Dimmer Settings
    // `0x03XX`
    // Future
    
    //  MARK: Power/Lamp Settings
    // `0x04XX`
    
    /// Device Hours
    static var deviceHours: ParameterID { return 0x0400 } // DEVICE_HOURS
    
    /// Lamp Hours
    static var lampHours: ParameterID { return 0x0401 } // LAMP_HOURS
    
    /// Lamp Strikes
    static var lampStrikes: ParameterID { return 0x0402 } // LAMP_STRIKES
    
    /// Lamp State
    static var lampState: ParameterID { return 0x0403 } // LAMP_STATE
    
    /// Lamp On Mode
    /// - SeeAlso: Table A-8
    static var lampOnMode: ParameterID { return 0x0404 } // LAMP_ON_MODE
    
    /// Device Power Cycles
    /// - SeeAlso: Table A-8
    static var devicePowerCycles: ParameterID { return 0x0405 } // DEVICE_POWER_CYCLES
    
    //  MARK: Display Settings
    // `0x05XX`
    
    /// Display Invert
    static var displayInvert: ParameterID { return 0x0500 } // DISPLAY_INVERT
    
    /// Display Level
    static var displayLevel: ParameterID { return 0x0501 } // DISPLAY_LEVEL
    
    //  MARK: Configuration
    // `0x06XX`
    
    /// Pan Invert
    static var panInvert: ParameterID { return 0x0600 } // PAN_INVERT
    
    /// Tilt Invert
    static var tiltInvert: ParameterID { return 0x0601 } // TILT_INVERT
    
    /// Pan Tilt Swap
    static var panTiltSwap: ParameterID { return 0x0602 } // PAN_TILT_SWAP
    
    /// Real Time Clock
    static var realTimeClock: ParameterID { return 0x0603 } // REAL_TIME_CLOCK
    
    //  MARK: Control
    // `0x10XX`
    
    /// Identify Devices
    static var identifyDevice: ParameterID { return 0x1000 } // IDENTIFY_DEVICE
    
    /// Reset Device
    static var resetDevice: ParameterID { return 0x1001 } // RESET_DEVICE
    
    /// Power State
    /// - SeeAlso: Table A-11
    static var powerState: ParameterID { return 0x1010 } // POWER_STATE
    
    /// Perform Self Test
    /// - SeeAlso: Table A-10
    static var performSelfTest: ParameterID { return 0x1020 } // PERFORM_SELFTEST
    
    /// Self Test Description
    static var selfTestDescription: ParameterID { return 0x1021 } // SELF_TEST_DESCRIPTION
    
    /// Capture Preset
    static var capturePreset: ParameterID { return 0x1030 } // CAPTURE_PRESET
    
    /// Preset Playback
    /// - SeeAlso: Table A-7
    static var presetPlayback: ParameterID { return 0x1031 } // PRESET_PLAYBACK
    
    /// ESTA Reserved Future RDM Development        `0x7FE0 - 0x7FFF`
    
    /// Manufacturer-Specific PIDs                                `0x8000 - 0xFFDF`
    static var manufacturerSpecific: Range<UInt16> { return 0x8000 ..< 0xFFE0 }
    
    /// ESTA Reserved Future RDM Development        `0xFFE0 - 0xFFFF`
}

// MARK: - Names

public extension ParameterID {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [ParameterID: String] = [
        .uniqueBranch: "Unique Branch",
        .mute: "Mute",
        .unMute: "Un Mute",
        .proxiedDevices: "Proxy Devices",
        .proxiedDevicesCount: "Proxy Devices Count",
        .communicationStatus: "Communication Status",
        .queuedMessage: "Queue Message",
        .statusMessages: "Status Messages",
        .statusIdDescription: "Status ID Description",
        .clearStatusId: "Clear Status ID",
        .subDeviceStatusReport: "Sub Device Status Report Threshold",
        .supportedParameters: "Supported Parameters",
        .parameterDescription: "Parameter Description",
        .deviceInfo: "Device Info",
        .productDetail: "Product Detail ID List",
        .deviceModelDescription: "Device Model Description",
        .manufacturerLabel: "Manufacturer Label",
        .deviceLabel: "Device Label",
        .factoryDefaults: "Factory Defaults",
        .languageCapabilities: "Language Capabilities",
        .language: "language",
        .softwareVersionLabel: "Software Version Label",
        .bootSoftwareVersionId: "Boot Software Version ID",
        .bootSoftwareVersionLabel: "Boot Software Version Label",
        .dmxPersonality: "DMX Personality",
        .dmxPersonalityDescription: "DMX Personality Description",
        .dmxStartAddress: "DMX Start Address",
        .slotInfo: "Slot Info",
        .slotDescription: "Slot Description",
        .defaultSlotValue: "Default Slot Value",
        .sensorDefinition: "Sensor Definition",
        .sensorValue: "Sensor Value",
        .recordSensors: "Record Sensors",
        .deviceHours: "Device Hours",
        .lampHours: "lampHours",
        .lampStrikes: "Lamp Strikes",
        .lampState: "Lamp State",
        .lampOnMode: "Lamp On Mode",
        .devicePowerCycles: "Device Power Cycles",
        .displayInvert: "Display Invert",
        .displayLevel: "Display Level",
        .panInvert: "Pan Invert",
        .tiltInvert: "Tilt Invert",
        .panTiltSwap: "Pan Tilt Swap",
        .realTimeClock: "Real Time Clock",
        .identifyDevice: "Identify Devices",
        .resetDevice: "Reset Device",
        .powerState: "Power State",
        .performSelfTest: "Perform Self Test",
        .selfTestDescription: "Self Test Description",
        .capturePreset: "Capture Preset",
        .presetPlayback: "Preset Playback"
    ]
}

// MARK: - Get

public extension ParameterID {
    
    var getAllowed: Bool {
        return type(of: self).getAllowed.contains(self)
    }
    
    internal static let getAllowed: Set<ParameterID> = [
        .proxiedDevices,
        .proxiedDevicesCount,
        .communicationStatus,
        .queuedMessage,
        .statusMessages,
        .statusIdDescription,
        .clearStatusId,
        .subDeviceStatusReport,
        .supportedParameters,
        .parameterDescription,
        .deviceInfo,
        .productDetail,
        .deviceModelDescription,
        .manufacturerLabel,
        .deviceLabel,
        .factoryDefaults,
        .languageCapabilities,
        .language,
        .softwareVersionLabel,
        .bootSoftwareVersionId,
        .bootSoftwareVersionLabel,
        .dmxPersonality,
        .dmxPersonalityDescription,
        .dmxStartAddress,
        .slotInfo,
        .slotDescription,
        .defaultSlotValue,
        .sensorDefinition,
        .sensorValue,
        .deviceHours,
        .lampHours,
        .lampStrikes,
        .lampState,
        .lampOnMode,
        .devicePowerCycles,
        .displayInvert,
        .displayLevel,
        .panInvert,
        .tiltInvert,
        .panTiltSwap,
        .realTimeClock,
        .identifyDevice,
        .powerState,
        .performSelfTest,
        .selfTestDescription,
        .presetPlayback
    ]
}

// MARK: - Set

public extension ParameterID {
    
    var setAllowed: Bool {
        return type(of: self).setAllowed.contains(self)
    }
    
    internal static let setAllowed: Set<ParameterID> = [
        .communicationStatus,
        .clearStatusId,
        .subDeviceStatusReport,
        .deviceLabel,
        .factoryDefaults,
        .language,
        .dmxPersonality,
        .dmxStartAddress,
        .sensorValue,
        .recordSensors,
        .deviceHours,
        .lampHours,
        .lampStrikes,
        .lampState,
        .lampOnMode,
        .devicePowerCycles,
        .displayInvert,
        .displayLevel,
        .panInvert,
        .tiltInvert,
        .panTiltSwap,
        .realTimeClock,
        .identifyDevice,
        .resetDevice,
        .powerState,
        .performSelfTest,
        .capturePreset,
        .presetPlayback
    ]
}

// MARK: - Required

public extension ParameterID {
    
    var required: Bool {
        return type(of: self).isRequired.contains(self)
    }
    
    internal static let isRequired: Set<ParameterID> = [
        .uniqueBranch,
        .mute,
        .unMute,
        .supportedParameters,
        .parameterDescription,
        .deviceInfo,
        .softwareVersionLabel,
        .dmxStartAddress,
        .identifyDevice
    ]
}

// MARK: - Data

public extension ParameterID {
    
    internal static var length: Int { return MemoryLayout<ParameterID>.size }
    
    init?(data: Data) {
        guard data.count == ParameterID.length
            else { return nil }
        self.rawValue = UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ParameterID: DataConvertible {
    
    var dataLength: Int {
        return ParameterID.length
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.rawValue.bigEndian
    }
}
