//
//  SetLampHours.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter is used to retrieve the number of lamp hours or to set the counter in the device to a specific starting value.
  
 The lamp hours are the total number of hours that the lamp has been on.
 The value for this field shall be unsigned and not roll over when maximum value is reached.
 */
public struct SetLampHours: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .lampHours }
    
    public let lampHours: UInt32
    
    // MARK: - Initialization
    
    public init(lampHours: UInt32) {
        self.lampHours = lampHours
    }
}

// MARK: - Data

public extension SetLampHours {
    
    internal static var length: Int { return MemoryLayout<UInt32>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(lampHours: UInt32(bigEndian: UInt32(bytes: (data[0], data[1], data[2], data[3]))))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetLampHours: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt32>.size
    }
    
    static func += (data: inout Data, value: SetLampHours) {
        data += value.lampHours.bigEndian
    }
}
