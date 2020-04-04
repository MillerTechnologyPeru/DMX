//
//  GetQueueMessage.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
 The `QUEUED_MESSAGE` parameter shall be used to retrieve a message from the responder’s message queue.
 The Message Count field of all response messages defines the number of messages that are queued in the responder.
 Each `QUEUED_MESSAGE` response shall be composed of a single message response.
 
 A responder with multiple messages queued shall first respond with the most urgent message.
 The message count of the responder shall be decremented prior to sending the response.
 
 A responder with no messages queued shall respond to a `QUEUED_MESSAGE `message with a `STATUS_MESSAGES` response.
 A `STATUS_MESSAGE` response with a PDL of `0x00` does not imply that the responder supports the S`TATUS_MESSAGES` PID.
 
 A `SET_COMMAND` has no action with `QUEUED_MESSAGE`.
 */
public struct GetQueueMessage: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .get }
    
    public static var parameterID: ParameterID { return .queuedMessage }
    
    public var status: StatusType
    
    // MARK: - Initialization
    
    /// - parameter status: `StatusType.none` is not allowed to use in this packet
    public init(status: StatusType) {
        assert(status != .none, ".none is not allowed for use in this packet")
        self.status = status
    }
}

// MARK: - Data

public extension GetQueueMessage {
    
    internal static var length: Int { return MemoryLayout<StatusType>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(status: StatusType(rawValue: data[0]))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetQueueMessage: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: GetQueueMessage) {
        data += value.status.rawValue
    }
}
