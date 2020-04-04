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
public struct MessageDataBlock: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Command Class
    public var commandClass: CommandClass

    /// Parameter ID
    public var parameterID: ParameterID
    
    /// Parameter Data
    public var parameterData: Data
    
    // MARK: - Initialization
    
    public init(commandClass: CommandClass,
                parameterID: ParameterID,
                parameterData: Data) {
        self.commandClass = commandClass
        self.parameterID = parameterID
        self.parameterData = parameterData
    }
}

// MARK: - Data

public extension MessageDataBlock {
    
    internal static var headerLength: Int { return 4 }
    
    init?(data: Data) {
        guard data.count >= MessageDataBlock.headerLength,
            let commandClass = CommandClass(rawValue: data[0])
            else { return nil }
        
        self.commandClass = commandClass
        self.parameterID = ParameterID(rawValue: UInt16(bigEndian: UInt16(bytes: (data[1], data[2]))))
        let length = Int(data[3])
        if length > 0, data.count == MessageDataBlock.headerLength + length {
            self.parameterData = data.subdata(in: MessageDataBlock.headerLength ..< MessageDataBlock.headerLength + length)
        } else {
            self.parameterData = Data()
        }
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension MessageDataBlock: DataConvertible {
    
    var dataLength: Int {
        return MessageDataBlock.headerLength + parameterData.count
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.commandClass.rawValue
        data += value.parameterID.rawValue.bigEndian
        data += UInt8(value.parameterData.count)
        data += value.parameterData
    }
}

// MARK: - Supporting Types

// MARK: - Protocol

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

// MARK: - ParameterData

public extension MessageDataBlock {
    
    /// RDM Messsage Data Block Parameter Data
    enum ParameterData {
        
        case getStatusMessages(GetStatusMessages)
        case getStatusMessagesResponse(GetStatusMessagesResponse)
        case getQueueMessage(GetQueueMessage)
        case getStatusIDDescription(GetStatusIDDescription)
        case getStatusIDDescriptionResponse(GetStatusIDDescriptionResponse)
        case clearStatusID
        case getSubDeviceStatusReportingThreshold
    }
}

// MARK: DataConvertible

extension MessageDataBlock.ParameterData: DataConvertible {
    
    public var dataLength: Int {
        switch self {
        case let .getStatusMessages(value): return value.dataLength
        case let .getStatusMessagesResponse(value): return value.dataLength
        case let .getQueueMessage(value): return value.dataLength
        case let .getStatusIDDescription(value): return value.dataLength
        case let .getStatusIDDescriptionResponse(value): return value.dataLength
        case .clearStatusID,
             .getSubDeviceStatusReportingThreshold:
            return 0
        }
    }
    
    public static func += (data: inout Data, value: MessageDataBlock.ParameterData) {
        switch value {
        case let .getStatusMessages(value): data += value
        case let .getStatusMessagesResponse(value): data += value
        case let .getQueueMessage(value): data += value
        case let .getStatusIDDescription(value): data += value
        case let .getStatusIDDescriptionResponse(value): data += value
        case .clearStatusID,
             .getSubDeviceStatusReportingThreshold:
            break
        }
    }
}
