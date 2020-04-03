//
//  File.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
 This parameter is used to set the verbosity of Sub-Device reporting using the Status Type codes as enumerated in StatusType
 - SeeAlso: `StatusType`
 
 This feature is used to inhibit reports from, for example, a specific dimmer in a rack that is generating repeated errors.
 */
public struct GetSubDeviceStatusReportingThresholdResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .subDeviceStatusReport }
    
    public var status: StatusType
        
    // MARK: - Initialization
    
    public init(status: StatusType) {
        self.status = status
    }
}

public extension GetSubDeviceStatusReportingThresholdResponse {
    
    var parameterData: Data {
        return Data([status.rawValue])
    }
}
