//
//  RDMGetStatusMessagesController.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

import Foundation

public struct GetStatusMessages: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { .get }
    
    public static var parameterID: ParameterID { .statusMessages }
    
    public var status: StatusType
    
    // MARK: - Initialization
    
    public init(status: StatusType) {
        self.status = status
    }
}

public extension GetStatusMessages {
    
    var parameterData: Data {
        return Data([status.rawValue])
    }
}
