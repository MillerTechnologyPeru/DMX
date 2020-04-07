//
//  GetParameterDescriptionResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
 This parameter is used to retrieve the definition of some manufacturer-specific PIDs.
 The purpose of this parameter is to allow a controller to retrieve enough information about the manufacturer - specific PID to generate Get and Set commands.
 */
public struct GetParameterDescriptionResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .parameterDescription }
    
    public var parameterDescription: ParameterDescription
    
    // MARK: - Initialization
    
    public init(parameterDescription: ParameterDescription) {
        self.parameterDescription = parameterDescription
    }
}

// MARK: - Data

public extension GetParameterDescriptionResponse {
    
    init?(data: Data) {
        guard data.count <= ParameterDescription.maxLength,
              let parameterDescription = ParameterDescription(data: data)
            else { return nil }
        self.init(parameterDescription: parameterDescription)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetParameterDescriptionResponse: DataConvertible {
    
    var dataLength: Int {
        return parameterDescription.dataLength
    }
    
    static func += (data: inout Data, value: GetParameterDescriptionResponse) {
        data += value.parameterDescription.data
    }
}

