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
    
    public var response: String
    
    // MARK: - Initialization
    
    /// - parameter response: ASCII text description
    /// - SeeAlso: `StatusMessage.Description`
    public init(response: String) {
        self.response = response
    }
}

public extension GetStatusIDDescriptionResponse {
    
    init?(data: Data) {
        guard let string = String(data: data, encoding: .utf8)
            else { return nil }
        self.init(response: string)
    }
    
    var data: Data {
        guard let data = response.data(using: .utf8)
            else { fatalError("Cannot encode string to UTF8") }
        return data
    }
}
