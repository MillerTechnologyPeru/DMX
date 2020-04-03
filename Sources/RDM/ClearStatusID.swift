//
//  ClearStatusID.swift
//  
//
//  Created by Jorge Loc Rubio on 4/3/20.
//

import Foundation

/**
 This parameter is used to clear the status message queue.
 */
public struct ClearStatusID: Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .clearStatusId }
}
