//
//  TextDescription.swift
//  
//
//  Created by Jorge Loc Rubio on 4/17/20.
//

import Foundation

/// TextDescription
/// ASCII text label. Up to 32 characters.
public struct TextDescription: RawRepresentable, Equatable, Hashable {
    
    // MARK: - Properties
    
    public var rawValue: String
    
    // MARK: - Initialization
    
    public init(rawValue: String) {
        self.rawValue = rawValue.count > type(of: self).maxLength ? String(rawValue.prefix(type(of: self).maxLength)) : rawValue
    }
}

// MARK: - Data

public extension TextDescription {
    
    internal static var maxLength: Int { return 32 }
    
    init?(data: Data) {
        guard data.count > 0, data.count <= type(of: self).maxLength, let string = String(data: data, encoding: .utf8)
            else { return nil }
        self.rawValue = string
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension TextDescription: DataConvertible {
    
    var dataLength: Int {
        return rawValue.utf8.count
    }
    
    static func += (data: inout Data, value: Self) {
        let utf8 = value.rawValue
            .prefix(type(of: value).maxLength)
            .utf8
        data.append(contentsOf: utf8)
    }
}
