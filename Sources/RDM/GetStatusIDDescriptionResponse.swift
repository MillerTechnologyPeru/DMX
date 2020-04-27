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
    
    public let response: TextDescription
    
    // MARK: - Initialization
    
    /// - parameter response: ASCII text description
    /// - SeeAlso: `StatusMessage.Description`
    public init(response: TextDescription) {
        self.response = response
    }
}

// MARK: - Data

public extension GetStatusIDDescriptionResponse {
    
    init?(data: Data) {
        guard let string = TextDescription(data: data)
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
        return response.dataLength
    }
    
    static func += (data: inout Data, value: GetStatusIDDescriptionResponse) {
        data += value.response
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetStatusIDDescriptionResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(response: TextDescription(rawValue: value))
    }
}

// MARK: - CustomStringConvertible

extension GetStatusIDDescriptionResponse: CustomStringConvertible {
    
    public var description: String {
        return response.rawValue
    }
}
