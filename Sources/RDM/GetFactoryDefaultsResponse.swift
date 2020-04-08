//
//  GetFactoryDefaultsResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/8/20.
//

import Foundation

/**
This parameter is used to instruct a device to revert to its Factory Default user settings or configuration as determined by the Manufacturer.
 */
public struct GetFactoryDefaultsResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .factoryDefaults }
    
    public let response: Bool
    
    // MARK: - Initialization
    
    public init(response: Bool) {
        self.response = response
    }
}


// MARK: - Data

public extension GetFactoryDefaultsResponse {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<UInt8>.size,
              let response = Bool(byteValue: data[0])
            else { return nil }
        self.init(response: response)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetFactoryDefaultsResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt8>.size
    }
    
    static func += (data: inout Data, value: GetFactoryDefaultsResponse) {
        data += value.response.byteValue
    }
}
