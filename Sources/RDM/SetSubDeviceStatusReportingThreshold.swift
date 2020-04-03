//
//  SetSubDeviceStatusReportingThreshold.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

public struct SetSubDeviceStatusReportingThreshold: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .subDeviceStatusReport }
    
    public var status: StatusType
        
    // MARK: - Initialization
    
    public init(status: StatusType) {
        self.status = status
    }
}

public extension SetSubDeviceStatusReportingThreshold {
    
    init?(data: Data) {
        guard data.count == 1
            else { return nil }
        self.init(status: StatusType(rawValue: data[0]))
    }
    
    var data: Data {
        return Data([status.rawValue])
    }
}
