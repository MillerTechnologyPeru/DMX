//
//  TransactionNumber.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

/// RDM Transaction Number TN definition
///
/// - See Also: ANSI E1.20 – 2010, page 18
public struct TransactionNumber: RawRepresentable, Equatable, Hashable, Codable {
    
    public var rawValue: UInt8
    
    public init(rawValue: UInt8 = 0) {
        self.rawValue = rawValue
    }
}

public extension TransactionNumber {
    
    mutating func increment() {
        rawValue = rawValue == UInt8.max ? 0 : rawValue + 1
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension TransactionNumber: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}
