//
//  GetDMX512PersonalityDescription.swift
//  
//
//  Created by Jorge Loc Rubio on 4/10/20.
//

import Foundation

/**
 This parameter is used to get a descriptive ASCII text label for a given DMX512 Personality.
 */
public struct GetDMX512PersonalityDescription: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .get }
    
    public static var parameterID: ParameterID { return .dmxPersonalityDescription }
    
    public let personality: UInt8
    
    // MARK: - Initialization
    
    public init(personality: UInt8) {
        assert(personality != 0)
        self.personality = personality
    }
}

// MARK: - Data

public extension GetDMX512PersonalityDescription {
    
    internal static var length: Int { return MemoryLayout<UInt8>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(personality: data[0])
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetDMX512PersonalityDescription: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt8>.size
    }
    
    static func += (data: inout Data, value: GetDMX512PersonalityDescription) {
        data += value.personality
    }
}
