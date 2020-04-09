//
//  GetBootSoftwareVersionLabelResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/9/20.
//

import Foundation

/**
 This parameter is used to get a descriptive ASCII text label for the Boot Version of the software for Devices that support this functionality.
 The descriptive text returned by this parameter is intended for display to the user.
 The label may be up to 32 characters.
 The `BOOT_SOFTWARE_VERSION_ID` parameter should be used for comparing devices from the same Manufacturer with the same Device Model ID to determine if they are running identical boot software versions.
 */
public struct GetBootSoftwareVersionLabelResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .bootSoftwareVersionLabel }
    
    public static var maxLength: Int { return 32 }
    
    public let versionLabel: String
    
    // MARK: - Initialization
    
    public init(versionLabel: String) {
        let maxLength = type(of: self).maxLength
        self.versionLabel = versionLabel.count > maxLength ? String(versionLabel.prefix(type(of: self).maxLength)) : versionLabel
    }
}

// MARK: - Data

public extension GetBootSoftwareVersionLabelResponse {
    
    init?(data: Data) {
        guard data.count <= type(of: self).maxLength,
            let string = String(data: data, encoding: .utf8)
            else { return nil }
        self.init(versionLabel: string)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetBootSoftwareVersionLabelResponse: DataConvertible {
    
    var dataLength: Int {
        return versionLabel.utf8.count
    }
    
    static func += (data: inout Data, value: GetBootSoftwareVersionLabelResponse) {
        let utf8 = value.versionLabel
            .prefix(type(of: value).maxLength)
            .utf8
        data.append(contentsOf: utf8)
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetBootSoftwareVersionLabelResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(versionLabel: value)
    }
}

// MARK: - CustomStringConvertible

extension GetBootSoftwareVersionLabelResponse: CustomStringConvertible {
    
    public var description: String {
        return versionLabel
    }
}
