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
    
    public let manufacturerName: TextDescription
    
    // MARK: - Initialization
    
    public init(manufacturerName: TextDescription) {
        self.manufacturerName = manufacturerName
    }
}

// MARK: - Data

public extension GetManufacturerLabelResponse {
    
    init?(data: Data) {
        guard data.count <= TextDescription.maxLength
            else { return nil }
        self.init(manufacturerName: TextDescription(data: data) ?? "")
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetManufacturerLabelResponse: DataConvertible {
    
    var dataLength: Int {
        return manufacturerName.dataLength
    }
    
    static func += (data: inout Data, value: GetManufacturerLabelResponse) {
        data += value.manufacturerName
    }
}


// MARK: - ExpressibleByStringLiteral

extension GetManufacturerLabelResponse: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(manufacturerName: TextDescription(rawValue: value))
    }
}

// MARK: - CustomStringConvertible

extension GetManufacturerLabelResponse: CustomStringConvertible {
    
    public var description: String {
        return manufacturerName.rawValue
    }
}
