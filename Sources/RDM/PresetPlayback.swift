//
//  PresetPlayback.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

import Foundation

/**
  Preset Playback
*/
public struct PresetPlayback: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Mode
    public var mode: PresetPlaybackType
    
    /// Level
    public var level: PresetLevel
    
    // MARK: - Initialization
    public init(mode: PresetPlaybackType,
                level: PresetLevel = .full) {
        
        self.mode = mode
        self.level = level
    }
}

// MARK: - Data

extension PresetPlayback {

    internal static var length: Int { return 3 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.mode = PresetPlaybackType(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))))
        self.level = PresetLevel(rawValue: data[2])
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension PresetPlayback: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.mode.rawValue.bigEndian
        data += value.level.rawValue
    }
}
