//
//  GetIdentifyDeviceResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/17/20.
//

import Foundation

/**
This parameter is used for the user to physically identify the device represented by the UID.
 
The responder shall physically identify itself using a visible or audible action.
For example, strobing a light or outputting fog.
 
The current state of a responders identification status may be obtained using a `GET:IDENTIFY_DEVICE` message.
 */
public struct GetIdentifyDeviceResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .identifyDevice }
    
    public let identifyDevice: Bool
    
    // MARK: - Initialization
    
    public init(identifyDevice: Bool) {
        self.identifyDevice = identifyDevice
    }
}

// MARK: - Data

public extension GetIdentifyDeviceResponse {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<UInt8>.size,
              let response = Bool(byteValue: data[0])
            else { return nil }
        self.init(identifyDevice: response)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetIdentifyDeviceResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt8>.size
    }
    
    static func += (data: inout Data, value: GetIdentifyDeviceResponse) {
        data += value.identifyDevice.byteValue
    }
}
