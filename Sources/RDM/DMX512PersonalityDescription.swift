//
//  DMX512PersonalityDescription.swift
//  
//
//  Created by Jorge Loc Rubio on 4/10/20.
//

import Foundation

/**
 DMX512 Personality Description

 Contains the Personality Requested, the DMX512 Footprint for that Personality, along with up to 32 characters of description.
 
 - SeeAlso: ANSI E1.20 – 2010, Page 70
 */
public struct DMX512PersonalityDescription: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Personality
    public var personality: UInt8
    
    /// DMX512 Slots Required
    public var slots: DMX512Footprint
    
    /// Personality Description
    public var description: TextDescription
    
    // MARK: - Initialization
    
    init(personality: UInt8,
         slots: DMX512Footprint,
         description: TextDescription) {
        assert(personality != 0)
        self.personality = personality
        assert(DMX512Footprint.range.contains(slots))
        self.slots = slots
        self.description = description
    }
}

// MARK: - Data

public extension DMX512PersonalityDescription {
    
    internal static var maxLength: Int { return 35 }
    
    internal static var minLength: Int { return 3 }
    
    init?(data: Data) {
        guard data.count > type(of: self).minLength, data.count <= type(of: self).maxLength
            else { return nil }
        self.personality = data[0]
        self.slots = DMX512Footprint(rawValue: UInt16(bigEndian: UInt16(bytes: (data[1], data[2]))))
        self.description = TextDescription(data: data.subdataNoCopy(in: type(of: self).minLength ..< data.count)) ?? ""
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension DMX512PersonalityDescription: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).minLength + description.dataLength
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.personality
        data += value.slots.rawValue.bigEndian
        data += value.description
    }
}
