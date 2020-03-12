//
//  DeviceUID.swift
//  
//
//  Created by Alsey Coleman Miller on 3/11/20.
//

import Foundation

/// RDM Unique Identifier
///
/// Responders and Controllers identify themselves with a 48-bit Unique ID (UID).
/// The Unique ID (UID) consists of a 16-bit ESTA assigned Manufacturer ID with a 32-bit Device ID.
///
/// The 32-bit device ID shall be unique throughout all products manufactured under a specific Manufacturer ID,
/// to ensure that no two devices with the same UID will appear on the data link.
public struct DeviceUID: Equatable, Hashable {
    
    /// ESTA Manufacturer ID
    public typealias ManufacturerCode = UInt16
    
    /// Device ID
    public typealias DeviceCode = UInt32
    
    // MARK: - Properties
    
    /// ESTA Manufacturer ID
    public let manufacturer: ManufacturerCode
    
    /// Device ID
    public let device: DeviceCode
    
    // MARK: - Initialization
    
    /// Initialize with the specifed bytes (in big endian).
    public init(manufacturer: ManufacturerCode, device: DeviceCode) {
        self.manufacturer = manufacturer
        self.device = device
    }
}

// MARK: - Data

public extension DeviceUID {
    
    static var length: Int { return 6 }
    
    init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(
            manufacturer: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))),
            device: UInt32(bigEndian: UInt32(bytes: (data[2], data[3], data[4], data[5])))
        )
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - RawRepresentable

extension DeviceUID: RawRepresentable {
    
    internal static let separator: Character = ":"
    
    /// Initialize a UID from its string representation (e.g. `001A:7DDA7113`).
    public init?(rawValue: String) {
        
        /**
         The recommended method for representing the UID in text is in hexadecimal format with a colon separating the Manufacturer ID and the Device ID.
         An example of such would be: mmmm:dddddddd, where mmmm is the Manufacturer ID in hexadecimal and dddddddd is the Device ID in hexadecimal.
         */
        
        let components = rawValue.split(separator: DeviceUID.separator)
        
        // verify string length
        guard rawValue.count == 13,
            components.count == 2,
            let manufacturerCode = UInt16(components[0], radix: 16),
            let deviceCode = UInt32(components[1], radix: 16)
            else { return nil }
        
        self.init(manufacturer: manufacturerCode, device: deviceCode)
    }
    
    /// Convert a UID to its string representation (e.g. `001A:7DDA7113`).
    public var rawValue: String {
        return manufacturer.toHexadecimal() + String(type(of: self).separator) + device.toHexadecimal()
    }
}

// MARK: - CustomStringConvertible

extension DeviceUID: CustomStringConvertible {
    
    public var description: String { return rawValue }
}

// MARK: Sequence

extension DeviceUID: Sequence {
    
    public func makeIterator() -> IndexingIterator<Self> {
        return IndexingIterator(_elements: self)
    }
}

// MARK: RandomAccessCollection

extension DeviceUID: RandomAccessCollection {
    
    public var count: Int {
        return DeviceUID.length
    }
    
    public subscript (index: Int) -> UInt8 {
        switch index {
        case 0: return manufacturer.bigEndian.bytes.0
        case 1: return manufacturer.bigEndian.bytes.1
        case 2: return device.bigEndian.bytes.0
        case 3: return device.bigEndian.bytes.1
        case 4: return device.bigEndian.bytes.2
        case 5: return device.bigEndian.bytes.3
        default: fatalError("Invalid index \(index)")
        }
    }
    
    /// The start `Index`.
    public var startIndex: Int {
        return 0
    }
    
    /// The end `Index`.
    ///
    /// This is the "one-past-the-end" position, and will always be equal to the `count`.
    public var endIndex: Int {
        return count
    }
    
    public func index(before i: Int) -> Int {
        return i - 1
    }
    
    public func index(after i: Int) -> Int {
        return i + 1
    }
}

// MARK: - Codable

extension DeviceUID: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        guard let value = Self.init(rawValue: rawValue) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid \(Self.self) string \(rawValue)")
        }
        self = value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
