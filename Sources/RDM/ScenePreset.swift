//
//  ScenePreset.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

import Foundation

/**
 Scene Preset
 
 - See Also: ANSI E1.20 – 2010, page 97
*/
public struct ScenePreset: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Scene Number
    public var scene: UInt16
    
    /// Up fade Time
    public var upFadeTime: UInt16
    
    /// Down fade Time
    public var downFadeTime: UInt16
    
    /// wall fade Time
    public var wallFadeTime: UInt16
    
    // MARK: - Initialization
    
    public init(scene: UInt16,
                upFadeTime: UInt16 = 0,
                downFadeTime: UInt16 = 0,
                wallFadeTime: UInt16 = 0) {
    
        self.scene = scene
        self.upFadeTime = upFadeTime
        self.downFadeTime = downFadeTime
        self.wallFadeTime = wallFadeTime
    }
}

// MARK: - Data

public extension ScenePreset {
    
    internal static var lengthWithTimes: Int { return 8 }
    
    internal static var length: Int { return 2 }
    
    init?(data: Data) {
        if data.count == type(of: self).lengthWithTimes {
            
            self.init(
                scene: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))),
                upFadeTime: UInt16(bigEndian: UInt16(bytes: (data[2], data[3]))),
                downFadeTime: UInt16(bigEndian: UInt16(bytes: (data[4], data[5]))),
                wallFadeTime: UInt16(bigEndian: UInt16(bytes: (data[6], data[7])))
            )
        } else if data.count == type(of: self).length {
            
            self.init(scene: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))))
        } else {
            return nil
        }
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ScenePreset: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).lengthWithTimes
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.scene.bigEndian
        data += value.upFadeTime.bigEndian
        data += value.downFadeTime.bigEndian
        data += value.wallFadeTime.bigEndian
    }
}
