//
//  SetLampOnMode.swift
//  
//
//  Created by Jorge Loc Rubio on 4/15/20.
//

import Foundation

/**
 This parameter is used to retrieve or change the current Lamp On Mode. Lamp On Mode defines the conditions under which a lamp will be struck.
 
 Lamp On Modes are enumerated by `Table A-9.`
 */
public struct SetLampOnMode: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .lampOnMode }
    
    public let lampMode: LampMode
    
    // MARK: - Initialization
    
    public init(lampMode: LampMode) {
        self.lampMode = lampMode
    }
}

// MARK: - Data

public extension SetLampOnMode {
    
    internal static var length: Int { return MemoryLayout<LampState>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(lampMode: LampMode(rawValue: data[0]))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetLampOnMode: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<LampMode>.size
    }
    
    static func += (data: inout Data, value: SetLampOnMode) {
        data += value.lampMode.rawValue
    }
}
