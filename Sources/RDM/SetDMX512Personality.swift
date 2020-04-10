//
//  SetDMX512Personality.swift
//  
//
//  Created by Jorge Loc Rubio on 4/10/20.
//

import Foundation

/**
 This parameter is used to set the responder’s DMX512 Personality.
 Many devices such as moving lights have different DMX512 “Personalities”.
 Many RDM parameters may be affected by changing personality.
 
 The DMX512 Personality can also be retrieved as part of the `DEVICE_INFO` Parameter Message in Section 10.5.1.
 
 The GET_COMMAND_RESPONSE message includes the current DMX512 Personality setting and also the total number of personalities available.
 These personalities shall be consecutively numbered within the responder starting from 1.
 
 The DMX512 Slot Footprint needed can be accessed from the DMX512 Footprint field in the `DEVICE_INFO` Parameter.
 Text descriptions for a given personality can be retrieved using the `DMX_PERSONALITY_DESCRIPTION` Parameter.
 */
public struct SetDMX512Personality: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .dmxPersonality }
    
    public let personality: UInt8
    
    // MARK: - Initialization
    
    public init(personality: UInt8) {
        assert(personality != 0)
        self.personality = personality
    }
}

// MARK: - Data

public extension SetDMX512Personality {
    
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

extension SetDMX512Personality: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt8>.size
    }
    
    static func += (data: inout Data, value: SetDMX512Personality) {
        data += value.personality
    }
}
