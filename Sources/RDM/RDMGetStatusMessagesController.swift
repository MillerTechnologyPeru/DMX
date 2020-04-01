//
//  RDMGetStatusMessagesController.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

import Foundation

public struct RDMGetStatusMessagesController: RDMMessageDataBlockDelegate, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { .get }
    
    public static var parameterID: ParameterID { .statusMessages }
    
    public static var parameterDataLength: UInt8 { 0x01 }
    
    public var parameterData: StatusType
    
    // MARK: - Initialization
    
    public init(parameterData: StatusType) {
        self.parameterData = parameterData
    }
}

// MARK: - CheckSum

public extension RDMGetStatusMessagesController {
    
    var checksum: UInt16 {
        let sum = UInt16(bytes: (0, type(of: self).commandClass.rawValue))
            + UInt16(bytes: (0, type(of: self).parameterID.rawValue.bytes.0))
            + UInt16(bytes: (0, type(of: self).parameterID.rawValue.bytes.1))
            + UInt16(bytes: (0, type(of: self).parameterDataLength))
            + UInt16(bytes: (0, parameterData.rawValue))
        return sum
    }
}

// MARK: - Elements

public extension RDMGetStatusMessagesController {
    
    var elements: UInt8 {
        let sum = 1 // commandClass.rawValue
            + 1 // parameterID.rawValue.bytes.0
            + 1 // parameterID.rawValue.bytes.1
            + 1 // parameterDataLength
            + 1 // parameterData.rawValue
        return UInt8(sum)
    }
}

// MARK: - Data

public extension RDMGetStatusMessagesController {
    
    init?(data: Data) {
        let offset = 1 // CommandClass
            + 2 // ParameterID
            + 1 // ParameterDataLength
        
        let lenghtInt = Int(type(of: self).parameterDataLength)
        guard offset + lenghtInt <= data.count
            else { return nil }
        
        self.parameterData = StatusType(rawValue: data.subdataNoCopy(in: offset ..< offset + lenghtInt)[0])
    }
}
