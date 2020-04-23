//
//  CommsStatus.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

import Foundation

/**
  Comms Status
 
  - SeeAlso: ANSI E1.20 – 2010, page 44
*/
public struct CommsStatus: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Shot Message
    ///
    /// This field shall be incremented any time the message terminates (either due to a BREAK or timeout condition occurring) before a complete Destination UID has been received.
    public var shortMessage: UInt16
    
    /// Length Mismatch
    ///
    /// The number of slots received before a BREAK or message timeout condition occurring did not match the Message Length plus the size of the Checksum.
    /// This counter shall only be incremented if the Destination UID in the packet matches the Device’s UID.
    /// Messages sent to an applicable Broadcast address shall also increment this counter.
    public var lengthMismatch: UInt16
    
    /// Checksum Fail
    ///
    /// The message checksum failed.
    /// This counter shall only be incremented if the Destination UID in the packet matches the Device’s UID.
    /// Messages sent to an applicable Broadcast address shall also increment this counter.
    /// - SeeAlso: Checksum
    public var checksumFail: UInt16
    
    // MARK: - Initialization
    
    public init(shortMessage: UInt16,
                lengthMismatch: UInt16,
                checksumFail: UInt16) {
        
        self.shortMessage = shortMessage
        self.lengthMismatch = lengthMismatch
        self.checksumFail = checksumFail
    }
}

// MARK: - Data

extension CommsStatus {

    internal static var length: Int { return 6 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.shortMessage = UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))
        self.lengthMismatch = UInt16(bigEndian: UInt16(bytes: (data[2], data[3])))
        self.checksumFail = UInt16(bigEndian: UInt16(bytes: (data[4], data[5])))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension CommsStatus: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.shortMessage.bigEndian
        data += value.lengthMismatch.bigEndian
        data += value.checksumFail.bigEndian
    }
}
