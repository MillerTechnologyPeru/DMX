//
//  RDMCategories.swift
//  
//
//  Created by Jorge Loc Rubio on 3/27/20.
//

import Foundation

/**
 RDM  Categories / Parameter ID
  
 - SeeAlso: ANSI E1.20 – 2010, page 101, Appendix A: Defined Parameters (Normative)
*/
public enum RDMCategories: UInt16, Codable {
    // MARK: Network Management
    
    case discoveryUniqueBranch                  = 0x0001    // DISC_UNIQUE_BRANCH
    
    case discoveryMute                          = 0x0002    // DISC_MUTE
    
    case discoveryUnMute                        = 0x0003    // DUSC_UN_MUTE
    
    case proxyDevices                           = 0x0010    // PROXIED_DEVICES
    
    case proxyCount                             = 0x0011    // PROXIED_DEVICE_COUNT
    
    case communicationStatus                    = 0x0015    // COMMS_STATUS
    
    //  MARK: Status Collection
    
    /// - SeeAlso: Table A-4: Status Type
    case queuedMessage                          = 0x0020    // QUEUED_MESSAGE
    
    /// - SeeAlso: Table A-4: Status Type
    case statusMessages                         = 0x0030    // STATUS_MESSAGES
    
    case statusIdDescription                    = 0x0031    // STATUS_ID_DESCRIPTION
    
    case clearStatusId                          = 0x0032    // CLEAR_STATUS_ID
    
    /// - SeeAlso: Table A-4: Status Type
    case subDeviceStatusReport                  = 0x0033    // SUB_DEVICE_STATUS_REPORT_THR ESHOLD
    
    //  MARK: RDM Information
    
    /// Support required only if supporting Parameters beyond the minimum required set.
    case supportedParameters                    = 0x0050    // SUPPORTED_PARAMETERS
    
    /// Support required for Manufacturer-Specific PIDs exposed in SUPPORTED_ PARAMETERS message.
    case parameterDescription                   = 0x0051
    
    //  MARK: Product Information
    
    case deviceInfo                             = 0x0060    // DEVICE_INFO
    
    case productDetail                          = 0x0070    // PRODUCT_DETAIL_ID_LIST
    
    case deviceModelDescription                 = 0x0080    // DEVICE_MODEL_DESCRIPTION
    
    case manufacturerLabel                      = 0x0081    // MANUFACTURER_LABEL
    
    case deviceLabel                            = 0x0082    // DEVICE_LABEL
    
    case factoryDefaults                        = 0x0090    // FACTORY_DEFAULTS
    
    case languageCapabilities                   = 0x00A0    // LANGUAGE_CAPABILITIES
    
    case language                               = 0x00B0    // LANGUAGE
    
    case softwareVersionLabel                   = 0x00C0    // SOFTWARE_VERSION_LABEL
    
    case bootSoftwareVersionId                  = 0x00C1    // BOOT_SOFTWARE_VERSION_ID
    
    case bootSoftwareVersionLabel               = 0x00C2    // BOOT_SOFTWARE_VERSION_LABEL
    
    //  MARK: DMX512 Setup
    
    case dmxPersonality                         = 0x00E0    // DMX_PERSONALITY
    
    case dmxPersonalityDescription              = 0x00E1    // DMX_PERSONALITY_DESCRIPTION
    
    /// Support required if device uses a DMX512 Slot.
    case dmxStartAddress                        = 0x00F0    // DMX_START_ADDRESS
    
    case slotInfo                               = 0x0120    // SLOT_INFO
    
    case slotDescription                        = 0x0121    // SLOT_DESCRIPTION
    
    case defaultSlotValue                       = 0x0122    // DEFAULT_SLOT_VALUE
    
    //  MARK: Sensors
    /// `0x02XX`
    //
    
    case sensorDefinition                       = 0x0200    // SENSOR_DEFINITION
    
    case sensorValue                            = 0x0201    // SENSOR_VALUE
    
    case recordSensors                          = 0x0202    // RECORD_SENSORS
    
    //  MARK: Dimmer Settings
    /// `0x03XX`
    /// Future
    //
    
    //  MARK: Power/Lamp Settings
    /// `0x04XX`
    //
    
    case deviceHours                            = 0x0400    // DEVICE_HOURS
    
    case lampHours                              = 0x0401    // LAMP_HOURS
    
    case lampStrikes                            = 0x0402    // LAMP_STRIKES
    
    case lampState                              = 0x0403    // LAMP_STATE
    
    /// - SeeAlso: Table A-8
    case lampOnMode                             = 0x0404    // LAMP_ON_MODE
    
    /// - SeeAlso: Table A-8
    case devicePowerCycles                      = 0x0405    // DEVICE_POWER_CYCLES
    
    //  MARK: Display Settings
    /// `0x05XX`
    //
    
    case displayInvert                          = 0x0500    // DISPLAY_INVERT
    
    case displayLevel                           = 0x0501    // DISPLAY_LEVEL
    
    //  MARK: Configuration
    /// `0x06XX`
    //
    
    case panInvert                              = 0x0600    // PAN_INVERT
    
    case tiltInvert                             = 0x0601    // TILT_INVERT
    
    case panTiltSwap                            = 0x0602    // PAN_TILT_SWAP
    
    case realTimeClock                          = 0x0603    // REAL_TIME_CLOCK
    
    //  MARK: Control
    /// `0x10XX`
    //
    
    case identifyDevice                         = 0x1000    // IDENTIFY_DEVICE
    
    case resetDevice                            = 0x1001    // RESET_DEVICE
    
    /// - SeeAlso: Table A-11
    case powerState                             = 0x1010    // POWER_STATE
    
    /// - SeeAlso: Table A-10
    case performSelfTest                        = 0x1020    // PERFORM_SELFTEST
    
    case selfTestDescription                    = 0x1021    // SELF_TEST_DESCRIPTION
    
    case capturePreset                          = 0x1030    // CAPTURE_PRESET
    
    /// - SeeAlso: Table A-7
    case presetPlayback                         = 0x1031    // PRESET_PLAYBACK
    
    /// ESTA Reserved Future RDM Development                    `0x7FE0 - 0x7FFF`
    
    /// Manufacturer-Specific PIDs                                            `0x8000 - 0xFFDF`
    
    /// ESTA Reserved Future RDM Development                    `0xFFE0 - 0xFFFF`
}

public extension RDMCategories {
    var isRequired: Bool {
        switch self {
        case .discoveryUniqueBranch,
             .discoveryMute,
             .discoveryUnMute,
             .supportedParameters,
             .parameterDescription,
             .deviceInfo,
             .softwareVersionLabel,
             .dmxStartAddress,
             .identifyDevice:
            return true
            
        case .proxyDevices,
             .proxyCount,
             .communicationStatus,
             .queuedMessage,
             .statusMessages,
             .statusIdDescription,
             .clearStatusId,
             .subDeviceStatusReport,
             .productDetail,
             .deviceModelDescription,
             .manufacturerLabel,
             .deviceLabel,
             .factoryDefaults,
             .languageCapabilities,
             .language,
             .bootSoftwareVersionId,
             .bootSoftwareVersionLabel,
             .dmxPersonality,
             .dmxPersonalityDescription,
             .slotInfo,
             .slotDescription,
             .defaultSlotValue,
             .sensorDefinition,
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
             .resetDevice,
             .powerState,
             .performSelfTest,
             .selfTestDescription,
             .capturePreset,
             .presetPlayback:
            return false
        }
    }
}

public extension RDMCategories {
    var isGetAllowed: Bool {
        switch self {
        case .proxyDevices,
             .proxyCount,
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
             .presetPlayback:
            return true
            
        case .discoveryUniqueBranch,
             .discoveryMute,
             .discoveryUnMute,
             .recordSensors,
             .resetDevice,
             .capturePreset:
            return false
        }
    }
    
    var isSetAllowed: Bool {
        switch self {
        case .communicationStatus,
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
             .presetPlayback:
            return true
            
        case .discoveryUniqueBranch,
             .discoveryMute,
             .discoveryUnMute,
             .proxyDevices,
             .proxyCount,
             .queuedMessage,
             .statusMessages,
             .statusIdDescription,
             .supportedParameters,
             .parameterDescription,
             .deviceInfo,
             .productDetail,
             .deviceModelDescription,
             .manufacturerLabel,
             .languageCapabilities,
             .softwareVersionLabel,
             .bootSoftwareVersionId,
             .bootSoftwareVersionLabel,
             .dmxPersonalityDescription,
             .slotInfo,
             .slotDescription,
             .defaultSlotValue,
             .sensorDefinition,
             .selfTestDescription:
            return false
        }
    }
}
