//
//  CapturePreset.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

import Foundation

/**
 This parameter is used to capture a static scene into a Preset within the responder.
 The actual data that is captured is beyond the scope of this standard.
 Upon receipt of this parameter the responder shall capture the scene and store it to the designated preset.
 
 Fade and Wait times for building sequences may also be included.
 Times are in tenths of a second.
 When timing information is not required the fields shall be set to `0x00`.
 
 The Up Fade Time is the fade in time for the current scene and the Down Fade Time is the down fade for the previous scene or active look.
 The Wait Time is the time the device spends holding the current scene before proceeding to play the next scene when the presets are being played back as a sequence using `PRESET_PLAYBACK_ALL`.
*/
public struct CapturePreset: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .capturePreset }
    
    public let scenePreset: ScenePreset
    
    // MARK: - Initialization
    
    public init(scenePreset: ScenePreset) {
        self.scenePreset = scenePreset
    }
}

// MARK: - Data

public extension CapturePreset {
    
    init?(data: Data) {
        guard data.count == ScenePreset.length || data.count == ScenePreset.lengthWithTimes,
            let scenePreset = ScenePreset(data: data)
            else { return nil }
        self.init(scenePreset: scenePreset)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension CapturePreset: DataConvertible {
    
    var dataLength: Int {
        return scenePreset.dataLength
    }
    
    static func += (data: inout Data, value: CapturePreset) {
        data += value.scenePreset
    }
}
