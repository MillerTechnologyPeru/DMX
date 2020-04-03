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
    
    var parameterData: Data {
        return statusMessage
            .map { $0.data }
            .reduce(into: Data(), { $0.append($1) })
    }
}

// MARK: - DataConvertible

extension GetStatusMessagesResponse: DataConvertible {
    
    var dataLength: Int {
        return statusMessage.reduce(0, { $0 + $1.dataLength })
    }
    
    static func += (data: inout Data, value: GetStatusMessagesResponse) {
        value.statusMessage.forEach { data += $0 }
    }
}
