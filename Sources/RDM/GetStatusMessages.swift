//
//  RDMGetStatusMessagesController.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

import Foundation

/**
 This parameter is used to collect Status or Error information from a device.
 */
public struct GetStatusMessages: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .get }
    
    public static var parameterID: ParameterID { return .statusMessages }
    
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
