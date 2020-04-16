//
//  SetPanInvert.swift
//  
//
//  Created by Jorge Loc Rubio on 4/16/20.
//

import Foundation

/**
This parameter is used to retrieve or change the Pan Invert setting.
 */
public struct SetPanInvert: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .panInvert }
    
    public let panInvert: Bool
    
    // MARK: - Initialization
    
    public init(panInvert: Bool) {
        self.panInvert = panInvert
    }
}

// MARK: - Data

public extension SetPanInvert {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<UInt8>.size,
              let response = Bool(byteValue: data[0])
            else { return nil }
        self.init(panInvert: response)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetPanInvert: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt8>.size
    }
    
    static func += (data: inout Data, value: SetPanInvert) {
        data += value.panInvert.byteValue
    }
}
