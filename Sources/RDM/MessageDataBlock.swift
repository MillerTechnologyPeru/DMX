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
