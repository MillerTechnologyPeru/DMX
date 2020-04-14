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
}

// MARK: - Properties

public extension MessageDataBlock {
    
    var commandClass: CommandClass {
        switch self {
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
        }
    }
    
    var parameterID: ParameterID {
        switch self {
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
        }
    }
    
    func appendParameterData(_ data: inout Data) {
        switch self {
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
