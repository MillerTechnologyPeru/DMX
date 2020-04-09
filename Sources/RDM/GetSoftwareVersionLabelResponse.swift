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
    
    public static var maxLength: Int { return 32 }
    
    public let versionLabel: String
    
    // MARK: - Initialization
    
    public init(versionLabel: String) {
        let maxLength = type(of: self).maxLength
        self.versionLabel = versionLabel.count > maxLength ? String(versionLabel.prefix(type(of: self).maxLength)) : versionLabel
    }
}

// MARK: - Data

public extension GetSoftwareVersionLabelResponse {
    
    init?(data: Data) {
        guard data.count <= type(of: self).maxLength,
            let name = String(data: data, encoding: .utf8)
            else { return nil }
        self.init(versionLabel: name)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetSoftwareVersionLabelResponse: DataConvertible {
    
    var dataLength: Int {
        return versionLabel.utf8.count
    }
    
    static func += (data: inout Data, value: GetSoftwareVersionLabelResponse) {
        let utf8 = value.versionLabel
            .prefix(type(of: value).maxLength)
            .utf8
        data.append(contentsOf: utf8)
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetSoftwareVersionLabelResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(versionLabel: value)
    }
}

// MARK: - CustomStringConvertible

extension GetSoftwareVersionLabelResponse: CustomStringConvertible {
    
    public var description: String {
        return versionLabel
    }
}
