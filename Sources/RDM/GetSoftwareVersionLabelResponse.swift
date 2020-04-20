//
//  GetSoftwareVersionLabelResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/9/20.
//

import Foundation

/**
 this parameter is used to get a descriptive ASCII text label for the device’s operating software version.
 The descriptive text returned by this parameter is intended for display to the user.
 The label may be up to 32 characters.
 
 The Software Version ID field from the `DEVICE_INFO` parameter should be used for comparing devices from the same Manufacturer with the same Device Model ID to determine if they are running identical software versions.
 */
public struct GetSoftwareVersionLabelResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .softwareVersionLabel }
    
    public let versionLabel: TextDescription
    
    // MARK: - Initialization
    
    public init(versionLabel: TextDescription) {
        self.versionLabel = versionLabel
    }
}

// MARK: - Data

public extension GetSoftwareVersionLabelResponse {
    
    init?(data: Data) {
        guard data.count <= TextDescription.maxLength
            else { return nil }
        self.init(versionLabel: TextDescription(data: data) ?? "")
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetSoftwareVersionLabelResponse: DataConvertible {
    
    var dataLength: Int {
        return versionLabel.dataLength
    }
    
    static func += (data: inout Data, value: GetSoftwareVersionLabelResponse) {
        data += value.versionLabel
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetSoftwareVersionLabelResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(versionLabel: TextDescription(rawValue: value))
    }
}

// MARK: - CustomStringConvertible

extension GetSoftwareVersionLabelResponse: CustomStringConvertible {
    
    public var description: String {
        return versionLabel.rawValue
    }
}
