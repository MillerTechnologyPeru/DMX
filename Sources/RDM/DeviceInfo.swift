//
//  DeviceInfo.swift
//  
//
//  Created by Jorge Loc Rubio on 4/7/20.
//

import Foundation

/**
  Device Info
 
  This parameter is used to retrieve a variety of information about the device that is normally required by a controller.
*/
public struct DeviceInfo: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Protocol Version
    public var protocolVersion: ProtocolVersion
    
    /// Device Model ID
    /// This field identifies the Device Model ID of the Root Device or the Sub-Device.
    /// The Manufacturer shall not use the same ID to represent more than one unique model type.
    /// A text description for the Device Model ID can be retrieved from the device using the `DEVICE_MODEL_DESCRIPTION` Parameter.
    public var deviceModelID: UInt16
    
    /// Product Category
    /// Devices shall report a Product Category based on the product’s primary function.
    /// Product Categories are encoded as 16-bit values as defined in `ProductCategory`
    /// - SeeAlso: `ProductCategory`
    public var productCategory: ProductCategory
    
    /// Software Version ID
    /// This field indicates the Software Version ID for the device.
    /// The Software Version ID is a 32-bit value determined by the Manufacturer.
    ///
    /// The 32-bit Software Version ID may use any encoding scheme such that the Controller may identify devices containing the same software versions.
    /// Any devices from the same manufacturer with differing software shall not report back the same Software Version ID.
    ///
    /// A meaningful description of the software version for display to the user may be obtained by using the `SOFTWARE_VERSION_LABEL` Parameter in Section 10.5.9.
    public var softwareVersionID: UInt32
    
    /// DMX512 Footprint
    /// This field specifies the DMX512 footprint (number of consecutive DMX512 slots required).
    /// This information can be used in conjunction with `DMX_START_ADDRESS` for auto-patching capabilities.
    ///
    /// If the `DEVICE_INFO` message is directed to a Sub-Device, then the response for this field contains the DMX512 Footprint for that Sub-Device.
    /// If the message is sent to the Root Device, it is the Footprint for the Root Device itself.
    /// If the Device or Sub-Device does not utilize Null Start Code packets for any control or functionality then it shall report a Footprint of `0x0000`.
    /// The range for this field is from 0 – 512.
    public var dmx512Footprint: DMX512Footprint
    
    /// DMX512 Personality
    /// The DMX512 Personality fields are detailed in Section10.6.1.
    public var dmx512Personality: DMX512Personality
    
    /// DMX512 Start Address
    /// The DMX512 Start Address field is detailed in Section 10.6.3.
    /// If the Device or Sub-Device that this message is directed to has a DMX512 Footprint of `0`, then this field shall be set to `0xFFFF`.
    public var dmx512StartAddress: UInt16
    
    /// Sub-Device Count
    /// This parameter is used to retrieve the number of Sub-Devices represented by the Root Device as described in Section 9.
    /// The response for this field shall always be same regardless of whether this message is directed to the Root Device or a Sub-Device.
    public var subDeviceCount: UInt16
    
    /// Sensor Count
    /// This field indicates the number of available sensors in a Root Device or Sub-Device.
    /// When this parameter is directed to a Sub-Device, the reply shall be identical for any Sub-Device owned by a specific Root Device.
    ///
    /// When a device or sub-device is fitted with a single sensor, it would return a value of `0x01` for the Sensor Count.
    /// This sensor would then be addressed as Sensor Number `0x00` when using the other sensor-related parameter messages.
    public var sensorCount: UInt8
    
    // MARK: - Initialization
    
    public init(protocolVersion: ProtocolVersion,
                deviceModelID: UInt16,
                productCategory: ProductCategory,
                softwareVersionID: UInt32,
                dmx512Footprint: DMX512Footprint,
                dmx512Personality: DMX512Personality,
                dmx512StartAddress: UInt16,
                subDeviceCount: UInt16,
                sensorCount: UInt8) {
    
        self.protocolVersion = protocolVersion
        self.deviceModelID = deviceModelID
        self.productCategory = productCategory
        self.softwareVersionID = softwareVersionID
        assert(DMX512Footprint.range.contains(dmx512Footprint))
        self.dmx512Footprint = dmx512Footprint
        self.dmx512Personality = dmx512Personality
        self.dmx512StartAddress = dmx512Footprint == DMX512Footprint.nullStartCode ? UInt16.max : dmx512StartAddress
        self.subDeviceCount = subDeviceCount
        self.sensorCount = sensorCount
    }
}

// MARK: - Data

public extension DeviceInfo {
    
    internal static var length: Int { return 19 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.protocolVersion = ProtocolVersion(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))))
        self.deviceModelID = UInt16(bigEndian: UInt16(bytes: (data[2], data[3])))
        self.productCategory = ProductCategory(rawValue: UInt16(bigEndian: UInt16(bytes: (data[4], data[5]))))
        self.softwareVersionID = UInt32(bigEndian: UInt32(bytes: (data[6], data[7], data[8], data[9])))
        self.dmx512Footprint = DMX512Footprint(rawValue: UInt16(bigEndian: UInt16(bytes: (data[10], data[11]))))
        self.dmx512Personality = DMX512Personality(rawValue: UInt16(bigEndian: UInt16(bytes: (data[12], data[13]))))
        self.dmx512StartAddress = UInt16(bigEndian: UInt16(bytes: (data[14], data[15])))
        self.subDeviceCount = UInt16(bigEndian: UInt16(bytes: (data[16], data[17])))
        self.sensorCount = data[18]
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension DeviceInfo: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.protocolVersion.rawValue.bigEndian
        data += value.deviceModelID.bigEndian
        data += value.productCategory.rawValue.bigEndian
        data += value.dmx512Footprint.rawValue.bigEndian
        data += value.dmx512Personality.rawValue.bigEndian
        data += value.dmx512StartAddress.bigEndian
        data += value.subDeviceCount.bigEndian
        data += value.sensorCount
    }
}

