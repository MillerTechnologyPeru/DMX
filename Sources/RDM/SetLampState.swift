//
//  SetLampState.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter is used to retrieve or change the current operating state of the lamp.
 
 Lamp States are enumerated by `Table A-8`.
 */
public struct SetLampState: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .lampState }
    
    public let lampState: LampState
    
    // MARK: - Initialization
    
    public init(lampState: LampState) {
        self.lampState = lampState
    }
}

// MARK: - Data

public extension SetLampState {
    
    internal static var length: Int { return MemoryLayout<LampState>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(lampState: LampState(rawValue: data[0]))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetLampState: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<LampState>.size
    }
    
    static func += (data: inout Data, value: SetLampState) {
        data += value.lampState.rawValue
    }
}
