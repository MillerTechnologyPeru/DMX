//
//  DefinedParameters.swift
//  
//
//  Created by Jorge Loc Rubio on 3/27/20.
//

/**
  RDM  Defined Parameters
   
  - SeeAlso: ANSI E1.20 – 2010, page 101, Appendix A: Defined Parameters (Normative)
 */
public struct DefinedParameters {
    
    /// RDM start Code (Slot 0)
    public static let startCode: UInt8 = 0xCC // SC_RDM
    
    /// RDM Protocol Data Structure ID's (Slot 1)
    public static let subMessage: UInt8 = 0x01 // SC_SUB_MESSAGE
}
