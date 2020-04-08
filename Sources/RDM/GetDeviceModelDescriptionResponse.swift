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
    
    public static var maxLength: Int { return 32 }
    
    public let modelDescription: String
    
    // MARK: - Initialization
    
    public init(modelDescription: String) {
        let maxLength = type(of: self).maxLength
        self.modelDescription = modelDescription.count > maxLength ? String(modelDescription.prefix(type(of: self).maxLength)) : modelDescription
    }
}

// MARK: - Data

public extension GetDeviceModelDescriptionResponse {
    
    init?(data: Data) {
        guard data.count <= type(of: self).maxLength,
            let string = String(data: data, encoding: .utf8)
            else { return nil }
        self.init(modelDescription: string)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetDeviceModelDescriptionResponse: DataConvertible {
    
    var dataLength: Int {
        return modelDescription.utf8.count
    }
    
    static func += (data: inout Data, value: GetDeviceModelDescriptionResponse) {
        let utf8 = value.modelDescription
            .prefix(type(of: value).maxLength)
            .utf8
        data.append(contentsOf: utf8)
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetDeviceModelDescriptionResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(modelDescription: value)
    }
}

// MARK: - CustomStringConvertible

extension GetDeviceModelDescriptionResponse: CustomStringConvertible {
    
    public var description: String {
        return modelDescription
    }
}
