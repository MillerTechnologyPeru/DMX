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
    
    /// Timing Information
    public var timingInformation: TimingInformation?
    
    /// Data Length
    internal let length: DataLength

    // MARK: - Initialization
    
    public init(scene: UInt16,
                timingInformation: TimingInformation? = nil) {
    
        self.scene = scene
        self.timingInformation = timingInformation
        self.length = timingInformation != nil ? .lengthWithTiming : .length
    }
}

// MARK: - Data

public extension ScenePreset {
    
    init?(data: Data) {
        
        if let length = DataLength(rawValue: data.count) {
            
            switch length {
            case .lengthWithTiming:
                guard let timingInformation = TimingInformation(data: data.subdataNoCopy(in: DataLength.length.rawValue ..< data.count))
                    else { return nil }
                self.init(
                    scene: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))),
                    timingInformation: timingInformation
                )
            case .length:
                self.init(scene: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))))
            }
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
        return length.rawValue
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.scene.bigEndian
        guard let uid = value.timingInformation
            else { return }
        data += uid
    }
}

// MARK: - Supporting Types

// MARK: - Length

extension ScenePreset {
    
    enum DataLength: Int, Equatable {
        
        case length = 2
        case lengthWithTiming = 8
    }
}


// MARK: - TimingInformation

public extension ScenePreset {
    
    struct TimingInformation: Equatable, Hashable {
        
        // MARK: - Properties
        
        /// Up fade Time
        public var upFadeTime: UInt16
        
        /// Down fade Time
        public var downFadeTime: UInt16
        
        /// wall fade Time
        public var wallFadeTime: UInt16
        
        // MARK: - Initialization
        
        public init(upFadeTime: UInt16 = 0,
                    downFadeTime: UInt16 = 0,
                    wallFadeTime: UInt16 = 0) {
        
            self.upFadeTime = upFadeTime
            self.downFadeTime = downFadeTime
            self.wallFadeTime = wallFadeTime
        }
    }
}

// MARK: - Data

public extension ScenePreset.TimingInformation {
    
    internal static var length: Int { return 6 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.upFadeTime = UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))
        self.downFadeTime = UInt16(bigEndian: UInt16(bytes: (data[2], data[3])))
        self.wallFadeTime = UInt16(bigEndian: UInt16(bytes: (data[4], data[5])))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ScenePreset.TimingInformation: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.upFadeTime.bigEndian
        data += value.downFadeTime.bigEndian
        data += value.wallFadeTime.bigEndian
    }
}
