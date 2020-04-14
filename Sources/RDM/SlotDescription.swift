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
    public var description: String
    
    // MARK: - Initialization
    
    public init(slotResquested: SlotID,
                description: String) {
    
        self.slotResquested = slotResquested
        self.description = description
    }
}

// MARK: - Data

public extension SlotDescription {
    
    internal static var descriptionMaxLength: Int { return 32 }
    
    internal static var maxLength: Int { return 34 }
    
    internal static var minLength: Int { return 2 }
    
    init?(data: Data) {
        guard data.count >= type(of: self).minLength,
              data.count <= type(of: self).maxLength
            else { return nil }
        let length = data.count - type(of: self).minLength
        self.slotResquested = SlotID(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))))
        if length > 0 {
            guard let string = String(data: data.subdataNoCopy(in: type(of: self).minLength ..< data.count), encoding: .utf8)
                else { return nil }
            self.description = string
        } else {
            self.description = ""
        }
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SlotDescription: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).minLength + description.utf8.count
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.slotResquested.rawValue.bigEndian
        let utf8 = value.description
            .prefix(type(of: value).descriptionMaxLength)
            .utf8
        data.append(contentsOf: utf8)
    }
}
