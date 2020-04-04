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

// MARK: - Data

public extension SetSubDeviceStatusReportingThreshold {
    
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

extension SetSubDeviceStatusReportingThreshold: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: SetSubDeviceStatusReportingThreshold) {
        data += value.status.rawValue
    }
}
