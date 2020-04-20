//
//  SetDeviceLabel.swift
//  
//
//  Created by Jorge Loc Rubio on 4/8/20.
//

import Foundation

/**
 This parameter provides a means of setting a descriptive label for each device.
 This may be used for identifying a dimmer rack number or specifying the device’s location.
 */
public struct SetDeviceLabel: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .deviceLabel }
    
    public let deviceLabel: TextDescription
    
    // MARK: - Initialization
    
    public init(deviceLabel: TextDescription) {
        self.deviceLabel = deviceLabel
    }
}

// MARK: - Data

public extension SetDeviceLabel {
    
    init?(data: Data) {
        guard data.count <= TextDescription.maxLength
            else { return nil }
        self.init(deviceLabel: TextDescription(data: data) ?? "")
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetDeviceLabel: DataConvertible {
    
    var dataLength: Int {
        return deviceLabel.dataLength
    }
    
    static func += (data: inout Data, value: SetDeviceLabel) {
        data += value.deviceLabel
    }
}


// MARK: - ExpressibleByStringLiteral

extension SetDeviceLabel: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(deviceLabel: TextDescription(rawValue: value))
    }
}

// MARK: - CustomStringConvertible

extension SetDeviceLabel: CustomStringConvertible {
    
    public var description: String {
        return deviceLabel.rawValue
    }
}
