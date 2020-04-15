//
//  DisplayInvertSetting.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 Display Invert Setting
 */
public enum DisplayInvertSetting: UInt8, Equatable, Hashable {
    
    /// Off
    case off    = 0x00
    
    /// On
    case on     = 0x01
    
    /// Auto
    case auto   = 0x02
}
