//
//  ResponseType.swift
//  
//
//  Created by Alsey Coleman Miller on 3/12/20.
//

/// RDM Response Type definitions
///
/// - SeeAlso: ANSI E1.20 – 2010, page 101, Table A-1: Command Class Defines
public enum ResponseType: UInt8, Codable {
    
    /// Acknowledgement
    case acknowledgement            = 0x00 // RESPONSE_TYPE_ACK
    
    /// Acknowledgement Timer
    case acknowledgementTimer       = 0x01 // RESPONSE_TYPE_ACK_TIMER
    
    /// No Acknowledgement Reason
    ///
    /// - SeeAlso: ResponseError
    case noAcknowledgementReason    = 0x02 // RESPONSE_TYPE_NACK_REASON
    
    /// Acknowledgement Overflow
    ///
    /// - Note: Additional Response Data available beyond single response length.
    case acknowledgementOverflow    = 0x03 // RESPONSE_TYPE_ACK_OVERFLOW
}
