//
//  GetSupportedParametersResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
 The SUPPORTED PARAMETERS message is used to retrieve a packed list of supported PIDs.
 
 All Sub-Devices of a single Root Device shall report identical parameter lists although all parameters need not be implemented in each sub-device.
 
 A Supported Parameters request sent to Sub-Device `0x0000` (Root) shall return the Parameters supported by the Root-Device.
 A Supported Parameters request sent to any other Sub-Device value` (0x0001-0x0200)` shall have an identical response as any other non-Root value Sub- Device.
 Thus, it is only required to request the Supported Parameters of the Root Device and a single Sub-Device, if Sub-Devices are supported.
 
 Devices with the same Manufacturer ID, Device Model ID, and Software Version ID response for the `DEVICE_INFO` parameter shall report an identical list for the `SUPPORTED_PARAMETERS` message.
 This allows the controller to reduce the quantity of information stored for identical devices.
 
 Manufacturer-Specific PIDs may or may not be included in the response.
 
 PIDs that are included in the minimum support list, indicated by the “Required” column of `ParameterID`, shall not be reported.
 - SeeAlso: `ParameterID.required`
 */
public struct GetSupportedParametersResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .supportedParameters }
    
    public var parameterIDs: [ParameterID]
    
    // MARK: - Initialization
    
    public init(parameterIDs: [ParameterID]) {
        self.parameterIDs = parameterIDs
    }
}

// MARK: - Data

public extension GetSupportedParametersResponse {
    
    init?(data: Data) {
        guard data.count % ParameterID.length == 0
            else { return nil }
        let count = data.count / ParameterID.length
        let parametersIds = (0 ..< count)
            .map{ $0 * ParameterID.length ..< ($0 + 1) * ParameterID.length }
            .compactMap{ ParameterID(data: data.subdataNoCopy(in: $0)) }
        assert(parametersIds.count == count)
        self.init(parameterIDs: parametersIds)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetSupportedParametersResponse: DataConvertible {
    
    var dataLength: Int {
        return parameterIDs.count * ParameterID.length
    }
    
    static func += (data: inout Data, value: GetSupportedParametersResponse) {
        value.parameterIDs.forEach { data += $0 }
    }
}

