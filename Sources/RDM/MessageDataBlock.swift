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
    case getSubDeviceStatusReportingThreshold
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
        case .getSubDeviceStatusReportingThreshold:
            return .get
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
        case .getSubDeviceStatusReportingThreshold:
            return .subDeviceStatusReport
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
            parameterData = data.subdata(in: MessageDataBlock.headerLength ..< MessageDataBlock.headerLength + length)
            
        } else {
            parameterData = Data()
        }
        // TODO:
        fatalError()
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
         case .getSubDeviceStatusReportingThreshold:
            return 0
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
        case .getSubDeviceStatusReportingThreshold:
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
