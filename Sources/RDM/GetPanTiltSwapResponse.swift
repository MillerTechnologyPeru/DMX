//
//  GetPanTiltSwapResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/16/20.
//

import Foundation

/**
This parameter is used to retrieve or change the Pan/Tilt Swap setting.
 */
public struct GetPanTiltSwapResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .panTiltSwap }
    
    public let panTiltSwap: Bool
    
    // MARK: - Initialization
    
    public init(panTiltSwap: Bool) {
        self.panTiltSwap = panTiltSwap
    }
}

// MARK: - Data

public extension GetPanTiltSwapResponse {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<UInt8>.size,
              let response = Bool(byteValue: data[0])
            else { return nil }
        self.init(panTiltSwap: response)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetPanTiltSwapResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt8>.size
    }
    
    static func += (data: inout Data, value: GetPanTiltSwapResponse) {
        data += value.panTiltSwap.byteValue
    }
}
