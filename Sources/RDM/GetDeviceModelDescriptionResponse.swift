//
//  GetDeviceModelDescriptionResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/8/20.
//

import Foundation

/**
This parameter provides a text description of up to 32 characters for the device model type.
 */
public struct GetDeviceModelDescriptionResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .deviceModelDescription }
    
    public let modelDescription: TextDescription
    
    // MARK: - Initialization
    
    public init(modelDescription: TextDescription) {
        self.modelDescription = modelDescription
    }
}

// MARK: - Data

public extension GetDeviceModelDescriptionResponse {
    
    init?(data: Data) {
        guard data.count <= TextDescription.maxLength
            else { return nil }
        self.init(modelDescription: TextDescription(data: data) ?? "")
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetDeviceModelDescriptionResponse: DataConvertible {
    
    var dataLength: Int {
        return modelDescription.dataLength
    }
    
    static func += (data: inout Data, value: GetDeviceModelDescriptionResponse) {
        data += value.modelDescription
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetDeviceModelDescriptionResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(modelDescription: TextDescription(rawValue: value))
    }
}

// MARK: - CustomStringConvertible

extension GetDeviceModelDescriptionResponse: CustomStringConvertible {
    
    public var description: String {
        return modelDescription.rawValue
    }
}
