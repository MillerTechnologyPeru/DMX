//
//  Checksum.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

import Foundation

/// RDM Packet Checksum
public struct Checksum: RawRepresentable, Equatable, Hashable {
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

public extension Checksum {
    
    init(data: Data) {
        
        let checksum = data.reduce(UInt16(0xCC), { $0.addingReportingOverflow(UInt16($1)).partialValue })
        self.init(rawValue: checksum)
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension Checksum: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - CustomStringConvertible

extension Checksum: CustomStringConvertible {
    
    public var description: String {
        return "0x" + rawValue.toHexadecimal()
    }
}

