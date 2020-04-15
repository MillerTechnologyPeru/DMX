//
//  SetDeviceHours.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter is used to retrieve or set the number of hours of operation the device has been in use.
 Some devices may only support the `GET_COMMAND` for this operation and not allow the device’s hours to be set.
 The value for the Device Hours field shall be unsigned and not roll over when maximum value is reached.
 */
public struct SetDeviceHours: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .deviceHours }
    
    public let deviceHours: UInt32
    
    // MARK: - Initialization
    
    public init(deviceHours: UInt32) {
        self.deviceHours = deviceHours
    }
}

// MARK: - Data

public extension SetDeviceHours {
    
    internal static var length: Int { return MemoryLayout<UInt32>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(deviceHours: UInt32(bigEndian: UInt32(bytes: (data[0], data[1], data[2], data[3]))))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetDeviceHours: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt32>.size
    }
    
    static func += (data: inout Data, value: SetDeviceHours) {
        data += value.deviceHours.bigEndian
    }
}
