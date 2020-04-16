//
//  SetDeviceRealTimeClock.swift
//  
//
//  Created by Jorge Loc Rubio on 4/16/20.
//

import Foundation

/**
 This parameter is used to retrieve or set the real-time clock in a device.
 
 Date and Time fields shall follow the format from` Table 10-2`.
 Hours shall be encoded using 24 hour format.
 */
public struct SetDeviceRealTimeClock: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .realTimeClock }
    
    public let realTimeClock: RealTimeClock
    
    // MARK: - Initialization
    
    public init(realTimeClock: RealTimeClock) {
        self.realTimeClock = realTimeClock
    }
}

// MARK: - Data

public extension SetDeviceRealTimeClock {
    
    internal static var length: Int { return MemoryLayout<RealTimeClock>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length, let realTimeClock = RealTimeClock(data: data)
            else { return nil }
        self.init(realTimeClock: realTimeClock)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetDeviceRealTimeClock: DataConvertible {
    
    var dataLength: Int {
        return realTimeClock.dataLength
    }
    
    static func += (data: inout Data, value: SetDeviceRealTimeClock) {
        data += value.realTimeClock
    }
}
