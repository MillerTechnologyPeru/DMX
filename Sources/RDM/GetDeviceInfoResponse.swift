//
//  GetDeviceInfoResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/8/20.
//

import Foundation

/**
 This parameter is used to retrieve a variety of information about the device that is normally required by a controller.
*/
public struct GetDeviceInfoResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .deviceInfo }
    
    public let deviceInfo: DeviceInfo
    
    // MARK: - Initialization
    
    public init(deviceInfo: DeviceInfo) {
        self.deviceInfo = deviceInfo
    }
}

// MARK: - Data

public extension GetDeviceInfoResponse {
    
    init?(data: Data) {
        guard data.count == DeviceInfo.length,
              let deviceInfo = DeviceInfo(data: data)
            else { return nil }
        self.init(deviceInfo: deviceInfo)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetDeviceInfoResponse: DataConvertible {
    
    var dataLength: Int {
        return deviceInfo.dataLength
    }
    
    static func += (data: inout Data, value: GetDeviceInfoResponse) {
        data += value.deviceInfo.data
    }
}
