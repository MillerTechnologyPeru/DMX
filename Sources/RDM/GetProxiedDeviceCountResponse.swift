//
//  GetProxiedDeviceCount.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

import Foundation

/**
 This parameter is used to identify the number of devices being represented by a proxy and whether the list of represented device UIDs has changed.
 If the List Change flag is set then the controller should `GET: PROXIED_DEVICES`.
 
 The device shall automatically clear the List Change flag after all the proxied UID’s have been retrieved using the `GET: PROXIED_DEVICES` message.
 
 A proxy device shall indicate any change in it's device list through a `QUEUED_MESSAGE` for the `PROXIED_DEVICE_COUNT` PID.
 The controller may then get the current list of proxied devices by sending a `GET_COMMAND` for the `PROXIED_DEVICES` PID.
*/
public struct GetProxiedDeviceCountResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .proxiedDevicesCount }
    
    public let proxiedDeviceCount: ProxiedDeviceCount
    
    // MARK: - Initialization
    
    public init(proxiedDeviceCount: ProxiedDeviceCount) {
        self.proxiedDeviceCount = proxiedDeviceCount
    }
}

// MARK: - Data

public extension GetProxiedDeviceCountResponse {
    
    init?(data: Data) {
        guard let proxiedDeviceCount = ProxiedDeviceCount(data: data)
            else { return nil }
        self.init(proxiedDeviceCount: proxiedDeviceCount)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetProxiedDeviceCountResponse: DataConvertible {
    
    var dataLength: Int {
        return proxiedDeviceCount.dataLength
    }
    
    static func += (data: inout Data, value: GetProxiedDeviceCountResponse) {
        data += value.proxiedDeviceCount
    }
}
