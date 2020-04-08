//
//  GetManufacturerLabelResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/8/20.
//

import Foundation

/**
 This parameter provides an ASCII text response with the Manufacturer name for the device of up to 32 characters.
 The Manufacturer name must be consistent between all products manufactured within an ESTA Manufacturer ID.
 */
public struct GetManufacturerLabelResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .manufacturerLabel }
    
    public static var maxLength: Int { return 32 }
    
    public let manufacturerName: String
    
    // MARK: - Initialization
    
    public init(manufacturerName: String) {
        let maxLength = type(of: self).maxLength
        self.manufacturerName = manufacturerName.count > maxLength ? String(manufacturerName.prefix(type(of: self).maxLength)) : manufacturerName
    }
}

// MARK: - Data

public extension GetManufacturerLabelResponse {
    
    init?(data: Data) {
        guard data.count <= type(of: self).maxLength,
            let name = String(data: data, encoding: .utf8)
            else { return nil }
        self.init(manufacturerName: name)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetManufacturerLabelResponse: DataConvertible {
    
    var dataLength: Int {
        return manufacturerName.utf8.count
    }
    
    static func += (data: inout Data, value: GetManufacturerLabelResponse) {
        let utf8 = value.manufacturerName
            .prefix(type(of: value).maxLength)
            .utf8
        data.append(contentsOf: utf8)
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetManufacturerLabelResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(manufacturerName: value)
    }
}

// MARK: - CustomStringConvertible

extension GetManufacturerLabelResponse: CustomStringConvertible {
    
    public var description: String {
        return manufacturerName
    }
}
