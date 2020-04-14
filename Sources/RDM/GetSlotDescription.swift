//
//  GetSlotDescription.swift
//  
//
//  Created by Jorge Loc Rubio on 4/14/20.
//

import Foundation

/**
 This parameter is used for requesting an ASCII text description for DMX512 slot offsets.
*/
public struct GetSlotDescription: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .get }
    
    public static var parameterID: ParameterID { return .slotDescription }
    
    public let slotRequested: SlotID
    
    // MARK: - Initialization
    
    public init(slotRequested: SlotID) {
        self.slotRequested = slotRequested
    }
}

// MARK: - Data

public extension GetSlotDescription {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<SlotID>.size
            else { return nil }
        self.init(slotRequested: SlotID(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetSlotDescription: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<SlotID>.size
    }
    
    static func += (data: inout Data, value: GetSlotDescription) {
        data += value.slotRequested.rawValue.bigEndian
    }
}
