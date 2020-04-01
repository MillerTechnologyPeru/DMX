//
//  Message.swift
//  
//
//  Created by Jorge Loc Rubio on 3/30/20.
//

import Foundation

/**
  
*/
public protocol MessageDelegate {
    
    // MARK: - Properties
    
    var startCode: UInt8 { get }
    
    var subStartCode: UInt8 { get }
    
    var length: UInt8 { get set }
    
    var destinationUID: DeviceUID { get set }
    
    var sourceUID: DeviceUID { get set }
    
    var transactionNumber: TransactionNumber { get set }
    
    var typeField: UInt8 { get set }
    
    var messageCount: UInt8 { get set }
    
    var subDevice: SubDevice { get set }
    
    var checkSum: UInt16 { get set }
}
