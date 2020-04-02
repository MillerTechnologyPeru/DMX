//
//  MessageDataBlock.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

import Foundation

/**
  RDM Message Data Block
*/
public struct MessageDataBlock: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Command Class
    public var commandClass: CommandClass

    /// Parameter ID
    public var parameterID: ParameterID
    
    /// Parameter Data
    public var parameterData: Data
    
    // MARK: - Initialization
    
    public init(commandClass: CommandClass,
                parameterID: ParameterID,
                parameterData: Data) {
        self.commandClass = commandClass
        self.parameterID = parameterID
        self.parameterData = parameterData
    }
}

// MARK: - Data

public extension MessageDataBlock {
    
    init?(data: Data) {
        guard data.count >= 3,
            let commandClass = CommandClass(rawValue: data[0])
            else { return nil }
        
        self.commandClass = commandClass
        self.parameterID = ParameterID(rawValue: UInt16(bigEndian: UInt16(bytes: (data[1], data[2]))))
        if data.count > 3 {
            self.parameterData = data.suffix(from: 3)
        } else {
            self.parameterData = Data()
        }
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension MessageDataBlock: DataConvertible {
    
    var dataLength: Int {
        return 3 + parameterData.count
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.commandClass.rawValue
        data += value.parameterID.rawValue.bigEndian
        data += value.parameterData
    }
}

// MARK: - Supporting Types

/**
  RDM Message Data Block Protocol
*/
public protocol MessageDataBlockProtocol {
    
    /// Command Class
    static var commandClass: CommandClass { get }

    /// Parameter ID
    static var parameterID: ParameterID { get }
    
    /// Parameter Data
    var parameterData: Data { get }
}
