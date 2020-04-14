//
//  GetDefaultSlotValueResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/14/20.
//


import Foundation

/**
 This parameter shall be used for requesting the default values for the given DMX512 slot offsets for a device.
 The response is a packed message containing both the slot offset and its default value.
  
 Responding devices may contain various sensors.
 The controller retrieves sensor data using this command subset.
 
 All parameter messages within this section can be used with Sub-Devices.
 The Root Device may contain a maximum of 255 sensors.
 Sub-Devices may contain a maximum of 255 sensors.
 However, all Sub-Devices that are owned by a specific Root Device shall respond with an identical number of sensors.
 
 Sensor messages may be addressed to Root Devices or Sub-Devices.
 Valid sensor numbers are in the range from `0x00 – 0xFE`.
 The sensor number `0xFF` is used to address all sensors.
 
 The number of sensors present in a device can be retrieved using the `DEVICE_INFO` Parameter.
 
 The number of sensors fitted to a responding device is obtained as part of the `GET:DEVICE_INFO` response.
 */
public struct GetDefaultSlotValueResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .defaultSlotValue }
    
    public let slotOffsets: [SlotOffset]
    
    // MARK: - Initialization
    
    public init(slotOffsets: [SlotOffset]) {
        self.slotOffsets = slotOffsets
    }
}

// MARK: - Data

public extension GetDefaultSlotValueResponse {
    
    internal static var maxLength: Int { return 231 } // E7
    
    init?(data: Data) {
        guard data.count % SlotOffset.length == 0,
              data.count <= type(of: self).maxLength
            else { return nil }
        let count = data.count / SlotOffset.length
        let slotOffsets = (0 ..< count)
            .map { $0 * SlotOffset.length ..< ($0 + 1) * SlotOffset.length }
            .compactMap { SlotOffset(data: data.subdataNoCopy(in: $0)) }
        assert(slotOffsets.count == count)
        self.init(slotOffsets: slotOffsets)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetDefaultSlotValueResponse: DataConvertible {
    
    var dataLength: Int {
        return slotOffsets.count * SlotOffset.length
    }
    
    static func += (data: inout Data, value: GetDefaultSlotValueResponse) {
        value.slotOffsets.forEach { data += $0 }
    }
}
