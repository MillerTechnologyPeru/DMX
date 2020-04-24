//
//  MessageDataBlock.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

import Foundation

/**
  RDM Message Data Block
*/
public enum MessageDataBlock: Equatable, Hashable {
    
    case discoveryUniqueBranchMessage(DiscoveryUniqueBranchMessage)
    case getProxiedDeviceCount
    case getProxiedDeviceCountResponse(GetProxiedDeviceCountResponse)
    case getProxiedDevices
    case getProxiedDevicesResponse(GetProxiedDevicesResponse)
    case getCommsStatus
    case getCommsStatusResponse(GetCommsStatusResponse)
    case setCommsStatus
    case setCommsStatusResponse
    case getStatusMessages(GetStatusMessages)
    case getStatusMessagesResponse(GetStatusMessagesResponse)
    case getQueueMessage(GetQueueMessage)
    case getStatusIDDescription(GetStatusIDDescription)
    case getStatusIDDescriptionResponse(GetStatusIDDescriptionResponse)
    case clearStatusID
    case clearStatusIDResponse
    case getSubDeviceStatusReportingThreshold
    case getSubDeviceStatusReportingThresholdResponse(GetSubDeviceStatusReportingThresholdResponse)
    case setSubDeviceStatusReportingThreshold(SetSubDeviceStatusReportingThreshold)
    case setSubDeviceStatusReportingThresholdResponse
    case getSupportedParameters
    case getSupportedParametersResponse(GetSupportedParametersResponse)
    case getParameterDescription(GetParameterDescription)
    case getParameterDescriptionResponse(GetParameterDescriptionResponse)
    case getDeviceInfo
    case getDeviceInfoResponse(GetDeviceInfoResponse)
    case getProductDetailIDList
    case getProductDetailIDListResponse(GetProductDetailIDListResponse)
    case getDeviceModelDescription
    case getDeviceModelDescriptionResponse(GetDeviceModelDescriptionResponse)
    case getManufacturerLabel
    case getManufacturerLabelResponse(GetManufacturerLabelResponse)
    case getDeviceLabel
    case getDeviceLabelResponse(GetDeviceLabelResponse)
    case setDeviceLabel(SetDeviceLabel)
    case setDeviceLabelResponse
    case getFactoryDefaults
    case getFactoryDefaultsResponse(GetFactoryDefaultsResponse)
    case setFactoryDefaults
    case setFactoryDefaultsResponse
    case getLanguageCapabilities
    case getLanguageCapabilitiesResponse(GetLanguageCapabilitiesResponse)
    case getLanguage
    case getLanguageResponse(GetLanguageResponse)
    case setLanguage(SetLanguage)
    case setLanguageResponse
    case getSoftwareVersionLabel
    case getSoftwareVersionLabelResponse(GetSoftwareVersionLabelResponse)
    case getBootSoftwareVersionID
    case getBootSoftwareVersionIDResponse(GetBootSoftwareVersionIDResponse)
    case getBootSoftwareVersionLabel
    case getBootSoftwareVersionLabelResponse(GetBootSoftwareVersionLabelResponse)
    case getDMX512Personality
    case getDMX512PersonalityResponse(GetDMX512PersonalityResponse)
    case setDMX512Personality(SetDMX512Personality)
    case setDMX512PersonalityResponse
    case getDMX512PersonalityDescription(GetDMX512PersonalityDescription)
    case getDMX512PersonalityDescriptionResponse(GetDMX512PersonalityDescriptionResponse)
    case getDMX512StartingAddress
    case getDMX512StartingAddressResponse(GetDMX512StartingAddressResponse)
    case setDMX512StartingAddress(SetDMX512StartingAddress)
    case setDMX512StartingAddressResponse
    case getSlotInfo
    case getSlotInfoResponse(GetSlotInfoResponse)
    case getSlotDescription(GetSlotDescription)
    case getSlotDescriptionResponse(GetSlotDescriptionResponse)
    case getDefaultSlotValue
    case getDefaultSlotValueResponse(GetDefaultSlotValueResponse)
    case getSensorDefinition(GetSensorDefinition)
    case getSensorDefinitionResponse(GetSensorDefinitionResponse)
    case getSensor(GetSensor)
    case getSensorResponse(GetSensorResponse)
    case setSensor(SetSensor)
    case setSensorResponse(SetSensorResponse)
    case recordSensors(RecordSensors)
    case recordSensorsResponse
    case getDeviceHours
    case getDeviceHoursResponse(GetDeviceHoursResponse)
    case setDeviceHours(SetDeviceHours)
    case setDeviceHoursResponse
    case getLampHours
    case getLampHoursResponse(GetLampHoursResponse)
    case setLampHours(SetLampHours)
    case setLampHoursResponse
    case getLampStrikes
    case getLampStrikesResponse(GetLampStrikesResponse)
    case setLampStrikes(SetLampStrikes)
    case setLampStrikesResponse
    case getLampState
    case getLampStateResponse(GetLampStateResponse)
    case setLampState(SetLampState)
    case setLampStateResponse
    case getLampOnMode
    case getLampOnModeResponse(GetLampOnModeResponse)
    case setLampOnMode(SetLampOnMode)
    case setLampOnModeResponse
    case getDevicePowerCycles
    case getDevicePowerCyclesResponse(GetDevicePowerCyclesResponse)
    case setDevicePowerCycles(SetDevicePowerCycles)
    case setDevicePowerCyclesResponse
    case getDisplayInvert
    case getDisplayInvertResponse(GetDisplayInvertResponse)
    case setDisplayInvert(SetDisplayInvert)
    case setDisplayInvertResponse
    case getDisplayLevel
    case getDisplayLevelResponse(GetDisplayLevelResponse)
    case setDisplayLevel(SetDisplayLevel)
    case setDisplayLevelResponse
    case getPanInvert
    case getPanInvertResponse(GetPanInvertResponse)
    case setPanInvert(SetPanInvert)
    case setPanInvertResponse
    case getTiltInvert
    case getTiltInvertResponse(GetTiltInvertResponse)
    case setTiltInvert(SetTiltInvert)
    case setTiltInvertResponse
    case getPanTiltSwap
    case getPanTiltSwapResponse(GetPanTiltSwapResponse)
    case setPanTiltSwap(SetPanTiltSwap)
    case setPanTiltSwapResponse
    case getDeviceRealTimeClock
    case getDeviceRealTimeClockResponse(GetDeviceRealTimeClockResponse)
    case setDeviceRealTimeClock(SetDeviceRealTimeClock)
    case setDeviceRealTimeClockResponse
    case getIdentifyDevice
    case getIdentifyDeviceResponse(GetIdentifyDeviceResponse)
    case setIdentifyDevice(SetIdentifyDevice)
    case setIdentifyDeviceResponse
    case resetDevice(ResetDevice)
    case resetDeviceResponse
    case getPowerState
    case getPowerStateResponse(GetPowerStateResponse)
    case setPowerState(SetPowerState)
    case setPowerStateResponse
    case getPerformSelfTest
    case getPerformSelfTestResponse(GetPerformSelfTestResponse)
    case setPerformSelfTest(SetPerformSelfTest)
    case setPerformSelfTestResponse
    case getSelfTestDescription(GetSelfTestDescription)
    case getSelfTestDescriptionResponse(GetSelfTestDescriptionResponse)
    case capturePreset(CapturePreset)
    case capturePresetResponse
    case getPresetPlayback
    case getPresetPlaybackResponse(GetPresetPlaybackResponse)
    case setPresetPlayback(SetPresetPlayback)
    case setPresetPlaybackResponse
}

// MARK: - Properties

public extension MessageDataBlock {
    
    var commandClass: CommandClass {
        switch self {
        case let .discoveryUniqueBranchMessage(value):
            return type(of: value).commandClass
        case .getProxiedDeviceCount:
            return .get
        case let .getProxiedDeviceCountResponse(value):
            return type(of: value).commandClass
        case .getProxiedDevices:
            return .get
        case let .getProxiedDevicesResponse(value):
            return type(of: value).commandClass
        case .getCommsStatus:
            return .get
        case let .getCommsStatusResponse(value):
            return type(of: value).commandClass
        case .setCommsStatus:
            return .set
        case .setCommsStatusResponse:
            return .setResponse
        case let .getStatusMessages(value):
            return type(of: value).commandClass
        case let .getStatusMessagesResponse(value):
            return type(of: value).commandClass
        case let .getQueueMessage(value):
            return type(of: value).commandClass
        case let .getStatusIDDescription(value):
            return type(of: value).commandClass
        case let .getStatusIDDescriptionResponse(value):
            return type(of: value).commandClass
        case .clearStatusID:
            return .set
        case .clearStatusIDResponse:
            return .setResponse
        case .getSubDeviceStatusReportingThreshold:
            return .get
        case let .getSubDeviceStatusReportingThresholdResponse(value):
            return type(of: value).commandClass
        case let .setSubDeviceStatusReportingThreshold(value):
            return type(of: value).commandClass
        case .setSubDeviceStatusReportingThresholdResponse:
            return .setResponse
        case .getSupportedParameters:
            return .get
        case let .getSupportedParametersResponse(value):
            return type(of: value).commandClass
        case let .getParameterDescription(value):
            return type(of: value).commandClass
        case let .getParameterDescriptionResponse(value):
            return type(of: value).commandClass
        case .getDeviceInfo:
            return .get
        case let .getDeviceInfoResponse(value):
            return type(of: value).commandClass
        case .getProductDetailIDList:
            return .get
        case let .getProductDetailIDListResponse(value):
            return type(of: value).commandClass
        case .getDeviceModelDescription:
            return .get
        case let .getDeviceModelDescriptionResponse(value):
            return type(of: value).commandClass
        case .getManufacturerLabel:
            return .get
        case let .getManufacturerLabelResponse(value):
            return type(of: value).commandClass
        case .getDeviceLabel:
            return .get
        case let .getDeviceLabelResponse(value):
            return type(of: value).commandClass
        case let .setDeviceLabel(value):
            return type(of: value).commandClass
        case .setDeviceLabelResponse:
            return .setResponse
        case .getFactoryDefaults:
            return .get
        case let .getFactoryDefaultsResponse(value):
            return type(of: value).commandClass
        case .setFactoryDefaults:
            return .set
        case .setFactoryDefaultsResponse:
            return .setResponse
        case .getLanguageCapabilities:
            return .get
        case let .getLanguageCapabilitiesResponse(value):
            return type(of: value).commandClass
        case .getLanguage:
            return .get
        case let .getLanguageResponse(value):
            return type(of: value).commandClass
        case let .setLanguage(value):
            return type(of: value).commandClass
        case .setLanguageResponse:
            return .setResponse
        case .getSoftwareVersionLabel:
            return .get
        case let .getSoftwareVersionLabelResponse(value):
            return type(of: value).commandClass
        case .getBootSoftwareVersionID:
            return .get
        case let .getBootSoftwareVersionIDResponse(value):
            return type(of: value).commandClass
        case .getBootSoftwareVersionLabel:
            return .get
        case let .getBootSoftwareVersionLabelResponse(value):
            return type(of: value).commandClass
        case .getDMX512Personality:
            return .get
        case let .getDMX512PersonalityResponse(value):
            return type(of: value).commandClass
        case let .setDMX512Personality(value):
            return type(of: value).commandClass
        case .setDMX512PersonalityResponse:
            return .setResponse
        case let .getDMX512PersonalityDescription(value):
            return type(of: value).commandClass
        case let .getDMX512PersonalityDescriptionResponse(value):
            return type(of: value).commandClass
        case .getDMX512StartingAddress:
            return .get
        case let .getDMX512StartingAddressResponse(value):
            return type(of: value).commandClass
        case let .setDMX512StartingAddress(value):
            return type(of: value).commandClass
        case .setDMX512StartingAddressResponse:
            return .setResponse
        case .getSlotInfo:
            return .get
        case let .getSlotInfoResponse(value):
            return type(of: value).commandClass
        case let .getSlotDescription(value):
            return type(of: value).commandClass
        case let .getSlotDescriptionResponse(value):
            return type(of: value).commandClass
        case .getDefaultSlotValue:
            return .get
        case let .getDefaultSlotValueResponse(value):
            return type(of: value).commandClass
        case let .getSensorDefinition(value):
            return type(of: value).commandClass
        case let .getSensorDefinitionResponse(value):
            return type(of: value).commandClass
        case let .getSensor(value):
            return type(of: value).commandClass
        case let .getSensorResponse(value):
            return type(of: value).commandClass
        case let .setSensor(value):
            return type(of: value).commandClass
        case let .setSensorResponse(value):
            return type(of: value).commandClass
        case let .recordSensors(value):
            return type(of: value).commandClass
        case .recordSensorsResponse:
            return .setResponse
        case .getDeviceHours:
            return .get
        case let .getDeviceHoursResponse(value):
            return type(of: value).commandClass
        case let .setDeviceHours(value):
            return type(of: value).commandClass
        case .setDeviceHoursResponse:
            return .setResponse
        case .getLampHours:
            return .get
        case let .getLampHoursResponse(value):
            return type(of: value).commandClass
        case let .setLampHours(value):
            return type(of: value).commandClass
        case .setLampHoursResponse:
            return .setResponse
        case .getLampStrikes:
            return .get
        case let .getLampStrikesResponse(value):
            return type(of: value).commandClass
        case let .setLampStrikes(value):
            return type(of: value).commandClass
        case .setLampStrikesResponse:
            return .setResponse
        case .getLampState:
            return .get
        case let .getLampStateResponse(value):
            return type(of: value).commandClass
        case let .setLampState(value):
            return type(of: value).commandClass
        case .setLampStateResponse:
            return .setResponse
        case .getLampOnMode:
            return .get
        case let .getLampOnModeResponse(value):
            return type(of: value).commandClass
        case let .setLampOnMode(value):
            return type(of: value).commandClass
        case .setLampOnModeResponse:
            return .setResponse
        case .getDevicePowerCycles:
            return .get
        case let .getDevicePowerCyclesResponse(value):
            return type(of: value).commandClass
        case let .setDevicePowerCycles(value):
            return type(of: value).commandClass
        case .setDevicePowerCyclesResponse:
            return .setResponse
        case .getDisplayInvert:
            return .get
        case let .getDisplayInvertResponse(value):
            return type(of: value).commandClass
        case let .setDisplayInvert(value):
            return type(of: value).commandClass
        case .setDisplayInvertResponse:
            return .setResponse
        case .getDisplayLevel:
            return .get
        case let .getDisplayLevelResponse(value):
            return type(of: value).commandClass
        case let .setDisplayLevel(value):
            return type(of: value).commandClass
        case .setDisplayLevelResponse:
            return .setResponse
        case .getPanInvert:
            return .get
        case let .getPanInvertResponse(value):
            return type(of: value).commandClass
        case let .setPanInvert(value):
            return type(of: value).commandClass
        case .setPanInvertResponse:
            return .setResponse
        case .getTiltInvert:
            return .get
        case let .getTiltInvertResponse(value):
            return type(of: value).commandClass
        case let .setTiltInvert(value):
            return type(of: value).commandClass
        case .setTiltInvertResponse:
            return .setResponse
        case .getPanTiltSwap:
            return .get
        case let .getPanTiltSwapResponse(value):
            return type(of: value).commandClass
        case let .setPanTiltSwap(value):
            return type(of: value).commandClass
        case .setPanTiltSwapResponse:
            return .setResponse
        case .getDeviceRealTimeClock:
            return .get
        case let .getDeviceRealTimeClockResponse(value):
            return type(of: value).commandClass
        case let .setDeviceRealTimeClock(value):
            return type(of: value).commandClass
        case .setDeviceRealTimeClockResponse:
            return .setResponse
        case .getIdentifyDevice:
            return .get
        case let .getIdentifyDeviceResponse(value):
            return type(of: value).commandClass
        case let .setIdentifyDevice(value):
            return type(of: value).commandClass
        case .setIdentifyDeviceResponse:
            return .setResponse
        case let .resetDevice(value):
            return type(of: value).commandClass
        case .resetDeviceResponse:
            return .setResponse
        case .getPowerState:
            return .get
        case let .getPowerStateResponse(value):
            return type(of: value).commandClass
        case let .setPowerState(value):
            return type(of: value).commandClass
        case .setPowerStateResponse:
            return .setResponse
        case .getPerformSelfTest:
            return .get
        case let .getPerformSelfTestResponse(value):
            return type(of: value).commandClass
        case let .setPerformSelfTest(value):
            return type(of: value).commandClass
        case .setPerformSelfTestResponse:
            return .setResponse
        case let .getSelfTestDescription(value):
            return type(of: value).commandClass
        case let .getSelfTestDescriptionResponse(value):
            return type(of: value).commandClass
        case let .capturePreset(value):
            return type(of: value).commandClass
        case .capturePresetResponse:
            return .setResponse
        case .getPresetPlayback:
            return .get
        case let .getPresetPlaybackResponse(value):
            return type(of: value).commandClass
        case let .setPresetPlayback(value):
            return type(of: value).commandClass
        case .setPresetPlaybackResponse:
            return .setResponse
        }
    }
    
    var parameterID: ParameterID {
        switch self {
        case let .discoveryUniqueBranchMessage(value):
            return type(of: value).parameterID
        case .getProxiedDeviceCount:
            return .proxiedDevicesCount
        case let .getProxiedDeviceCountResponse(value):
            return type(of: value).parameterID
        case .getProxiedDevices:
            return .proxiedDevices
        case let .getProxiedDevicesResponse(value):
            return type(of: value).parameterID
        case .getCommsStatus:
            return .communicationStatus
        case let .getCommsStatusResponse(value):
            return type(of: value).parameterID
        case .setCommsStatus:
            return .communicationStatus
        case .setCommsStatusResponse:
            return .communicationStatus
        case let .getStatusMessages(value):
            return type(of: value).parameterID
        case let .getStatusMessagesResponse(value):
            return type(of: value).parameterID
        case let .getQueueMessage(value):
            return type(of: value).parameterID
        case let .getStatusIDDescription(value):
            return type(of: value).parameterID
        case let .getStatusIDDescriptionResponse(value):
            return type(of: value).parameterID
        case .clearStatusID:
            return .clearStatusId
        case .clearStatusIDResponse:
            return .clearStatusId
        case .getSubDeviceStatusReportingThreshold:
            return .subDeviceStatusReport
        case let .getSubDeviceStatusReportingThresholdResponse(value):
            return type(of: value).parameterID
        case let .setSubDeviceStatusReportingThreshold(value):
            return type(of: value).parameterID
        case .setSubDeviceStatusReportingThresholdResponse:
            return .subDeviceStatusReport
        case .getSupportedParameters:
            return .supportedParameters
        case let .getSupportedParametersResponse(value):
            return type(of: value).parameterID
        case let .getParameterDescription(value):
            return type(of: value).parameterID
        case let .getParameterDescriptionResponse(value):
            return type(of: value).parameterID
        case .getDeviceInfo:
            return .deviceInfo
        case let .getDeviceInfoResponse(value):
            return type(of: value).parameterID
        case .getProductDetailIDList:
            return .productDetail
        case let .getProductDetailIDListResponse(value):
            return type(of: value).parameterID
        case .getDeviceModelDescription:
            return .deviceModelDescription
        case let .getDeviceModelDescriptionResponse(value):
            return type(of: value).parameterID
        case .getManufacturerLabel:
            return .manufacturerLabel
        case let .getManufacturerLabelResponse(value):
            return type(of: value).parameterID
        case .getDeviceLabel:
            return .deviceLabel
        case let .getDeviceLabelResponse(value):
            return type(of: value).parameterID
        case let .setDeviceLabel(value):
            return type(of: value).parameterID
        case .setDeviceLabelResponse:
            return .deviceLabel
        case .getFactoryDefaults:
            return .factoryDefaults
        case let .getFactoryDefaultsResponse(value):
            return type(of: value).parameterID
        case .setFactoryDefaults:
            return .factoryDefaults
        case .setFactoryDefaultsResponse:
            return .factoryDefaults
        case .getLanguageCapabilities:
            return .languageCapabilities
        case let .getLanguageCapabilitiesResponse(value):
            return type(of: value).parameterID
        case .getLanguage:
            return .language
        case let .getLanguageResponse(value):
            return type(of: value).parameterID
        case let .setLanguage(value):
            return type(of: value).parameterID
        case .setLanguageResponse:
            return .language
        case .getSoftwareVersionLabel:
            return .softwareVersionLabel
        case let .getSoftwareVersionLabelResponse(value):
            return type(of: value).parameterID
        case .getBootSoftwareVersionID:
            return .bootSoftwareVersionId
        case let .getBootSoftwareVersionIDResponse(value):
            return type(of: value).parameterID
        case .getBootSoftwareVersionLabel:
            return .bootSoftwareVersionLabel
        case let .getBootSoftwareVersionLabelResponse(value):
            return type(of: value).parameterID
        case .getDMX512Personality:
            return .dmxPersonality
        case let .getDMX512PersonalityResponse(value):
            return type(of: value).parameterID
        case let .setDMX512Personality(value):
            return type(of: value).parameterID
        case .setDMX512PersonalityResponse:
            return .dmxPersonality
        case let .getDMX512PersonalityDescription(value):
            return type(of: value).parameterID
        case let .getDMX512PersonalityDescriptionResponse(value):
            return type(of: value).parameterID
        case .getDMX512StartingAddress:
            return .dmxStartAddress
        case let .getDMX512StartingAddressResponse(value):
            return type(of: value).parameterID
        case let .setDMX512StartingAddress(value):
            return type(of: value).parameterID
        case .setDMX512StartingAddressResponse:
            return .dmxStartAddress
        case .getSlotInfo:
            return .slotInfo
        case let .getSlotInfoResponse(value):
            return type(of: value).parameterID
        case let .getSlotDescription(value):
            return type(of: value).parameterID
        case let .getSlotDescriptionResponse(value):
            return type(of: value).parameterID
        case .getDefaultSlotValue:
            return .defaultSlotValue
        case let .getDefaultSlotValueResponse(value):
            return type(of: value).parameterID
        case let .getSensorDefinition(value):
            return type(of: value).parameterID
        case let .getSensorDefinitionResponse(value):
            return type(of: value).parameterID
        case let .getSensor(value):
            return type(of: value).parameterID
        case let .getSensorResponse(value):
            return type(of: value).parameterID
        case let .setSensor(value):
            return type(of: value).parameterID
        case let .setSensorResponse(value):
            return type(of: value).parameterID
        case let .recordSensors(value):
            return type(of: value).parameterID
        case .recordSensorsResponse:
            return .recordSensors
        case .getDeviceHours:
            return .deviceHours
        case let .getDeviceHoursResponse(value):
            return type(of: value).parameterID
        case let .setDeviceHours(value):
            return type(of: value).parameterID
        case .setDeviceHoursResponse:
            return .deviceHours
        case .getLampHours:
            return .lampHours
        case let .getLampHoursResponse(value):
            return type(of: value).parameterID
        case let .setLampHours(value):
            return type(of: value).parameterID
        case .setLampHoursResponse:
            return .lampHours
        case .getLampStrikes:
            return .lampStrikes
        case let .getLampStrikesResponse(value):
            return type(of: value).parameterID
        case let .setLampStrikes(value):
            return type(of: value).parameterID
        case .setLampStrikesResponse:
            return .lampStrikes
        case .getLampState:
            return .lampState
        case let .getLampStateResponse(value):
            return type(of: value).parameterID
        case let .setLampState(value):
            return type(of: value).parameterID
        case .setLampStateResponse:
            return .lampState
        case .getLampOnMode:
            return .lampOnMode
        case let .getLampOnModeResponse(value):
            return type(of: value).parameterID
        case let .setLampOnMode(value):
            return type(of: value).parameterID
        case .setLampOnModeResponse:
            return .lampOnMode
        case .getDevicePowerCycles:
            return .devicePowerCycles
        case let .getDevicePowerCyclesResponse(value):
            return type(of: value).parameterID
        case let .setDevicePowerCycles(value):
            return type(of: value).parameterID
        case .setDevicePowerCyclesResponse:
            return .devicePowerCycles
        case .getDisplayInvert:
            return .displayInvert
        case let .getDisplayInvertResponse(value):
            return type(of: value).parameterID
        case let .setDisplayInvert(value):
            return type(of: value).parameterID
        case .setDisplayInvertResponse:
            return .displayInvert
        case .getDisplayLevel:
            return .displayLevel
        case let .getDisplayLevelResponse(value):
            return type(of: value).parameterID
        case let .setDisplayLevel(value):
            return type(of: value).parameterID
        case .setDisplayLevelResponse:
            return .displayLevel
        case .getPanInvert:
            return .panInvert
        case let .getPanInvertResponse(value):
            return type(of: value).parameterID
        case let .setPanInvert(value):
            return type(of: value).parameterID
        case .setPanInvertResponse:
            return .panInvert
        case .getTiltInvert:
            return .tiltInvert
        case let .getTiltInvertResponse(value):
            return type(of: value).parameterID
        case let .setTiltInvert(value):
            return type(of: value).parameterID
        case .setTiltInvertResponse:
            return .tiltInvert
        case .getPanTiltSwap:
            return .panTiltSwap
        case let .getPanTiltSwapResponse(value):
            return type(of: value).parameterID
        case let .setPanTiltSwap(value):
            return type(of: value).parameterID
        case .setPanTiltSwapResponse:
            return .panTiltSwap
        case .getDeviceRealTimeClock:
            return .realTimeClock
        case let .getDeviceRealTimeClockResponse(value):
            return type(of: value).parameterID
        case let .setDeviceRealTimeClock(value):
            return type(of: value).parameterID
        case .setDeviceRealTimeClockResponse:
            return .realTimeClock
        case .getIdentifyDevice:
            return .identifyDevice
        case let .getIdentifyDeviceResponse(value):
            return type(of: value).parameterID
        case let .setIdentifyDevice(value):
            return type(of: value).parameterID
        case .setIdentifyDeviceResponse:
            return .identifyDevice
        case let .resetDevice(value):
            return type(of: value).parameterID
        case .resetDeviceResponse:
            return .resetDevice
        case .getPowerState:
            return .powerState
        case let .getPowerStateResponse(value):
            return type(of: value).parameterID
        case let .setPowerState(value):
            return type(of: value).parameterID
        case .setPowerStateResponse:
            return .powerState
        case .getPerformSelfTest:
            return .performSelfTest
        case let .getPerformSelfTestResponse(value):
            return type(of: value).parameterID
        case let .setPerformSelfTest(value):
            return type(of: value).parameterID
        case .setPerformSelfTestResponse:
            return .performSelfTest
        case let .getSelfTestDescription(value):
            return type(of: value).parameterID
        case let .getSelfTestDescriptionResponse(value):
            return type(of: value).parameterID
        case let .capturePreset(value):
            return type(of: value).parameterID
        case .capturePresetResponse:
            return .capturePreset
        case .getPresetPlayback:
            return .presetPlayback
        case let .getPresetPlaybackResponse(value):
            return type(of: value).parameterID
        case let .setPresetPlayback(value):
            return type(of: value).parameterID
        case .setPresetPlaybackResponse:
            return .presetPlayback
        }
    }
}

// MARK: - Data

public extension MessageDataBlock {
    
    internal static var headerLength: Int { return 4 }
    
    init?(data: Data) {
        guard data.count >= MessageDataBlock.headerLength,
            let commandClass = CommandClass(rawValue: data[0])
            else { return nil }
        let parameterID = ParameterID(rawValue: UInt16(bigEndian: UInt16(bytes: (data[1], data[2]))))
        let length = Int(data[3])
        let parameterData: Data
        if length > 0 {
            guard data.count == MessageDataBlock.headerLength + length
                else { return nil }
            parameterData = data.subdataNoCopy(in: MessageDataBlock.headerLength ..< MessageDataBlock.headerLength + length)
        } else {
            parameterData = Data()
        }
        switch (commandClass, parameterID) {
        case (DiscoveryUniqueBranchMessage.commandClass, DiscoveryUniqueBranchMessage.parameterID):
            guard let value = DiscoveryUniqueBranchMessage(data: parameterData)
                else { return nil }
            self = .discoveryUniqueBranchMessage(value)
        case (.get, .proxiedDevicesCount):
            self = .getProxiedDeviceCount
        case (GetProxiedDeviceCountResponse.commandClass, GetProxiedDeviceCountResponse.parameterID):
            guard let value = GetProxiedDeviceCountResponse(data: parameterData)
                else { return nil }
            self = .getProxiedDeviceCountResponse(value)
        case (.get, .proxiedDevices):
            self = .getProxiedDevices
        case (GetProxiedDevicesResponse.commandClass, GetProxiedDevicesResponse.parameterID):
            guard let value = GetProxiedDevicesResponse(data: parameterData)
                else { return nil }
            self = .getProxiedDevicesResponse(value)
        case (.get, .communicationStatus):
            self = .getCommsStatus
        case (GetCommsStatusResponse.commandClass, GetCommsStatusResponse.parameterID):
            guard let value = GetCommsStatusResponse(data: parameterData)
                else { return nil }
            self = .getCommsStatusResponse(value)
        case (.set, .communicationStatus):
            self = .setCommsStatus
        case (.setResponse, .communicationStatus):
            self = .setCommsStatusResponse
        case (GetStatusMessages.commandClass, GetStatusMessages.parameterID):
            guard let value = GetStatusMessages(data: parameterData)
                else { return nil }
            self = .getStatusMessages(value)
        case (GetStatusMessagesResponse.commandClass, GetStatusMessagesResponse.parameterID):
            guard let value = GetStatusMessagesResponse(data: parameterData)
                else { return nil }
            self = .getStatusMessagesResponse(value)
        case (GetQueueMessage.commandClass, GetQueueMessage.parameterID):
            guard let value = GetQueueMessage(data: parameterData)
                else { return nil }
            self = .getQueueMessage(value)
        case (GetStatusIDDescription.commandClass, GetStatusIDDescription.parameterID):
            guard let value = GetStatusIDDescription(data: parameterData)
                else { return nil }
            self = .getStatusIDDescription(value)
        case (GetStatusIDDescriptionResponse.commandClass, GetStatusIDDescriptionResponse.parameterID):
            guard let value = GetStatusIDDescriptionResponse(data: parameterData)
                else { return nil }
            self = .getStatusIDDescriptionResponse(value)
        case (.set, .clearStatusId):
            self = .clearStatusID
        case (.setResponse, .clearStatusId):
            self = .clearStatusIDResponse
        case (.get, .subDeviceStatusReport):
            self = .getSubDeviceStatusReportingThreshold
        case (GetSubDeviceStatusReportingThresholdResponse.commandClass, GetSubDeviceStatusReportingThresholdResponse.parameterID):
            guard let value = GetSubDeviceStatusReportingThresholdResponse(data: parameterData)
                else { return nil }
            self = .getSubDeviceStatusReportingThresholdResponse(value)
        case (SetSubDeviceStatusReportingThreshold.commandClass, SetSubDeviceStatusReportingThreshold.parameterID):
            guard let value = SetSubDeviceStatusReportingThreshold(data: parameterData)
                else { return nil }
            self = .setSubDeviceStatusReportingThreshold(value)
        case (.setResponse, .subDeviceStatusReport):
            self = .setSubDeviceStatusReportingThresholdResponse
        case (.get, .supportedParameters):
            self = .getSupportedParameters
        case (GetSupportedParametersResponse.commandClass, GetSupportedParametersResponse.parameterID):
            guard let value = GetSupportedParametersResponse(data: parameterData)
                else { return nil }
            self = .getSupportedParametersResponse(value)
        case (GetParameterDescription.commandClass, GetParameterDescription.parameterID):
            guard let value = GetParameterDescription(data: parameterData)
                else { return nil }
            self = .getParameterDescription(value)
        case (GetParameterDescriptionResponse.commandClass, GetParameterDescriptionResponse.parameterID):
            guard let value = GetParameterDescriptionResponse(data: parameterData)
                else { return nil }
            self = .getParameterDescriptionResponse(value)
        case (.get, .deviceInfo):
            self = .getDeviceInfo
        case (GetDeviceInfoResponse.commandClass, GetDeviceInfoResponse.parameterID):
            guard let value = GetDeviceInfoResponse(data: parameterData)
                else { return nil }
            self = .getDeviceInfoResponse(value)
        case (.get, .productDetail):
            self = .getProductDetailIDList
        case (GetProductDetailIDListResponse.commandClass, GetProductDetailIDListResponse.parameterID):
            guard let value = GetProductDetailIDListResponse(data: parameterData)
                else { return nil }
            self = .getProductDetailIDListResponse(value)
        case (.get, .deviceModelDescription):
            self = .getDeviceModelDescription
        case (GetDeviceModelDescriptionResponse.commandClass, GetDeviceModelDescriptionResponse.parameterID):
            guard let value = GetDeviceModelDescriptionResponse(data: parameterData)
                else { return nil }
            self = .getDeviceModelDescriptionResponse(value)
        case (.get, .manufacturerLabel):
            self = .getManufacturerLabel
        case (GetManufacturerLabelResponse.commandClass, GetManufacturerLabelResponse.parameterID):
            guard let value = GetManufacturerLabelResponse(data: parameterData)
                else { return nil }
            self = .getManufacturerLabelResponse(value)
        case (.get, .deviceLabel):
            self = .getDeviceLabel
        case (GetDeviceLabelResponse.commandClass, GetDeviceLabelResponse.parameterID):
            guard let value = GetDeviceLabelResponse(data: parameterData)
                else { return nil }
            self = .getDeviceLabelResponse(value)
        case (SetDeviceLabel.commandClass, SetDeviceLabel.parameterID):
            guard let value = SetDeviceLabel(data: parameterData)
                else { return nil }
            self = .setDeviceLabel(value)
        case (.setResponse, .deviceLabel):
            self = .setDeviceLabelResponse
        case (.get, .factoryDefaults):
            self = .getFactoryDefaults
        case (GetFactoryDefaultsResponse.commandClass, GetFactoryDefaultsResponse.parameterID):
            guard let value = GetFactoryDefaultsResponse(data: parameterData)
                else { return nil }
            self = .getFactoryDefaultsResponse(value)
        case (.set, .factoryDefaults):
            self = .setFactoryDefaults
        case (.setResponse, .factoryDefaults):
            self = .setFactoryDefaultsResponse
        case (.get, .languageCapabilities):
            self = .getLanguageCapabilities
        case (GetLanguageCapabilitiesResponse.commandClass, GetLanguageCapabilitiesResponse.parameterID):
            guard let value = GetLanguageCapabilitiesResponse(data: parameterData)
                else { return nil }
            self = .getLanguageCapabilitiesResponse(value)
        case (.get, .language):
            self = .getLanguage
        case (GetLanguageResponse.commandClass, GetLanguageResponse.parameterID):
            guard let value = GetLanguageResponse(data: parameterData)
                else { return nil }
            self = .getLanguageResponse(value)
        case (SetLanguage.commandClass, SetLanguage.parameterID):
            guard let value = SetLanguage(data: parameterData)
                else { return nil }
            self = .setLanguage(value)
        case (.setResponse , .language):
            self = .setLanguageResponse
        case (.get, .softwareVersionLabel):
            self = .getSoftwareVersionLabel
        case (GetSoftwareVersionLabelResponse.commandClass, GetSoftwareVersionLabelResponse.parameterID):
            guard let value = GetSoftwareVersionLabelResponse(data: parameterData)
                else { return nil }
            self = .getSoftwareVersionLabelResponse(value)
        case (.get, .bootSoftwareVersionId):
            self = .getBootSoftwareVersionID
        case (GetBootSoftwareVersionIDResponse.commandClass, GetBootSoftwareVersionIDResponse.parameterID):
            guard let value = GetBootSoftwareVersionIDResponse(data: parameterData)
                else { return nil }
            self = .getBootSoftwareVersionIDResponse(value)
        case (.get, .bootSoftwareVersionLabel):
            self = .getBootSoftwareVersionLabel
        case (GetBootSoftwareVersionLabelResponse.commandClass, GetBootSoftwareVersionLabelResponse.parameterID):
            guard let value = GetBootSoftwareVersionLabelResponse(data: parameterData)
                else { return nil }
            self = .getBootSoftwareVersionLabelResponse(value)
        case (.get, .dmxPersonality):
            self = .getDMX512Personality
        case (GetDMX512PersonalityResponse.commandClass, GetDMX512PersonalityResponse.parameterID):
            guard let value = GetDMX512PersonalityResponse(data: parameterData)
                else { return nil }
            self = .getDMX512PersonalityResponse(value)
        case (SetDMX512Personality.commandClass, SetDMX512Personality.parameterID):
            guard let value = SetDMX512Personality(data: parameterData)
                else { return nil }
            self = .setDMX512Personality(value)
        case (.setResponse, .dmxPersonality):
            self = .setDMX512PersonalityResponse
        case (GetDMX512PersonalityDescription.commandClass, GetDMX512PersonalityDescription.parameterID):
            guard let value = GetDMX512PersonalityDescription(data: parameterData)
                else { return nil }
            self = .getDMX512PersonalityDescription(value)
        case (GetDMX512PersonalityDescriptionResponse.commandClass, GetDMX512PersonalityDescriptionResponse.parameterID):
            guard let value = GetDMX512PersonalityDescriptionResponse(data: parameterData)
                else { return nil }
            self = .getDMX512PersonalityDescriptionResponse(value)
        case (.get, .dmxStartAddress):
            self = .getDMX512StartingAddress
        case (GetDMX512StartingAddressResponse.commandClass, GetDMX512StartingAddressResponse.parameterID):
            guard let value = GetDMX512StartingAddressResponse(data: parameterData)
                else { return nil }
            self = .getDMX512StartingAddressResponse(value)
        case (SetDMX512StartingAddress.commandClass, SetDMX512StartingAddress.parameterID):
            guard let value = SetDMX512StartingAddress(data: parameterData)
                else { return nil }
            self = .setDMX512StartingAddress(value)
        case (.setResponse, .dmxStartAddress):
            self = .setDMX512StartingAddressResponse
        case (.get, .slotInfo):
            self = .getSlotInfo
        case (GetSlotInfoResponse.commandClass, GetSlotInfoResponse.parameterID):
            guard let value = GetSlotInfoResponse(data: parameterData)
                else { return nil }
            self = .getSlotInfoResponse(value)
        case (GetSlotDescription.commandClass, GetSlotDescription.parameterID):
            guard let value =  GetSlotDescription(data: parameterData)
                else { return nil }
            self = .getSlotDescription(value)
        case (GetSlotDescriptionResponse.commandClass, GetSlotDescriptionResponse.parameterID):
            guard let value = GetSlotDescriptionResponse(data: parameterData)
                else { return nil }
            self = .getSlotDescriptionResponse(value)
        case (.get, .defaultSlotValue):
            self = .getDefaultSlotValue
        case (GetDefaultSlotValueResponse.commandClass, GetDefaultSlotValueResponse.parameterID):
            guard let value = GetDefaultSlotValueResponse(data: parameterData)
                else { return nil }
            self = .getDefaultSlotValueResponse(value)
        case (GetSensorDefinition.commandClass, GetSensorDefinition.parameterID):
            guard let value = GetSensorDefinition(data: parameterData)
                else { return nil }
            self = .getSensorDefinition(value)
        case (GetSensorDefinitionResponse.commandClass, GetSensorDefinitionResponse.parameterID):
            guard let value = GetSensorDefinitionResponse(data: parameterData)
                else { return nil }
            self = .getSensorDefinitionResponse(value)
        case (GetSensor.commandClass, GetSensor.parameterID):
            guard let value = GetSensor(data: parameterData)
                else { return nil }
            self = .getSensor(value)
        case (GetSensorResponse.commandClass, GetSensorResponse.parameterID):
            guard let value = GetSensorResponse(data: parameterData)
                else { return nil }
            self = .getSensorResponse(value)
        case (SetSensor.commandClass, SetSensor.parameterID):
            guard let value = SetSensor(data: parameterData)
                else { return nil }
            self = .setSensor(value)
        case (SetSensorResponse.commandClass, SetSensorResponse.parameterID):
            guard let value = SetSensorResponse(data: parameterData)
                else { return nil }
            self = .setSensorResponse(value)
        case (RecordSensors.commandClass, RecordSensors.parameterID):
            guard let value = RecordSensors(data: parameterData)
                else { return nil }
            self = .recordSensors(value)
        case (.setResponse, .recordSensors):
            self = .recordSensorsResponse
        case (.get, .deviceHours):
            self = .getDeviceHours
        case (GetDeviceHoursResponse.commandClass, GetDeviceHoursResponse.parameterID):
            guard let value = GetDeviceHoursResponse(data: parameterData)
                else { return nil }
            self = .getDeviceHoursResponse(value)
        case (SetDeviceHours.commandClass, SetDeviceHours.parameterID):
            guard let value = SetDeviceHours(data: parameterData)
                else { return nil }
            self = .setDeviceHours(value)
        case (.setResponse, .deviceHours):
            self = .setDeviceHoursResponse
        case (.get, .lampHours):
            self = .getLampHours
        case (GetLampHoursResponse.commandClass, GetLampHoursResponse.parameterID):
            guard let value = GetLampHoursResponse(data: parameterData)
                else { return nil }
            self = .getLampHoursResponse(value)
        case (SetLampHours.commandClass, SetLampHours.parameterID):
            guard let value = SetLampHours(data: parameterData)
                else { return nil }
            self = .setLampHours(value)
        case (.setResponse, .lampHours):
            self = .setLampHoursResponse
        case (.get, .lampStrikes):
            self = .getLampStrikes
        case (GetLampStrikesResponse.commandClass, GetLampStrikesResponse.parameterID):
            guard let value = GetLampStrikesResponse(data: parameterData)
                else { return nil }
            self = .getLampStrikesResponse(value)
        case (SetLampStrikes.commandClass, SetLampStrikes.parameterID):
            guard let value = SetLampStrikes(data: parameterData)
                else { return nil }
            self = .setLampStrikes(value)
        case (.setResponse, .lampStrikes):
            self = .setLampStrikesResponse
        case (.get, .lampState):
            self = .getLampState
        case (GetLampStateResponse.commandClass, GetLampStateResponse.parameterID):
            guard let value = GetLampStateResponse(data: parameterData)
                else { return nil }
            self = .getLampStateResponse(value)
        case (SetLampState.commandClass, SetLampState.parameterID):
            guard let value = SetLampState(data: parameterData)
                else { return nil }
            self = .setLampState(value)
        case (.setResponse, .lampState):
            self = .setLampStateResponse
        case (.get, .lampOnMode):
            self = .getLampOnMode
        case (GetLampOnModeResponse.commandClass, GetLampOnModeResponse.parameterID):
            guard let value = GetLampOnModeResponse(data: parameterData)
                else { return nil }
            self = .getLampOnModeResponse(value)
        case (SetLampOnMode.commandClass, SetLampOnMode.parameterID):
            guard let value = SetLampOnMode(data: parameterData)
                else { return nil }
            self = .setLampOnMode(value)
        case (.setResponse, .lampOnMode):
            self = .setLampOnModeResponse
        case (.get, .devicePowerCycles):
            self = .getDevicePowerCycles
        case (GetDevicePowerCyclesResponse.commandClass, GetDevicePowerCyclesResponse.parameterID):
            guard let value = GetDevicePowerCyclesResponse(data: parameterData)
                else { return nil }
            self = .getDevicePowerCyclesResponse(value)
        case (SetDevicePowerCycles.commandClass, SetDevicePowerCycles.parameterID):
            guard let value = SetDevicePowerCycles(data: parameterData)
                else { return nil }
            self = .setDevicePowerCycles(value)
        case (.setResponse, .devicePowerCycles):
            self = .setDevicePowerCyclesResponse
        case (.get, .displayInvert):
            self = .getDisplayInvert
        case (GetDisplayInvertResponse.commandClass, GetDisplayInvertResponse.parameterID):
            guard let value = GetDisplayInvertResponse(data: parameterData)
                else { return nil }
            self = .getDisplayInvertResponse(value)
        case (SetDisplayInvert.commandClass, SetDisplayInvert.parameterID):
            guard let value = SetDisplayInvert(data: parameterData)
                else { return nil }
            self = .setDisplayInvert(value)
        case (.setResponse, .displayInvert):
            self = .setDisplayInvertResponse
        case (.get, .displayLevel):
            self = .getDisplayLevel
        case (GetDisplayLevelResponse.commandClass, GetDisplayLevelResponse.parameterID):
            guard let value = GetDisplayLevelResponse(data: parameterData)
                else { return nil }
            self = .getDisplayLevelResponse(value)
        case (SetDisplayLevel.commandClass, SetDisplayLevel.parameterID):
            guard let value = SetDisplayLevel(data: parameterData)
                else { return nil }
            self = .setDisplayLevel(value)
        case (.setResponse, .displayLevel):
            self = .setDisplayLevelResponse
        case (.get, .panInvert):
            self = .getPanInvert
        case (GetPanInvertResponse.commandClass, GetPanInvertResponse.parameterID):
            guard let value = GetPanInvertResponse(data: parameterData)
                else { return nil }
            self = .getPanInvertResponse(value)
        case (SetPanInvert.commandClass, SetPanInvert.parameterID):
            guard let value = SetPanInvert(data: parameterData)
                else { return nil }
            self = .setPanInvert(value)
        case (.setResponse, .panInvert):
            self = .setPanInvertResponse
        case (.get, .tiltInvert):
            self = .getTiltInvert
        case (GetTiltInvertResponse.commandClass, GetTiltInvertResponse.parameterID):
            guard let value = GetTiltInvertResponse(data: parameterData)
                else { return nil }
            self = .getTiltInvertResponse(value)
        case (SetTiltInvert.commandClass, SetTiltInvert.parameterID):
            guard let value = SetTiltInvert(data: parameterData)
                else { return nil }
            self = .setTiltInvert(value)
        case (.setResponse, .tiltInvert):
            self = .setTiltInvertResponse
        case (.get, .panTiltSwap):
            self = .getPanTiltSwap
        case (GetPanTiltSwapResponse.commandClass, GetPanTiltSwapResponse.parameterID):
            guard let value = GetPanTiltSwapResponse(data: parameterData)
                else { return nil }
            self = .getPanTiltSwapResponse(value)
        case (SetPanTiltSwap.commandClass, SetPanTiltSwap.parameterID):
            guard let value = SetPanTiltSwap(data: parameterData)
                else { return nil }
            self = .setPanTiltSwap(value)
        case (.setResponse, .panTiltSwap):
            self = .setPanTiltSwapResponse
        case (.get, .realTimeClock):
            self = .getDeviceRealTimeClock
        case (GetDeviceRealTimeClockResponse.commandClass, GetDeviceRealTimeClockResponse.parameterID):
            guard let value = GetDeviceRealTimeClockResponse(data: parameterData)
                else { return nil }
            self = .getDeviceRealTimeClockResponse(value)
        case (SetDeviceRealTimeClock.commandClass, SetDeviceRealTimeClock.parameterID):
            guard let value = SetDeviceRealTimeClock(data: parameterData)
                else { return nil }
            self = .setDeviceRealTimeClock(value)
        case (.setResponse, .realTimeClock):
            self = .setDeviceRealTimeClockResponse
        case (.get, .identifyDevice):
            self = .getIdentifyDevice
        case (GetIdentifyDeviceResponse.commandClass, GetIdentifyDeviceResponse.parameterID):
            guard let value = GetIdentifyDeviceResponse(data: parameterData)
                else { return nil }
            self = .getIdentifyDeviceResponse(value)
        case (SetIdentifyDevice.commandClass, SetIdentifyDevice.parameterID):
            guard let value = SetIdentifyDevice(data: parameterData)
                else { return nil }
            self = .setIdentifyDevice(value)
        case (.setResponse, .identifyDevice):
            self = .setIdentifyDeviceResponse
        case (ResetDevice.commandClass, ResetDevice.parameterID):
            guard let value = ResetDevice(data: parameterData)
                else { return nil }
            self = .resetDevice(value)
        case (.setResponse, .resetDevice):
            self = .resetDeviceResponse
        case (.get, .powerState):
            self = .getPowerState
        case (GetPowerStateResponse.commandClass, GetPowerStateResponse.parameterID):
            guard let value = GetPowerStateResponse(data: parameterData)
                else { return nil }
            self = .getPowerStateResponse(value)
        case (SetPowerState.commandClass, SetPowerState.parameterID):
            guard let value = SetPowerState(data: parameterData)
                else { return nil }
            self = .setPowerState(value)
        case (.setResponse, .powerState):
            self = .setPowerStateResponse
        case (.get, .performSelfTest):
            self = .getPerformSelfTest
        case (GetPerformSelfTestResponse.commandClass, GetPerformSelfTestResponse.parameterID):
            guard let value = GetPerformSelfTestResponse(data: parameterData)
                else { return nil }
            self = .getPerformSelfTestResponse(value)
        case (SetPerformSelfTest.commandClass, SetPerformSelfTest.parameterID):
            guard let value = SetPerformSelfTest(data: parameterData)
                else { return nil }
            self = .setPerformSelfTest(value)
        case (.setResponse, .performSelfTest):
            self = .setPerformSelfTestResponse
        case (GetSelfTestDescription.commandClass, GetSelfTestDescription.parameterID):
            guard let value = GetSelfTestDescription(data: parameterData)
                else { return nil }
            self = .getSelfTestDescription(value)
        case (GetSelfTestDescriptionResponse.commandClass, GetSelfTestDescriptionResponse.parameterID):
            guard let value = GetSelfTestDescriptionResponse(data: parameterData)
                else { return nil }
            self = .getSelfTestDescriptionResponse(value)
        case (CapturePreset.commandClass, CapturePreset.parameterID):
            guard let value = CapturePreset(data: parameterData)
                else { return nil }
            self = .capturePreset(value)
        case (.setResponse, .capturePreset):
            self = .capturePresetResponse
        case (.get, .presetPlayback):
            self = .getPresetPlayback
        case (GetPresetPlaybackResponse.commandClass, GetPresetPlaybackResponse.parameterID):
            guard let value = GetPresetPlaybackResponse(data: parameterData)
                else { return nil }
            self = .getPresetPlaybackResponse(value)
        case (SetPresetPlayback.commandClass, SetPresetPlayback.parameterID):
            guard let value = SetPresetPlayback(data: parameterData)
                else { return nil }
            self = .setPresetPlayback(value)
        case (.setResponse, .presetPlayback):
            self = .setPresetPlaybackResponse
        default:
            return nil
        }
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension MessageDataBlock: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).headerLength + parameterDataLength
    }
    
    static func += (data: inout Data, value: MessageDataBlock) {
        data += value.commandClass.rawValue
        data += value.parameterID.rawValue.bigEndian
        data += UInt8(value.parameterDataLength)
        value.appendParameterData(&data)
    }
}

internal extension MessageDataBlock {
    
    var parameterDataLength: Int {
        switch self {
        case let .discoveryUniqueBranchMessage(value): return value.dataLength
        case .getProxiedDeviceCount:
            return 0
        case let .getProxiedDeviceCountResponse(value): return value.dataLength
        case .getProxiedDevices:
            return 0
        case let .getProxiedDevicesResponse(value): return value.dataLength
        case .getCommsStatus:
            return 0
        case let .getCommsStatusResponse(value): return value.dataLength
        case .setCommsStatus:
            return 0
        case .setCommsStatusResponse:
            return 0
        case let .getStatusMessages(value): return value.dataLength
        case let .getStatusMessagesResponse(value): return value.dataLength
        case let .getQueueMessage(value): return value.dataLength
        case let .getStatusIDDescription(value): return value.dataLength
        case let .getStatusIDDescriptionResponse(value): return value.dataLength
        case .clearStatusID:
            return 0
        case .clearStatusIDResponse:
            return 0
        case .getSubDeviceStatusReportingThreshold:
            return 0
        case let .getSubDeviceStatusReportingThresholdResponse(value): return value.dataLength
        case let .setSubDeviceStatusReportingThreshold(value): return value.dataLength
        case .setSubDeviceStatusReportingThresholdResponse:
            return 0
        case .getSupportedParameters:
            return 0
        case let .getSupportedParametersResponse(value): return value.dataLength
        case let .getParameterDescription(value): return value.dataLength
        case let .getParameterDescriptionResponse(value): return value.dataLength
        case .getDeviceInfo:
            return 0
        case let .getDeviceInfoResponse(value): return value.dataLength
        case .getProductDetailIDList:
            return 0
        case let .getProductDetailIDListResponse(value): return value.dataLength
        case .getDeviceModelDescription:
            return 0
        case let .getDeviceModelDescriptionResponse(value): return value.dataLength
        case .getManufacturerLabel:
            return 0
        case let .getManufacturerLabelResponse(value): return value.dataLength
        case .getDeviceLabel:
            return 0
        case let .getDeviceLabelResponse(value): return value.dataLength
        case let .setDeviceLabel(value): return value.dataLength
        case .setDeviceLabelResponse:
            return 0
        case .getFactoryDefaults:
            return 0
        case let .getFactoryDefaultsResponse(value): return value.dataLength
        case .setFactoryDefaults:
            return 0
        case .setFactoryDefaultsResponse:
            return 0
        case .getLanguageCapabilities:
            return 0
        case let .getLanguageCapabilitiesResponse(value): return value.dataLength
        case .getLanguage:
            return 0
        case let .getLanguageResponse(value): return value.dataLength
        case let .setLanguage(value): return value.dataLength
        case .setLanguageResponse:
            return 0
        case .getSoftwareVersionLabel:
            return 0
        case let .getSoftwareVersionLabelResponse(value): return value.dataLength
        case .getBootSoftwareVersionID:
            return 0
        case let .getBootSoftwareVersionIDResponse(value): return value.dataLength
        case .getBootSoftwareVersionLabel:
            return 0
        case let .getBootSoftwareVersionLabelResponse(value): return value.dataLength
        case .getDMX512Personality:
            return 0
        case let .getDMX512PersonalityResponse(value): return value.dataLength
        case let .setDMX512Personality(value): return value.dataLength
        case .setDMX512PersonalityResponse:
            return 0
        case let .getDMX512PersonalityDescription(value): return value.dataLength
        case let .getDMX512PersonalityDescriptionResponse(value): return value.dataLength
        case .getDMX512StartingAddress:
            return 0
        case let .getDMX512StartingAddressResponse(value): return value.dataLength
        case let .setDMX512StartingAddress(value): return value.dataLength
        case .setDMX512StartingAddressResponse:
            return 0
        case .getSlotInfo:
            return 0
        case let .getSlotInfoResponse(value): return value.dataLength
        case let .getSlotDescription(value): return value.dataLength
        case let .getSlotDescriptionResponse(value): return value.dataLength
        case .getDefaultSlotValue:
            return 0
        case let .getDefaultSlotValueResponse(value): return value.dataLength
        case let .getSensorDefinition(value): return value.dataLength
        case let .getSensorDefinitionResponse(value): return value.dataLength
        case let .getSensor(value): return value.dataLength
        case let .getSensorResponse(value): return value.dataLength
        case let .setSensor(value): return value.dataLength
        case let .setSensorResponse(value): return value.dataLength
        case let .recordSensors(value): return value.dataLength
        case .recordSensorsResponse:
            return 0
        case .getDeviceHours:
            return 0
        case let .getDeviceHoursResponse(value): return value.dataLength
        case let .setDeviceHours(value): return value.dataLength
        case .setDeviceHoursResponse:
            return 0
        case .getLampHours:
            return 0
        case let .getLampHoursResponse(value): return value.dataLength
        case let .setLampHours(value): return value.dataLength
        case .setLampHoursResponse:
            return 0
        case .getLampStrikes:
            return 0
        case let .getLampStrikesResponse(value): return value.dataLength
        case let .setLampStrikes(value): return value.dataLength
        case .setLampStrikesResponse:
            return 0
        case .getLampState:
            return 0
        case let .getLampStateResponse(value): return value.dataLength
        case let .setLampState(value): return value.dataLength
        case .setLampStateResponse:
            return 0
        case .getLampOnMode:
            return 0
        case let .getLampOnModeResponse(value): return value.dataLength
        case let .setLampOnMode(value): return value.dataLength
        case .setLampOnModeResponse:
            return 0
        case .getDevicePowerCycles:
            return 0
        case let .getDevicePowerCyclesResponse(value): return value.dataLength
        case let .setDevicePowerCycles(value): return value.dataLength
        case .setDevicePowerCyclesResponse:
            return 0
        case .getDisplayInvert:
            return 0
        case let .getDisplayInvertResponse(value): return value.dataLength
        case let .setDisplayInvert(value): return value.dataLength
        case .setDisplayInvertResponse:
            return 0
        case .getDisplayLevel:
            return 0
        case let .getDisplayLevelResponse(value): return value.dataLength
        case let .setDisplayLevel(value): return value.dataLength
        case .setDisplayLevelResponse:
            return 0
        case .getPanInvert:
            return 0
        case let .getPanInvertResponse(value): return value.dataLength
        case let .setPanInvert(value): return value.dataLength
        case .setPanInvertResponse:
            return 0
        case .getTiltInvert:
            return 0
        case let .getTiltInvertResponse(value): return value.dataLength
        case let .setTiltInvert(value): return value.dataLength
        case .setTiltInvertResponse:
            return 0
        case .getPanTiltSwap:
            return 0
        case let .getPanTiltSwapResponse(value): return value.dataLength
        case let .setPanTiltSwap(value): return value.dataLength
        case .setPanTiltSwapResponse:
            return 0
        case .getDeviceRealTimeClock:
            return 0
        case let .getDeviceRealTimeClockResponse(value): return value.dataLength
        case let .setDeviceRealTimeClock(value): return value.dataLength
        case .setDeviceRealTimeClockResponse:
            return 0
        case .getIdentifyDevice:
            return 0
        case let .getIdentifyDeviceResponse(value): return value.dataLength
        case let .setIdentifyDevice(value): return value.dataLength
        case .setIdentifyDeviceResponse:
            return 0
        case let .resetDevice(value): return value.dataLength
        case .resetDeviceResponse:
            return 0
        case .getPowerState:
            return 0
        case let .getPowerStateResponse(value): return value.dataLength
        case let .setPowerState(value): return value.dataLength
        case .setPowerStateResponse:
            return 0
        case .getPerformSelfTest:
            return 0
        case let .getPerformSelfTestResponse(value): return value.dataLength
        case let .setPerformSelfTest(value): return value.dataLength
        case .setPerformSelfTestResponse:
            return 0
        case let .getSelfTestDescription(value): return value.dataLength
        case let .getSelfTestDescriptionResponse(value): return value.dataLength
        case let .capturePreset(value): return value.dataLength
        case .capturePresetResponse:
            return 0
        case .getPresetPlayback:
            return 0
        case let .getPresetPlaybackResponse(value): return value.dataLength
        case let .setPresetPlayback(value): return value.dataLength
        case .setPresetPlaybackResponse:
            return 0
        }
    }
    
    func appendParameterData(_ data: inout Data) {
        switch self {
        case let .discoveryUniqueBranchMessage(value):
            data += value
        case .getProxiedDeviceCount:
            break
        case let .getProxiedDeviceCountResponse(value):
            data += value
        case .getProxiedDevices:
            break
        case let .getProxiedDevicesResponse(value):
            data += value
        case .getCommsStatus:
            break
        case let .getCommsStatusResponse(value):
            data += value
        case .setCommsStatus:
            break
        case .setCommsStatusResponse:
            break
        case let .getStatusMessages(value):
            data += value
        case let .getStatusMessagesResponse(value):
            data += value
        case let .getQueueMessage(value):
            data += value
        case let .getStatusIDDescription(value):
            data += value
        case let .getStatusIDDescriptionResponse(value):
            data += value
        case .clearStatusID:
            break
        case .clearStatusIDResponse:
            break
        case .getSubDeviceStatusReportingThreshold:
            break
        case let .getSubDeviceStatusReportingThresholdResponse(value):
            data += value
        case let .setSubDeviceStatusReportingThreshold(value):
            data += value
        case .setSubDeviceStatusReportingThresholdResponse:
            break
        case .getSupportedParameters:
            break
        case let .getSupportedParametersResponse(value):
            data += value
        case let .getParameterDescription(value):
            data += value
        case let .getParameterDescriptionResponse(value):
            data += value
        case .getDeviceInfo:
            break
        case let .getDeviceInfoResponse(value):
            data += value
        case .getProductDetailIDList:
            break
        case let .getProductDetailIDListResponse(value):
            data += value
        case .getDeviceModelDescription:
            break
        case let .getDeviceModelDescriptionResponse(value):
            data += value
        case .getManufacturerLabel:
            break
        case let .getManufacturerLabelResponse(value):
            data += value
        case .getDeviceLabel:
            break
        case let .getDeviceLabelResponse(value):
            data += value
        case let .setDeviceLabel(value):
            data += value
        case .setDeviceLabelResponse:
            break
        case .getFactoryDefaults:
            break
        case let .getFactoryDefaultsResponse(value):
            data += value
        case .setFactoryDefaults:
            break
        case .setFactoryDefaultsResponse:
            break
        case .getLanguageCapabilities:
            break
        case let .getLanguageCapabilitiesResponse(value):
            data += value
        case .getLanguage:
            break
        case let .getLanguageResponse(value):
            data += value
        case let .setLanguage(value):
            data += value
        case .setLanguageResponse:
            break
        case .getSoftwareVersionLabel:
            break
        case let .getSoftwareVersionLabelResponse(value):
            data += value
        case .getBootSoftwareVersionID:
            break
        case let .getBootSoftwareVersionIDResponse(value):
            data += value
        case .getBootSoftwareVersionLabel:
            break
        case let .getBootSoftwareVersionLabelResponse(value):
            data += value
        case .getDMX512Personality:
            break
        case let .getDMX512PersonalityResponse(value):
            data += value
        case let .setDMX512Personality(value):
            data += value
        case .setDMX512PersonalityResponse:
            break
        case let .getDMX512PersonalityDescription(value):
            data += value
        case let .getDMX512PersonalityDescriptionResponse(value):
            data += value
        case .getDMX512StartingAddress:
            break
        case let .getDMX512StartingAddressResponse(value):
            data += value
        case let .setDMX512StartingAddress(value):
            data += value
        case .setDMX512StartingAddressResponse:
            break
        case .getSlotInfo:
            break
        case let .getSlotInfoResponse(value):
            data += value
        case let .getSlotDescription(value):
            data += value
        case let .getSlotDescriptionResponse(value):
            data += value
        case .getDefaultSlotValue:
            break
        case let .getDefaultSlotValueResponse(value):
            data += value
        case let .getSensorDefinition(value):
            data += value
        case let .getSensorDefinitionResponse(value):
            data += value
        case let .getSensor(value):
            data += value
        case let .getSensorResponse(value):
            data += value
        case let .setSensor(value):
            data += value
        case let .setSensorResponse(value):
            data += value
        case let .recordSensors(value):
            data += value
        case .recordSensorsResponse:
            break
        case .getDeviceHours:
            break
        case let .getDeviceHoursResponse(value):
            data += value
        case let .setDeviceHours(value):
            data += value
        case .setDeviceHoursResponse:
            break
        case .getLampHours:
            break
        case let .getLampHoursResponse(value):
            data += value
        case let .setLampHours(value):
            data += value
        case .setLampHoursResponse:
            break
        case .getLampStrikes:
            break
        case let .getLampStrikesResponse(value):
            data += value
        case let .setLampStrikes(value):
            data += value
        case .setLampStrikesResponse:
            break
        case .getLampState:
            break
        case let .getLampStateResponse(value):
            data += value
        case let .setLampState(value):
            data += value
        case .setLampStateResponse:
            break
        case .getLampOnMode:
            break
        case let .getLampOnModeResponse(value):
            data += value
        case let .setLampOnMode(value):
            data += value
        case .setLampOnModeResponse:
            break
        case .getDevicePowerCycles:
            break
        case let .getDevicePowerCyclesResponse(value):
            data += value
        case let .setDevicePowerCycles(value):
            data += value
        case .setDevicePowerCyclesResponse:
            break
        case .getDisplayInvert:
            break
        case let .getDisplayInvertResponse(value):
            data += value
        case let .setDisplayInvert(value):
            data += value
        case .setDisplayInvertResponse:
            break
        case .getDisplayLevel:
            break
        case let .getDisplayLevelResponse(value):
            data += value
        case let .setDisplayLevel(value):
            data += value
        case .setDisplayLevelResponse:
            break
        case .getPanInvert:
            break
        case let .getPanInvertResponse(value):
            data += value
        case let .setPanInvert(value):
            data += value
        case .setPanInvertResponse:
            break
        case .getTiltInvert:
            break
        case let .getTiltInvertResponse(value):
            data += value
        case let .setTiltInvert(value):
            data += value
        case .setTiltInvertResponse:
            break
        case .getPanTiltSwap:
            break
        case let .getPanTiltSwapResponse(value):
            data += value
        case let .setPanTiltSwap(value):
            data += value
        case .setPanTiltSwapResponse:
            break
        case .getDeviceRealTimeClock:
            break
        case let .getDeviceRealTimeClockResponse(value):
            data += value
        case let .setDeviceRealTimeClock(value):
            data += value
        case .setDeviceRealTimeClockResponse:
            break
        case .getIdentifyDevice:
            break
        case let .getIdentifyDeviceResponse(value):
            data += value
        case let .setIdentifyDevice(value):
            data += value
        case .setIdentifyDeviceResponse:
            break
        case let .resetDevice(value):
            data += value
        case .resetDeviceResponse:
            break
        case .getPowerState:
            break
        case let .getPowerStateResponse(value):
            data += value
        case let .setPowerState(value):
            data += value
        case .setPowerStateResponse:
            break
        case .getPerformSelfTest:
            break
        case let .getPerformSelfTestResponse(value):
            data += value
        case let .setPerformSelfTest(value):
            data += value
        case .setPerformSelfTestResponse:
            break
        case let .getSelfTestDescription(value):
            data += value
        case let .getSelfTestDescriptionResponse(value):
            data += value
        case let .capturePreset(value):
            data += value
        case .capturePresetResponse:
            break
        case .getPresetPlayback:
            break
        case let .getPresetPlaybackResponse(value):
            data += value
        case let .setPresetPlayback(value):
            data += value
        case .setPresetPlaybackResponse:
            break
        }
    }
}

// MARK: - Supporting Types

/**
  RDM Message Data Block Protocol
*/
public protocol MessageDataBlockProtocol {
    
    /// Command Class
    static var commandClass: CommandClass { get }

    /// Parameter ID
    static var parameterID: ParameterID { get }
    
    /// Initialize from parameter data.
    init?(data: Data)
    
    /// Parameter Data
    var data: Data { get }
}
