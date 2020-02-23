//
//  StartCode.swift
//  
//
//  Created by Alsey Coleman Miller on 2/23/20.
//

/// DMX start code
public enum StartCode: UInt8 {
    
    case dmx    = 0x00
    case text   = 0x17
    case test   = 0x55
    case rdm    = 0xCC
    case sip    = 0xCF
}
