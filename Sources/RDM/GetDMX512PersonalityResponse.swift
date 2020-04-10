//
//  GetDMX512PersonalityResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/9/20.
//

import Foundation

/**
 This parameter is used to set the responder’s DMX512 Personality.
 Many devices such as moving lights have different DMX512 “Personalities”.
 Many RDM parameters may be affected by changing personality.
 
 The DMX512 Personality can also be retrieved as part of the `DEVICE_INFO` Parameter Message in Section 10.5.1.
 
 The GET_COMMAND_RESPONSE message includes the current DMX512 Personality setting and also the total number of personalities available.
 These personalities shall be consecutively numbered within the responder starting from 1.
 */
public struct GetDMX512PersonalityResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .dmxPersonality }
    
    public let dmxPersonality: DMX512Personality
    
    // MARK: - Initialization
    
    public init(dmxPersonality: DMX512Personality) {
        self.dmxPersonality = dmxPersonality
    }
}

// MARK: - Data

public extension GetDMX512PersonalityResponse {
    
    internal static var length: Int { return 2 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(dmxPersonality: DMX512Personality(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetDMX512PersonalityResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<DMX512Personality>.size
    }
    
    static func += (data: inout Data, value: GetDMX512PersonalityResponse) {
        data += value.dmxPersonality.rawValue.bigEndian
    }
}
