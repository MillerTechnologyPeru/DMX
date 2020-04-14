//
//  GetSlotDescriptionResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/14/20.
//

import Foundation

/**
 This parameter is used for requesting an ASCII text description for DMX512 slot offsets.
 
 If the country code of the device is set to the English language, then the text returned should be similar to the description as defined in `Table C-2.`
 
 If the responder does not support the Slot number requested, or cannot provide a text description for a slot number that it does support, the responder shall respond with `NR_DATA_OUT_OF_RANGE`.
 
 - SeeAlso: SlotID
 - SeeAlso: ResponseError
*/
public struct GetSlotDescriptionResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .slotDescription }
    
    public let slotDescription: SlotDescription
    
    // MARK: - Initialization
    
    public init(slotDescription: SlotDescription) {
        self.slotDescription = slotDescription
    }
}

// MARK: - Data

public extension GetSlotDescriptionResponse {
    
    init?(data: Data) {
        guard data.count <= SlotDescription.maxLength,
              let slotDescription = SlotDescription(data: data)
            else { return nil }
        self.init(slotDescription: slotDescription)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetSlotDescriptionResponse: DataConvertible {
    
    var dataLength: Int {
        return slotDescription.dataLength
    }
    
    static func += (data: inout Data, value: GetSlotDescriptionResponse) {
        data += value.slotDescription
    }
}
