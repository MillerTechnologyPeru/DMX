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
    public var description: String
    
    // MARK: - Initialization
    
    init(personality: UInt8,
         slots: DMX512Footprint,
         description: String) {
        assert(personality != 0)
        self.personality = personality
        assert(DMX512Footprint.range.contains(slots))
        self.slots = slots
        self.description = description.count > type(of: self).descriptionMaxLength ? String(description.prefix(type(of: self).descriptionMaxLength)) : description
    }
}

// MARK: - Data

public extension DMX512PersonalityDescription {
    
    internal static var descriptionMaxLength: Int { return 32 }
    
    internal static var maxLength: Int { return 35 }
    
    internal static var minLength: Int { return 3 }
    
    init?(data: Data) {
        guard data.count > type(of: self).minLength, data.count <= type(of: self).maxLength
            else { return nil }
        let length = data.count - type(of: self).minLength
        self.personality = data[0]
        self.slots = DMX512Footprint(rawValue: UInt16(bigEndian: UInt16(bytes: (data[1], data[2]))))
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

extension DMX512PersonalityDescription: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).minLength + description.utf8.count
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.personality
        data += value.slots.rawValue.bigEndian
        let utf8 = value.description
            .prefix(type(of: value).descriptionMaxLength)
            .utf8
        data.append(contentsOf: utf8)
    }
}
