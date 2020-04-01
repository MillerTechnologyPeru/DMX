//
//  RDMMessageDataBlockDelegate.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

import Foundation

/**
  
*/
public protocol RDMMessageDataBlockDelegate {
    
    static var commandClass: CommandClass { get }

    static var parameterID: ParameterID { get }

    static var parameterDataLength: UInt8 { get }
    
    var checksum: UInt16 { get }
    
    var elements: UInt8 { get }
}
