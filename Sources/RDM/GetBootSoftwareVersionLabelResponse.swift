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
    
    public let versionLabel: TextDescription
    
    // MARK: - Initialization
    
    public init(versionLabel: TextDescription) {
        self.versionLabel = versionLabel
    }
}

// MARK: - Data

public extension GetBootSoftwareVersionLabelResponse {
    
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

extension GetBootSoftwareVersionLabelResponse: DataConvertible {
    
    var dataLength: Int {
        return versionLabel.dataLength
    }
    
    static func += (data: inout Data, value: GetBootSoftwareVersionLabelResponse) {
        data += value.versionLabel
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetBootSoftwareVersionLabelResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(versionLabel: TextDescription(rawValue: value))
    }
}

// MARK: - CustomStringConvertible

extension GetBootSoftwareVersionLabelResponse: CustomStringConvertible {
    
    public var description: String {
        return versionLabel.rawValue
    }
}
