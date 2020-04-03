//
//  GetStatusMessagesResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/2/20.
//

import Foundation

/**
 The response is a packed list of all status messages for the device.
 */
public struct GetStatusMessagesResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .statusMessages }
    
    public var statusMessage: [StatusMessage]
    
    // MARK: - Initialization
    
    public init(statusMessage: [StatusMessage]) {
        self.statusMessage = statusMessage
    }
}

// MARK: - Data

public extension GetStatusMessagesResponse {
    
    init?(data: Data) {
        guard data.count % StatusMessage.length == 0
            else { return nil }
        let count = data.count / StatusMessage.length
        let messages = (0 ..< count)
            .map { $0 * StatusMessage.length ..< ($0 + 1) * StatusMessage.length }
            .compactMap { StatusMessage(data: data.subdataNoCopy(in: $0)) }
        assert(messages.count == count)
        self.init(statusMessage: messages)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetStatusMessagesResponse: DataConvertible {
    
    var dataLength: Int {
        return statusMessage.count * StatusMessage.length
    }
    
    static func += (data: inout Data, value: GetStatusMessagesResponse) {
        value.statusMessage.forEach { data += $0 }
    }
}
