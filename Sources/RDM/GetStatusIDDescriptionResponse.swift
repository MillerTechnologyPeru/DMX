//
//  GetStatusIDDescriptionResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
 The response is a ASCII text description. The description may be up to 32 characters.
 */
public struct GetStatusIDDescriptionResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .statusIdDescription }
    
    public static var maxLength: Int { return 32 }
    
    public let response: String
    
    // MARK: - Initialization
    
    /// - parameter response: ASCII text description
    /// - SeeAlso: `StatusMessage.Description`
    public init(response: String) {
        let maxLength = type(of: self).maxLength
        self.response = response.count > maxLength ? String(response.prefix(type(of: self).maxLength)) : response
    }
}

// MARK: - Data

public extension GetStatusIDDescriptionResponse {
    
    init?(data: Data) {
        guard data.count <= type(of: self).maxLength,
            let string = String(data: data, encoding: .utf8)
            else { return nil }
        self.init(response: string)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetStatusIDDescriptionResponse: DataConvertible {
    
    var dataLength: Int {
        return response.utf8.count
    }
    
    static func += (data: inout Data, value: GetStatusIDDescriptionResponse) {
        let utf8 = value.response
            .prefix(type(of: value).maxLength)
            .utf8
        data.append(contentsOf: utf8)
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetStatusIDDescriptionResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(response: value)
    }
}

// MARK: - CustomStringConvertible

extension GetStatusIDDescriptionResponse: CustomStringConvertible {
    
    public var description: String {
        return response
    }
}
