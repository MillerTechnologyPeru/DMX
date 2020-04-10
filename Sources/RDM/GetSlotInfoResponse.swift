//
//  GetSlotInfoResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/10/20.
//

import Foundation

/**
 This parameter is used to retrieve basic information about the functionality of the DMX512 slots used to control the device.
 The response is a packed list of Slot Label ID’s referencing into the Slot Labels table.
 See Appendix C for more information on Slot Type and Slot Label ID’s.
*/
public struct GetSlotInfoResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .slotInfo }
    
    public let slotInfo: [SlotInfo]
    
    // MARK: - Initialization
    
    public init(slotInfo: [SlotInfo]) {
        self.slotInfo = slotInfo
    }
}

// MARK: - Data

public extension GetSlotInfoResponse {
    
    internal static var maxLength: Int { return 230 } // 0xE6
    
    init?(data: Data) {
        guard data.count % SlotInfo.length == 0,
              data.count <= type(of: self).maxLength
            else { return nil }
        let count = data.count / SlotInfo.length
        let slotInfo = (0 ..< count)
            .map { $0 * SlotInfo.length ..< ($0 + 1) * SlotInfo.length }
            .compactMap { SlotInfo(data: data.subdataNoCopy(in: $0)) }
        assert(slotInfo.count == count)
        self.init(slotInfo: slotInfo)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetSlotInfoResponse: DataConvertible {
    
    var dataLength: Int {
        return slotInfo.count * SlotInfo.length
    }
    
    static func += (data: inout Data, value: GetSlotInfoResponse) {
        value.slotInfo.forEach { data += $0 }
    }
}
