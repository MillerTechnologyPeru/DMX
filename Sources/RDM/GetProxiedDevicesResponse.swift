//
//  GetProxiedDevicesResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

import Foundation

/**
 This parameter is used to retrieve the UIDs from a device identified as a proxy during discovery.
 The response to this parameter contains a packed list of 48-bit UIDs for all devices represented by the proxy.
 
 If there are no current devices being proxied then the Parameter Data Length field shall be returned as `0x00`.
*/
public struct GetProxiedDevicesResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .proxiedDevices }
    
    public let proxiedDevices: [DeviceUID]
    
    // MARK: - Initialization
    
    public init(proxiedDevices: [DeviceUID]) {
        self.proxiedDevices = proxiedDevices
    }
}

// MARK: - Data

public extension GetProxiedDevicesResponse {
    
    internal static var maxLength: Int { return 228 } //E4
    
    init?(data: Data) {
        guard data.count % DeviceUID.length == 0, data.count <= type(of: self).maxLength
            else { return nil }
        let count = data.count / DeviceUID.length
        let proxiedDevices = (0 ..< count)
            .map { $0 * DeviceUID.length ..< ($0 + 1) * DeviceUID.length }
            .compactMap { DeviceUID(data: data.subdataNoCopy(in: $0)) }
        assert(proxiedDevices.count == count)
        self.init(proxiedDevices: proxiedDevices)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetProxiedDevicesResponse: DataConvertible {
    
    var dataLength: Int {
        return proxiedDevices.count * DeviceUID.length
    }
    
    static func += (data: inout Data, value: GetProxiedDevicesResponse) {
        value.proxiedDevices.forEach { data += $0 }
    }
}
