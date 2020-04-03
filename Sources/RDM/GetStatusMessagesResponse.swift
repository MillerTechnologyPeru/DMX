//
//  GetStatusMessagesResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/2/20.
//

import Foundation

public struct GetStatusMessagesResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { .getResponse }
    
    public static var parameterID: ParameterID { .statusMessages }
    
    public var statusMessage: [StatusMessage]
    
    // MARK: - Initialization
    
    public init(statusMessage: [StatusMessage]) {
        self.statusMessage = statusMessage
    }
}

public extension GetStatusMessagesResponse {
    
    var parameterData: Data {
        return statusMessage
            .map{ $0.data }
            .reduce(into: Data(), { $0.append( $1 ) })
    }
}
