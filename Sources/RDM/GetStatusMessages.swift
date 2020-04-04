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

// MARK: - Data

public extension GetStatusMessages {
    
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

extension GetStatusMessages: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: GetStatusMessages) {
        data += value.status.rawValue
    }
}
