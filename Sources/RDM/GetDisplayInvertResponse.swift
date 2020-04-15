//
//  GetDisplayInvertResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter is used to retrieve or change the Display Invert setting. Invert is often used to rotate the display image by 180 degrees.
 
 The `Auto` setting is for devices that have the ability to automatically rotate the display based on the orientation of the device.
 Devices not supporting this functionality shall send a NACK Reason of `NR_DATA_OUT_OF_RANGE`.
 */
public struct GetDisplayInvertResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .displayInvert }
    
    public let displayInvertSetting: DisplayInvertSetting
    
    // MARK: - Initialization
    
    public init(displayInvertSetting: DisplayInvertSetting) {
        self.displayInvertSetting = displayInvertSetting
    }
}


// MARK: - Data

public extension GetDisplayInvertResponse {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<DisplayInvertSetting>.size, let displayInvertSetting = DisplayInvertSetting(rawValue: data[0])
            else { return nil }
        self.init(displayInvertSetting: displayInvertSetting)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetDisplayInvertResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<DisplayInvertSetting>.size
    }
    
    static func += (data: inout Data, value: GetDisplayInvertResponse) {
        data += value.displayInvertSetting.rawValue
    }
}
