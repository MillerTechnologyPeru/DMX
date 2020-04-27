//
//  GetDMX512PersonalityDescriptionResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/10/20.
//

import Foundation

/**
 This parameter is used to get a descriptive ASCII text label for a given DMX512 Personality.
 The label may be up to 32 characters.
 
 The Response data contains the Personality Requested, the DMX512 Footprint for that Personality, along with up to 32 characters of description.
 */
public struct GetDMX512PersonalityDescriptionResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .dmxPersonalityDescription }
    
    public let description: DMX512PersonalityDescription
    
    // MARK: - Initialization
    
    public init(description: DMX512PersonalityDescription) {
        self.description = description
    }
}

// MARK: - Data

public extension GetDMX512PersonalityDescriptionResponse {
    
    internal static var length: Int { return MemoryLayout<UInt8>.size }
    
    init?(data: Data) {
        guard let description = DMX512PersonalityDescription(data: data)
            else { return nil }
        self.init(description: description)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetDMX512PersonalityDescriptionResponse: DataConvertible {
    
    var dataLength: Int {
        return description.dataLength
    }
    
    static func += (data: inout Data, value: GetDMX512PersonalityDescriptionResponse) {
        data += value.description
    }
}
