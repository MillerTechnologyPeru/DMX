//
//  ParameterDescriptionCommandClass.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
Parameter Description Command Class
- SeeAlso: ANSI E1.20 – 2010, page 115, Table A-16: Parameter Description CommandClass Defines
*/
public enum ParameterDescriptionCommandClass: UInt8 {
    
    /// Get
    ///
    /// PID supports GET only
    case get       = 0x01 // CC_GET
    
    /// Set
    ///
    /// PID supports SET only
    case set       = 0x02 // CC_SET
    
    /// Get / Set
    ///
    /// PID supports GET & SET
    case getSet    = 0x03 // CC_GET_SET
}
