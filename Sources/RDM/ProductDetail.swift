//
//  ProductDetail.swift
//  
//
//  Created by Alsey Coleman Miller on 3/12/20.
//

/// RDM Product Detail definitions
///
/// - See Also: ANSI E1.20 – 2010, page 106
public struct ProductDetail: RawRepresentable, Equatable, Hashable, Codable {
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension ProductDetail: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension ProductDetail: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

// MARK: - Definitions

public extension ProductDetail {
    
    /// Not Declared
    static var notDeclared: ProductDetail { return 0x0000 } // PRODUCT_DETAIL_NOT DECLARED
    
    // MARK: Generally applied to fixtures
    
    /// ARC
    ///
    /// Intended for constant light output.
    static var arc: ProductDetail { return 0x0001 } // PRODUCT_DETAIL_ARC
    
    // TODO: Complete list
}

// MARK: - Names

public extension ProductDetail {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [ProductDetail: String] = [
        .notDeclared: "Not Declared",
        .arc: "ARC"
    ]
}
