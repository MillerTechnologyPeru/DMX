//
//  CommandClass.swift
//  
//
//  Created by Alsey Coleman Miller on 3/12/20.
//

/// RDM Command Classes
///
/// - SeeAlso: ANSI E1.20 – 2010, page 101, Table A-1: Command Class Defines
public enum CommandClass: UInt8, Codable {
    
    /// Discovery command
    case discovery              = 0x10
    
    /// Discovery Response command
    case discoveryResponse      = 0x11
    
    /// Get command
    case get                    = 0x20
    
    /// Get Response command
    case getResponse            = 0x21
    
    /// Set command
    case set                    = 0x30
    
    /// Set Response comand
    case setResponse            = 0x31
}

public extension CommandClass {
    
    /// Whether a response is expected.
    var isResponseExpected: Bool {
        switch self {
        case .discovery, .get, .set:
            return true
        case .discoveryResponse, .getResponse, .setResponse:
            return false
        }
    }
}
