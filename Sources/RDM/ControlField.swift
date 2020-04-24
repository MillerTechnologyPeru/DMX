//
//  ControlField.swift
//  
//
//  Created by Jorge Loc Rubio on 4/24/20.
//

import Foundation

/**
 Control Field
 
 - SeeAlso: ANSI E1.20 – 2010, page 33, Table 7-3: Control Field
 */
public enum ControlField: UInt16, Codable, CaseIterable, BitMaskOption {
    
    /// Managed Proxy Flag
    ///
    /// The Managed Proxy Flag (Bit 0) shall be set to 1 when the responder is a Proxy device.
    /// See Section 8 for information on Proxy Devices.
    case proxy                  = 0b0000000000000001
    
    /// Sub Device Flag
    ///
    /// The Sub-Device Flag (Bit 1) shall be set to 1 when the responder supports Sub-Devices.
    /// See Section 9 for information on Sub-Devices.
    case subDevice              = 0b0000000000000010
    
    /// The Boot-Loader Flag
    ///
    /// The Boot-Loader Flag (Bit 2) shall only be set to 1 when the device is incapable of normal operation until receiving a firmware upload.
    /// It is expected that when in this Boot-Loader mode the device will be capable of very limited RDM communication.
    /// The process of uploading firmware is beyond the scope of this document.
    case bootLoader             = 0b0000000000000100
    
    /// Proxied Device Flag
    ///
    /// he Proxied Device Flag (Bit 3) shall only be set to 1 when a Proxy is responding to Discovery on behalf of another device.
    /// This flag indicates that the response has come from a Proxy, rather than the actual device.
    case proxiedDevice          = 0b0000000000001000
    
    /// The Reserved bits (Bits 4-15) are reserved for future implementation and shall be set to 0.
}
