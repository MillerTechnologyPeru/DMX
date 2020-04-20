//
//  SlotInfo.swift
//  
//
//  Created by Jorge Loc Rubio on 4/10/20.
//

import Foundation

/**
 Slot Info
 
 This parameter is used to retrieve basic information about the functionality of the DMX512 slots used to control the device.
 The response is a packed list of Slot Label ID’s referencing into the Slot Labels table.
 
 A fixture with multiple parameters of the same type should report multiple slots with the same code.
 For example, a fixture with two static gobo wheels would report two slots of `ST_PRIMARY/ SD_STATIC_GOBO_WHEEL`, which a controller could then interpret as Static Gobo Wheel 1 and Static Gobo Wheel 2.
 
 - See Also: ANSI E1.20 – 2010, page 72
 - See Also: `SlotID`, `SlotIDType`
*/
public struct SlotInfo: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Offset
    public var offset: SlotOffset
    
    /// Slot Label ID
    ///
    /// A Slot Label ID of `0xFFFF` indicates that the description for that slot offset is only available by using the `SLOT_DESCRIPTION` parameter.
    public var slotLabel: UInt16
    
    // MARK: - Initialization
    
    public init(offset: SlotOffset,
                slotLabel: UInt16) {
    
        self.offset = offset
        self.slotLabel = slotLabel
    }
}

// MARK: - Data

public extension SlotInfo {
    
    internal static var length: Int { return 5 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length,
              let offset = SlotOffset(data: data.subdataNoCopy(in: 0 ..< SlotOffset.length))
            else { return nil }
        self.offset = offset
        self.slotLabel = UInt16(bigEndian: UInt16(bytes: (data[3], data[4])))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SlotInfo: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.offset
        data += value.slotLabel.bigEndian
    }
}
