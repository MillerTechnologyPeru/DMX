//
//  ProtocolVersion.swift
//  
//
//  Created by Alsey Coleman Miller on 3/12/20.
//

/// RDM Protocol Version
///
/// This field contains the version number of the published RDM Standard supported by the device.
/// The value for these version fields are controlled by this standard and any subsequent revisions or additions to this standard as issued in the future.
///
/// - SeeAlso: ANSI E1.20 – 2010, Page 57
public struct ProtocolVersion: Equatable, Hashable {
    
    /// Major version
    public var major: UInt8
    
    /// Minor version
    public var minor: UInt8
    
    /// Initialize with major and minor versions
    init(major: UInt8, minor: UInt8) {
        self.major = major
        self.minor = minor
    }
}

// MARK: - Versions

public extension ProtocolVersion {
    
    static var v1_0: ProtocolVersion { return .init(major: 1, minor: 0) }
}

// MARK: - RawRepresentable

extension ProtocolVersion: RawRepresentable {
    
    public init(rawValue: UInt16) {
        let bytes = rawValue.bigEndian.bytes
        self.init(major: bytes.0, minor: bytes.1)
    }
    
    public var rawValue: UInt16 {
        return UInt16(bigEndian: UInt16(bytes: (major, minor)))
    }
}

// MARK: - CustomStringConvertible

extension ProtocolVersion: CustomStringConvertible {
    
    public var description: String {
        return "v\(major).\(minor)"
    }
}
