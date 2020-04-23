//
//  ProxiedDeviceCount.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

import Foundation

/**
 Proxied Device Count
 
 - SeeAlso: ANSI E1.20 – 2010, Page 40
 */
public struct ProxiedDeviceCount: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Device count
    public var count: UInt16
    
    /// List change
    public var listChanged: Bool
    
    // MARK: - Initialization
    
    public init(count: UInt16,
                listChanged: Bool) {
        
        self.count = count
        self.listChanged = listChanged
    }
}

// MARK: - Data

public extension ProxiedDeviceCount {
    
    internal static var length: Int { return 3 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length, let listChanged = Bool(byteValue: data[2])
            else { return nil }
        self.count = UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))
        self.listChanged = listChanged
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ProxiedDeviceCount: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: ProxiedDeviceCount) {
        data += value.count.bigEndian
        data += value.listChanged.byteValue
    }
}
