//
//  SetSubDeviceStatusReportingThresholdResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

public struct SetSubDeviceStatusReportingThresholdResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .setResponse }
    
    public static var parameterID: ParameterID { return .subDeviceStatusReport }
}

public extension SetSubDeviceStatusReportingThresholdResponse {
    
    var parameterData: Data {
        return Data()
    }
}
