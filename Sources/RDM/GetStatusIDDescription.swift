//
//  GetStatusIDDescription.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
 This parameter is used to request an ASCII text description of a given Status ID
 */
public struct GetStatusIDDescription: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .get }
    
    public static var parameterID: ParameterID { return .statusIdDescription }
    
    public var statusID: StatusMessageID
    
    // MARK: - Initialization
    
    public init(statusID: StatusMessageID) {
        self.statusID = statusID
    }
}

public extension GetStatusIDDescription {
    
    var parameterData: Data {
        return Data([statusID.rawValue.bigEndian.bytes.0,
                     statusID.rawValue.bigEndian.bytes.1])
    }
}
