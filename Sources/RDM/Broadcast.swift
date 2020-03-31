//
//  File 2.swift
//  
//
//  Created by Jorge Loc Rubio on 3/30/20.
//

import Foundation

/**
 RDM  Broadcast Parameters
  
 - SeeAlso: ANSI E1.20 – 2010, page 101, Appendix A: Defined Parameters (Normative)
*/
public struct Broadcast {
    
    /// Broadcast Device UID's
    public static let broadcastAllDevicesID: UInt64 =  0xFFFFFFFFFFFFFFFF // BROADCAST_ALL_DEVICES_ID
    
    /// Broadcast Device UID's
    /// - Parameter manufacturerId: Specific Manufacturer ID  e.g.`0xMMMM`
    public static func broadcastAllDevicesID(manufacturerId id: UInt16) -> UInt64 {
        return UInt64(bigEndian: UInt64(bytes: (id.bytes.1, id.bytes.0, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF))) // ALL_DEVICES_ID
    }
}
