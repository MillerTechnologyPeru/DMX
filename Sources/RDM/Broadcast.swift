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
    
    /// Broadcast Device UID's `0xFFFFFFFFFFFF`
    public static var broadcastAllDevicesID: DeviceUID { return DeviceUID(manufacturer: .max, device: .max) }  // BROADCAST_ALL_DEVICES_ID
    
    /// Broadcast Device UID's  `0xmmmmFFFFFFFF`
    /// - Parameter manufacturerId: Specific Manufacturer ID  e.g.`0xMMMM`
    public static func broadcastAllDevicesID(manufacturerId code: DeviceUID.ManufacturerCode) -> DeviceUID {
        return DeviceUID(manufacturer: code, device: .max)  // ALL_DEVICES_ID
    }
}
