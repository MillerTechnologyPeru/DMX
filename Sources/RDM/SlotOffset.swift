//
//  SlotOffset.swift
//  
//
//  Created by Jorge Loc Rubio on 4/10/20.
//

import Foundation

/**
 Slot Info
 
 The Slot Offset is a reference to the offset from the DMX512 Starting Address for the device or Sub-Device described by the Slot Label ID.
 The Slot Offset for the first slot of a device (i.e. the DMX512 Starting Address) is 0.
 
 If a device skips or does not use all slots within its footprint range, then those slots shall not be reported in this message.
*/
public struct SlotOffset: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// SlotID / Offset Field
    public var field1: UInt16
    
    /// SlotID Type / Default Slot Value
    public var field2: UInt8
    
    // MARK: - Initialization
    
    internal init(offsetField field1: UInt16, slot field2: UInt8) {
        
        self.field1 = field1
        self.field2 = field2
    }
    
    public init(slotID field1: SlotID, slotType field2: SlotIDType) {
        self.init(offsetField: field1.rawValue, slot: field2.rawValue)
    }
}

// MARK: - Data

public extension SlotOffset {
    
    internal static var length: Int { return 3 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.field1 = UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))
        self.field2 = data[2]
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SlotOffset: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.field1.bigEndian
        data += value.field2
    }
}
