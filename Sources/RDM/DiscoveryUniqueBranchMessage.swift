//
//  DiscoveryUniqueBranchMessage.swift
//  
//
//  Created by Jorge Loc Rubio on 4/24/20.
//

import Foundation

/**
 Discovery Unique Branch Message

 A responder shall only respond to this message if its UID is greater than or equal to the Lower Bound UID and less than or equal to the Upper Bound UID included in the message’s parameter data, and if it has not been muted through the `DISC_MUTE` message.
 
 The `DISC_UNIQUE_BRANCH `message shall always be sent to the `ALL_DEVICES_ID` UID Address, since all devices must process this message.
 
 - SeeAlso: ANSI E1.20 – 2010, Page 31
 */
public struct DiscoveryUniqueBranchMessage: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .discovery }
    
    public static var parameterID: ParameterID { return .uniqueBranch }
    
    public let lowerBoundUID: DeviceUID
    
    public let upperBoundUID: DeviceUID
    
    // MARK: - Initialization
    
    public init(lowerBoundUID: DeviceUID,
                upperBoundUID: DeviceUID) {
        
        self.lowerBoundUID = lowerBoundUID
        self.upperBoundUID = upperBoundUID
    }
}

// MARK: - Data

public extension DiscoveryUniqueBranchMessage {
    
    internal static var length: Int { return 12 } //0C
    
    init?(data: Data) {
        guard data.count == type(of: self).length,
            let lowerBoundUID = DeviceUID(data: data.subdataNoCopy(in: 0 ..< DeviceUID.length)),
            let upperBoundUID = DeviceUID(data: data.subdataNoCopy(in: DeviceUID.length ..< data.count))
            else { return nil }
        self.init(lowerBoundUID: lowerBoundUID, upperBoundUID: upperBoundUID)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension DiscoveryUniqueBranchMessage: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: DiscoveryUniqueBranchMessage) {
        data += value.lowerBoundUID
        data += value.upperBoundUID
    }
}
