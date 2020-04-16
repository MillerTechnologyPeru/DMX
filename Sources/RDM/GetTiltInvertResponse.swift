//
//  GetTiltInvertResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/16/20.
//

import Foundation

/**
This parameter is used to retrieve or change the Tilt Invert setting.
 */
public struct GetTiltInvertResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .tiltInvert }
    
    public let tiltInvert: Bool
    
    // MARK: - Initialization
    
    public init(tiltInvert: Bool) {
        self.tiltInvert = tiltInvert
    }
}

// MARK: - Data

public extension GetTiltInvertResponse {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<UInt8>.size,
              let response = Bool(byteValue: data[0])
            else { return nil }
        self.init(tiltInvert: response)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetTiltInvertResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt8>.size
    }
    
    static func += (data: inout Data, value: GetTiltInvertResponse) {
        data += value.tiltInvert.byteValue
    }
}
