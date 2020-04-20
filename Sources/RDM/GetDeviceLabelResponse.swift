//
//  GetDeviceLabelResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/8/20.
//

import Foundation

/**
 This parameter provides a means of setting a descriptive label for each device.
 This may be used for identifying a dimmer rack number or specifying the device’s location.
 */
public struct GetDeviceLabelResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .deviceLabel }
    
    public let deviceLabel: TextDescription
    
    // MARK: - Initialization
    
    public init(deviceLabel: TextDescription) {
        self.deviceLabel = deviceLabel
    }
}

// MARK: - Data

public extension GetDeviceLabelResponse {
    
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

extension GetDeviceLabelResponse: DataConvertible {
    
    var dataLength: Int {
        return deviceLabel.dataLength
    }
    
    static func += (data: inout Data, value: GetDeviceLabelResponse) {
        data += value.deviceLabel
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetDeviceLabelResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(deviceLabel: TextDescription(rawValue: value))
    }
}

// MARK: - CustomStringConvertible

extension GetDeviceLabelResponse: CustomStringConvertible {
    
    public var description: String {
        return deviceLabel.rawValue
    }
}
