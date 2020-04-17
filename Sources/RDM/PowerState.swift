//
//  PowerState.swift
//  
//
//  Created by Jorge Loc Rubio on 4/17/20.
//

import Foundation

/**
 Power State
 
 - SeeAlso: ANSI E1.20 – 2010, page 111, Table A-11: Power State Defines
 */
public enum PowerState: UInt8 {
    
    /// Full Off
    ///
    /// Completely disengages power to device.
    /// Device can no longer respond.
    case fullOff                    = 0x00 // POWER_STATE_FULL_OFF
    
    /// Shutdown
    ///
    /// Reduced power mode, may require device reset to return to normal operation.
    /// Device still responds to messages.
    case shutdown                   = 0x01 // POWER_STATE_SHUTDOWN
    
    /// Standby
    ///
    /// Reduced power mode. Device can return to NORMAL without a reset.
    /// Device still responds to messages.
    case standby                    = 0x02 // POWER_STATE_STANDBY
    
    /// Normal
    ///
    /// Normal Operating Mode.
    case normal                     = 0xFF // POWER_STATE_NORMAL
}
