//
//  GetDisplayLevelResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/16/20.
//

import Foundation

/**
 This parameter is used to retrieve or change the Display Intensity setting.
 
 To turn the display off, Display Level shall be set to 0.
 To turn the display on full, Display Level shall be set to 0xFF.
 
 Any value in between represents a relative intensity setting.
 If the device does not support relative intensity settings, any non-zero value shall be interpreted as on.
 
 The Display Level setting shall not override the use of the `IDENTIFY_DEVICE` Parameter for devices that use the display as part of the identification means.
 */
public struct GetDisplayLevelResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .displayLevel }
    
    public let displayLevel: UInt8
    
    // MARK: - Initialization
    
    public init(displayLevel: UInt8) {
        self.displayLevel = displayLevel
    }
}


// MARK: - Data

public extension GetDisplayLevelResponse {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<UInt8>.size
            else { return nil }
        self.init(displayLevel: data[0])
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetDisplayLevelResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt8>.size
    }
    
    static func += (data: inout Data, value: GetDisplayLevelResponse) {
        data += value.displayLevel
    }
}
