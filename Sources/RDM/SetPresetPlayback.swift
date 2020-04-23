//
//  SetPresetPlayback.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

import Foundation

/**
 This parameter is used to recall pre-recorded Presets.
 Preset playback types are enumerated by `Table A-7.`
 
 The Level field allows a Master Fader value to be applied to scale the output of the Preset Playback.
 A Level value of `0x00` means preset scaled at 0 and a level value of `0xFF` represents a Preset scaled at full.
 
 If the controller is not capable of supporting the Level capabilities, then it shall set the value to `0xFF`.
 
 Setting the Preset Playback Mode to `OFF` shall restore the device to respond to incoming Null Start Code DMX512 packets, while setting the Level to `0` would leave Preset Playback mode active, but with a zero output intensity level.
 
 Setting Preset Playback Mode to `ALL` shall play the scenes together in a looped sequence for devices supporting that operation.

 Setting the Preset Playback Mode to an individual Scene number shall play an individual scene.
*/
public struct SetPresetPlayback: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .presetPlayback }
    
    public let presetPlayback: PresetPlayback
    
    // MARK: - Initialization
    
    public init(presetPlayback: PresetPlayback) {
        self.presetPlayback = presetPlayback
    }
}

// MARK: - Data

public extension SetPresetPlayback {
    
    init?(data: Data) {
        guard data.count == PresetPlayback.length, let presetPlayback = PresetPlayback(data: data)
            else { return nil }
        self.init(presetPlayback: presetPlayback)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetPresetPlayback: DataConvertible {
    
    var dataLength: Int {
        return presetPlayback.dataLength
    }
    
    static func += (data: inout Data, value: SetPresetPlayback) {
        data += value.presetPlayback
    }
}
