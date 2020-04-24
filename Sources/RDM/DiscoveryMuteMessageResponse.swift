//
//  DiscoveryMuteMessageResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/24/20.
//

import Foundation

/**
 Discovery Mute Message

 A responder port shall set its Mute flag when it receives this message containing its UID, or a broadcast address.
 
 - SeeAlso: ANSI E1.20 – 2010, Page 34
 */
public struct DiscoveryMuteMessageResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .discoveryResponse }
    
    public static var parameterID: ParameterID { return .mute }
    
    public let muteMessage: MuteMessage
    
    // MARK: - Initialization
    
    public init(muteMessage: MuteMessage) {
        
        self.muteMessage = muteMessage
    }
}

// MARK: - Data

public extension DiscoveryMuteMessageResponse {
    
    init?(data: Data) {
        guard let muteMessage = MuteMessage(data: data)
            else { return nil }
        self.init(muteMessage: muteMessage)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension DiscoveryMuteMessageResponse: DataConvertible {
    
    var dataLength: Int {
        return muteMessage.dataLength
    }
    
    static func += (data: inout Data, value: DiscoveryMuteMessageResponse) {
        data += value.muteMessage
    }
}
