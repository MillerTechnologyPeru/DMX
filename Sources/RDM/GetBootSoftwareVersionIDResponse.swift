//
//  GetBootSoftwareVersionIDResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/9/20.
//

import Foundation

/**
 This parameter is used to retrieve the unique Boot Software Version ID for the device.
 The Boot Software Version ID is a 32-bit value determined by the Manufacturer.
 
 The 32-bit Boot Software Version ID may use any encoding scheme such that the Controller may identify devices containing the same boot software versions.
 Any devices from the same manufacturer with differing boot software shall not report back the same Boot Software Version ID.
 
 A meaningful description of the boot software version for display to the user may be obtained by using the `BOOT_SOFTWARE_VERSION_LABEL`.
*/
public struct GetBootSoftwareVersionIDResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .bootSoftwareVersionId }
    
    public let versionID: UInt32
    
    // MARK: - Initialization
    
    public init(versionID: UInt32) {
        self.versionID = versionID
    }
}

// MARK: - Data

public extension GetBootSoftwareVersionIDResponse {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<UInt32>.size
            else { return nil }
        self.init(versionID: UInt32(bigEndian: UInt32(bytes: (data[0], data[1], data[2], data[3]))))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetBootSoftwareVersionIDResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt32>.size
    }
    
    static func += (data: inout Data, value: GetBootSoftwareVersionIDResponse) {
        data += value.versionID.bigEndian
    }
}
