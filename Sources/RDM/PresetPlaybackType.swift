//
//  PresetPlayback.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

/**
 Defines Preset Playback Types
 
  - SeeAlso: ANSI E1.20 – 2010, page 109, Table A-7: Preset Playback Defines
 */
public struct PresetPlaybackType: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension PresetPlaybackType: CustomStringConvertible {
    
    public var description: String {
        return name ?? "Plays individual Scene \(Int(rawValue))"
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension PresetPlaybackType: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - Comparable

extension PresetPlaybackType: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

// MARK: - Definitions

public extension PresetPlaybackType {
    
    /// Off
    ///
    /// Returns to Normal DMX512 Input
    static var off: PresetPlaybackType { return 0x0000 } // PRESET_PLAYBACK_OFF
    
    /// All
    ///
    /// Plays Scenes in Sequence if supported.
    static var all: PresetPlaybackType { return 0xFFFF } // PRESET_PLAYBACK_ALL
    
    /// Scene
    ///
    /// Plays individual Scene #
    static var SceneRange: Range<PresetPlaybackType> { return 0x001 ..< 0xFFFF } // PRESET_PLAYBACK_SCENE
}

// MARK: - Names

public extension PresetPlaybackType {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [PresetPlaybackType: String] = [
        .off: "Off",
        .all: "All"
    ]
}
