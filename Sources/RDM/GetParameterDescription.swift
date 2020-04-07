//
//  GetParameterDescription.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
 This parameter is used to retrieve the definition of some manufacturer-specific PIDs.
 The purpose of this parameter is to allow a controller to retrieve enough information about the manufacturer - specific PID to generate Get and Set commands.
 */
public struct GetParameterDescription: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .get }
    
    public static var parameterID: ParameterID { return .parameterDescription }
    
    public let parameterID: ParameterID
    
    // MARK: - Initialization
    
    /// - parameter parameterID: The manufacturer specific PID requested by the controller. Range `0x8000 to 0xFFDF`.
    public init(parameterID: ParameterID) {
        assert(ParameterID.manufacturerSpecific.contains(parameterID))
        self.parameterID = parameterID
    }
}

public extension GetParameterDescription {
    
    init?(data: Data) {
        guard data.count == ParameterID.length, let parameterID = ParameterID(data: data)
            else { return nil }
        self.init(parameterID: parameterID)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetParameterDescription: DataConvertible {
    
    var dataLength: Int {
        return ParameterID.length
    }
    
    static func += (data: inout Data, value: GetParameterDescription) {
        data += value.parameterID.rawValue.bigEndian
    }
}
