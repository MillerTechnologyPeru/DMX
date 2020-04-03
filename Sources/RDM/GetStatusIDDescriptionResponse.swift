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
    
    public var response: String
    
    // MARK: - Initialization
    
    /// - parameter response: ASCII text description
    /// - SeeAlso: `StatusMessage.Description`
    public init(response: String) {
        self.response = response
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
        guard let data = response
            .prefix(type(of: self).maxLength)
            .data(using: .utf8)
            else { fatalError("Cannot encode string to UTF8") }
        return data
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
