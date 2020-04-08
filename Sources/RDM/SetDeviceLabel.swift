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
    
    public static var maxLength: Int { return 32 }
    
    public let deviceLabel: String
    
    // MARK: - Initialization
    
    public init(deviceLabel: String) {
        let maxLength = type(of: self).maxLength
        self.deviceLabel = deviceLabel.count > maxLength ? String(deviceLabel.prefix(type(of: self).maxLength)) : deviceLabel
    }
}

// MARK: - Data

public extension SetDeviceLabel {
    
    init?(data: Data) {
        guard data.count <= type(of: self).maxLength,
            let string = String(data: data, encoding: .utf8)
            else { return nil }
        self.init(deviceLabel: string)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetDeviceLabel: DataConvertible {
    
    var dataLength: Int {
        return deviceLabel.utf8.count
    }
    
    static func += (data: inout Data, value: SetDeviceLabel) {
        let utf8 = value.deviceLabel
            .prefix(type(of: value).maxLength)
            .utf8
        data.append(contentsOf: utf8)
    }
}


// MARK: - ExpressibleByStringLiteral

extension SetDeviceLabel: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(deviceLabel: value)
    }
}

// MARK: - CustomStringConvertible

extension SetDeviceLabel: CustomStringConvertible {
    
    public var description: String {
        return deviceLabel
    }
}
