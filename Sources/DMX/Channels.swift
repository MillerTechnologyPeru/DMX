//
//  Channels.swift
//  
//
//  Created by Alsey Coleman Miller on 2/23/20.
//

import Foundation

/**
 DMX Channel data contains the lighting slots, up to 512.
 */
public struct Channels {
    
    // MARK: - Properties
    
    internal private(set) var elements: [UInt: Slot]
    
    // MARK: - Initialization
    
    public init() {
        self.elements = [:]
    }
    
    public init(count: Int) {
        precondition(count <= Channels.maxLength)
        assert(count >= 0)
        self.init()
        self.count = count
    }
    
    internal init<C>(truncated collection: C) where C: Collection, C.Element == Slot {
        let length = Swift.min(collection.count, Channels.maxLength)
        self.elements = .init(minimumCapacity: length)
        collection
            .prefix(length)
            .enumerated()
            .forEach { self[$0.offset] = $0.element }
    }
    
    public init?<C>(_ collection: C) where C: Collection, C.Element == Slot {
        guard collection.count <= Channels.maxLength else { return nil }
        self.init(truncated: collection)
    }
}

public extension Channels {
    
    /// Maximum number of
    static var maxLength: Int { return 512 }
}

// MARK: - Data

public extension Channels {
    
    init?(data: Data) {
        guard data.count <= Channels.maxLength else { return nil }
        self.init(truncated: data.lazy.map { .init(rawValue: $0) })
    }
    
    var data: Data {
        return Data(self.lazy.map { $0.rawValue })
    }
}

// MARK: - Equatable

extension Channels: Equatable {
    
    public static func == (lhs: Channels, rhs: Channels) -> Bool {
        // enumerate all elements
        guard lhs.count == rhs.count else { return false }
        for (index, element) in lhs.enumerated() {
            guard rhs[index] == element else { return false }
        }
        return true
    }
}

// MARK: - Hashable

extension Channels: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        forEach { $0.hash(into: &hasher) }
    }
}

// MARK: - CustomStringConvertible

extension Channels: CustomStringConvertible {
    
    public var description: String {
        return "[" + reduce("", { $0 + ($0.isEmpty ? "" : ", ") + $1.description }) + "]"
    }
}

// MARK: - ExpressibleByArrayLiteral

extension Channels: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Slot...) {
        assert(elements.count <= Channels.maxLength)
        self.init(truncated: elements)
    }
}

// MARK: - ExpressibleByDictionaryLiteral

extension Channels: ExpressibleByDictionaryLiteral {
    
    public init(dictionaryLiteral elements: (UInt, Slot)...) {
        self.init()
        elements
            .lazy
            .filter { Int($0.0) < Channels.maxLength }
            .forEach { self[Int($0.0)] = $0.1 }
    }
}

// MARK: - Collection

extension Channels: MutableCollection, RandomAccessCollection {
    
    public subscript (index: Int) -> Slot {
        get {
            assert(index < Channels.maxLength, "Invalid index \(index)")
            assert(index >= 0, "Invalid index \(index)")
            assert(index < count, "Invalid index \(index)")
            return elements[UInt(index)] ?? 0x00
        }
        set {
            assert(index < Channels.maxLength, "Invalid index \(index)")
            assert(index >= 0, "Invalid index \(index)")
            elements[UInt(index)] = newValue
            assert(count > index)
        }
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        get { return Swift.min(Int(elements.lastKey.flatMap { $0 + 1 } ?? 0), Channels.maxLength) }
        set {
            precondition(newValue <= Channels.maxLength, "Invalid number of slots \(newValue)")
            precondition(newValue >= 0, "Invalid number of slots \(newValue)")
            
            guard newValue > 0 else {
                self.elements.removeAll(keepingCapacity: true)
                assert(count == 0)
                assert(isEmpty)
                return
            }
            
            let newLength = Swift.min(newValue, Channels.maxLength)
            let newIndex = UInt(Swift.max(0, newLength - 1))
            
            // remove all larger keys
            let oldKeys = elements
                .keys
                .filter { $0 >= newLength }
            oldKeys.forEach { elements.removeValue(forKey: $0) }
            
            // set key if none exists
            if elements[newIndex] == nil {
                elements[newIndex] = 0
            }
                            
            // validate
            assert(isEmpty == false)
            assert(count == newLength)
        }
    }
    
    public var startIndex: Int {
        return 0
    }
    
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

extension Channels: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let data = try container.decode(Data.self)
        guard let value = Channels(data: data) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "DMX512 channel data cannot larger than \(Channels.maxLength) bytes"))
        }
        self = value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(data)
    }
}

// MARK: - Supporting Types

public extension Channels {
    
    /// DMX Channel Slot
    struct Slot: RawRepresentable, Equatable, Hashable, Codable {
        
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
}

public extension Channels.Slot {
    
    static var zero: Channels.Slot { return Channels.Slot(rawValue: 0) }
}

// MARK: CustomStringConvertible

extension Channels.Slot: CustomStringConvertible {
    
    public var description: String {
        let percentage = (Float(rawValue) / Float(UInt8.max)) * 100
        return String(format: "%.1f", percentage).replacingOccurrences(of: ".0", with: "") + "%"
    }
}

// MARK: ExpressibleByIntegerLiteral

extension Channels.Slot: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

// MARK: - ExpressibleByFloatLiteral

extension Channels.Slot: ExpressibleByFloatLiteral {
    
    public init(floatLiteral value: Float) {
        precondition(value <= 1.0)
        precondition(value >= 0.0)
        self.init(rawValue: UInt8(value * 255.0))
    }
}
