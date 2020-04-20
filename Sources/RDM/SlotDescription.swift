//
//  SlotDescription.swift
//  
//
//  Created by Jorge Loc Rubio on 4/14/20.
//

import Foundation

/**
 Slot Description
 
 - See Also: ANSI E1.20 – 2010, page 73
*/
public struct SlotDescription: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Slot Requested
    public var slotResquested: SlotID
    
    /// Slot Description
    public var description: TextDescription
    
    // MARK: - Initialization
    
    public init(slotResquested: SlotID,
                description: TextDescription) {
    
        self.slotResquested = slotResquested
        self.description = description
    }
}

// MARK: - Data

public extension SlotDescription {
    
    internal static var maxLength: Int { return 34 }
    
    internal static var minLength: Int { return 2 }
    
    init?(data: Data) {
        guard data.count >= type(of: self).minLength,
              data.count <= type(of: self).maxLength
            else { return nil }
        self.slotResquested = SlotID(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))))
        self.description = TextDescription(data: data.subdataNoCopy(in: type(of: self).minLength ..< data.count)) ?? ""
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SlotDescription: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).minLength + description.dataLength
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.slotResquested.rawValue.bigEndian
        data += value.description
    }
}
