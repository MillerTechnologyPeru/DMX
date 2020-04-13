//
//  RDMMessageTest.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

import Foundation
import XCTest
@testable import RDM

final class RDMMessageTest: XCTestCase {
    
    static let allTests = [
        ("testDataCheckSum", testDataCheckSum),
        ("testQueueMessage", testQueueMessage),
        ("testGetStatusMessages", testGetStatusMessages),
        ("testGetStatusMessagesResponse", testGetStatusMessagesResponse),
        ("testGetStatusIDDescription",testGetStatusIDDescription),
        ("testGetStatusIDDescriptionResponse",testGetStatusIDDescriptionResponse),
        ("testClearStatusID",testClearStatusID),
        ("testClearStatusIDResponse",testClearStatusIDResponse),
        ("testGetSubDeviceStatusReportingThreshold",testGetSubDeviceStatusReportingThreshold),
        ("testGetSubDeviceStatusReportingThresholdResponse",testGetSubDeviceStatusReportingThreshold),
        ("testSetSubDeviceStatusReportingThreshold",testSetSubDeviceStatusReportingThreshold),
        ("testSetSubDeviceStatusReportingThresholdResponse",testSetSubDeviceStatusReportingThreshold),
        ("testGetSupportedParameters", testGetSupportedParameters),
        ("testGetSupportedParametersResponse", testGetSupportedParametersResponse),
        ("testGetParameterDescription", testGetParameterDescription),
        ("testGetParameterDescriptionResponse", testGetParameterDescriptionResponse),
        ("testGetDeviceInfo", testGetDeviceInfo),
        ("testGetDeviceInfoResponse", testGetDeviceInfoResponse),
        ("testGetProductDetailIDList", testGetProductDetailIDList),
        ("testGetProductDetailIDListResponse", testGetProductDetailIDListResponse),
        ("testGetDeviceModelDescription", testGetDeviceModelDescription),
        ("testGetDeviceModelDescriptionResponse", testGetDeviceModelDescriptionResponse),
        ("testGetManufacturerLabel", testGetManufacturerLabel),
        ("testGetManufacturerLabelResponse", testGetManufacturerLabelResponse),
        ("testGetDeviceLabel", testGetDeviceLabel),
        ("testGetDeviceLabelResponse", testGetDeviceLabelResponse),
        ("testSetDeviceLabel", testSetDeviceLabel),
        ("testSetDeviceLabelResponse", testSetDeviceLabelResponse),
        ("testGetFactoryDefaults", testGetFactoryDefaults),
        ("testGetFactoryDefaultsResponse", testGetFactoryDefaultsResponse),
        ("testSetFactoryDefaults", testSetFactoryDefaults),
        ("testSetFactoryDefaultsResponse", testSetFactoryDefaultsResponse),
        ("testGetLanguageCapabilities", testGetLanguageCapabilities),
        ("testGetLanguageCapabilitiesResponse", testGetLanguageCapabilitiesResponse),
        ("testGetLanguage", testGetLanguage),
        ("testGetLanguageResponse", testGetLanguageResponse),
        ("testSetLanguage", testSetLanguage),
        ("testSetLanguageResponse", testSetLanguageResponse),
        ("testGetSoftwareVersionLabel", testGetSoftwareVersionLabel),
        ("testGetSoftwareVersionLabelResponse", testGetSoftwareVersionLabelResponse),
        ("testGetBootSoftwareVersionID", testGetBootSoftwareVersionID),
        ("testGetBootSoftwareVersionIDResponse", testGetBootSoftwareVersionIDResponse),
        ("testGetBootSoftwareVersionLabel", testGetBootSoftwareVersionLabel),
        ("testGetBootSoftwareVersionLabelResponse", testGetBootSoftwareVersionLabelResponse),
        ("testGetDMX512Personality", testGetDMX512Personality),
        ("testGetDMX512PersonalityResponse", testGetDMX512PersonalityResponse),
        ("testSetDMX512Personality", testSetDMX512Personality),
        ("testSetDMX512PersonalityResponse", testSetDMX512PersonalityResponse),
    ]
    
    func testDataCheckSum() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x30, 0x01, 0x04, 0x06 , 0x6A])
        XCTAssertEqual(Checksum(data: data.prefix(data.count - 2)), 0x066A)
        XCTAssertEqual(Checksum(rawValue: 0x066A).description, "0x066A")
    }
    
    func testQueueMessage() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x20, 0x01, 0x04, 0x06 , 0x5A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 0x01,
            messageCount: 0x00,
            subDevice: .root,
            messageData: .getQueueMessage(.init(status: .error))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetStatusMessages() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x30, 0x01, 0x04, 0x06 , 0x6A])
                
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 0x01,
            messageCount: 0x00,
            subDevice: .root,
            messageData: .getStatusMessages(.init(status: .error))
        )
        
        XCTAssertEqual(packet.data, data)
        XCTAssertEqual(packet.data.count, 27)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.checksum, 0x066A)
        XCTAssertEqual(packet.messageLength, 25)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        
        XCTAssertEqual(packet, decodedPacket)
    }
    
    func testGetStatusMessagesResponse() {
        
        let data = Data([0xCC, 0x01, 0x33, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x08, 0x00, 0x00, 0x21, 0x00, 0x30, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x50, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x00, 0x09 , 0x96])
        
        let parameterData = Data([0x21, 0x00, 0x30, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x50, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x00])
        
        let statusMessageResponse1 = StatusMessage(
            subDeviceID: .root,
            statusType: .none,
            statusMessageID: .ready)
        
        let statusMessageResponse3 = StatusMessage(
            subDeviceID: SubDevice(rawValue: 0x01),
            statusType: .none,
            statusMessageID: .notReady)
        
        let statusMessageResponse2 = StatusMessage(
            subDeviceID: SubDevice(rawValue: 0x02),
            statusType: .getLastMessage,
            statusMessageID: .ready,
            dataValue1: SlotID.undenifed.rawValue,
            dataValue2: 0)
        
        let statusMessages = [statusMessageResponse1, statusMessageResponse2, statusMessageResponse3]
        
        XCTAssertNotNil(statusMessageResponse1.description)
        XCTAssertNotNil(statusMessageResponse2.description)
        XCTAssertNotNil(statusMessageResponse3.description)
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgementTimer,
            messageCount: 8,
            subDevice: .root,
            messageData: .getStatusMessagesResponse(.init(statusMessage: statusMessages))
        )
        
        XCTAssertEqual(packet.data, data)
        XCTAssertEqual(packet.data.count, 53)
        XCTAssertEqual(packet.messageData.data, parameterData)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.checksum, 0x0996)
        XCTAssertEqual(packet.messageLength, 51)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        
        XCTAssertEqual(packet, decodedPacket)
    }
    
    func testGetStatusIDDescription() {
        
        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x31, 0x02, 0x00, 0x50, 0x06, 0xB9])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getStatusIDDescription(.init(statusID: StatusMessageID.ready))
        )
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetStatusIDDescriptionResponse() {
        
        let data = Data([0xCC, 0x01, 0x24, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x31, 0x0C, 0x44, 0x6F, 0x75, 0x73, 0x65, 0x72, 0x20, 0x72, 0x65, 0x61, 0x64, 0x79, 0x0B, 0x24])
        
        let statusMessage = StatusMessage(
            subDeviceID: .root,
            statusType: .none,
            statusMessageID: .ready,
            dataValue1: SlotID.douser.rawValue
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: ResponseType.acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getStatusIDDescriptionResponse(.init(response: statusMessage.description))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testClearStatusID() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x32, 0x00, 0x06, 0x76])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .clearStatusID
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 26)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testClearStatusIDResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0x32, 0x00, 0x06, 0x76])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .clearStatusIDResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 26)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        XCTAssertEqual(packet.messageData.data, messageData.data)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSubDeviceStatusReportingThreshold() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x33, 0x00, 0x06, 0x67])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSubDeviceStatusReportingThreshold
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 26)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSubDeviceStatusReportingThresholdResponse() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x33, 0x01, 0x00, 0x06, 0x69])

        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSubDeviceStatusReportingThresholdResponse(.init(status: .none))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 27)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetSubDeviceStatusReportingThreshold() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x33, 0x01, 0x01, 0x06, 0x7A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setSubDeviceStatusReportingThreshold(.init(status: .getLastMessage))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 27)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetSubDeviceStatusReportingThresholdResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0x33, 0x00, 0x06, 0x77])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setSubDeviceStatusReportingThresholdResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 26)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSupportedParameters() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x50, 0x00, 0x06, 0x84])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSupportedParameters
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 26)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSupportedParametersResponse() {
        
        let data = Data([0xCC, 0x01, 0x1E, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x03, 0x00, 0x00, 0x00, 0x21, 0x00, 0x50, 0x06, 0x10, 0x10, 0x10, 0x30, 0x00, 0x60, 0x07, 0x53])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgementOverflow,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSupportedParametersResponse(.init(parameterIDs: [.powerState, .capturePreset, .deviceInfo]))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 32)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetParameterDescription() {
        
        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x51, 0x02, 0x80, 0x00, 0x07, 0x09])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getParameterDescription(.init(parameterID: ParameterID(rawValue: 0x8000)))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetParameterDescriptionResponse() {
        
        let data = Data([0xCC, 0x01, 0x3E, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x51, 0x26, 0x80, 0x00, 0x00, 0x01, 0x03, 0x00, 0x1C, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x52, 0x61, 0x6E, 0x64, 0x6F, 0x6D, 0x20, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x0E, 0xAC])
        
        let parameterDescription = ParameterDescription(
            pidRequested: ParameterID(rawValue: 0x8000),
            pldSize: 0,
            dataType: .bitField,
            commandClass: .getSet,
            unit: .byte,
            prefix: .mega,
            minValidValue: 0,
            maxValidValue: 256,
            maxDefaultValue: 256,
            description: "Random description"
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getParameterDescriptionResponse(.init(parameterDescription: parameterDescription))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceInfo() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00, 0x06, 0x94])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceInfo
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceInfoResponse() {
        
        let data = Data([0xCC, 0x01, 0x2B, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x60, 0x13, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x08, 0xBA])
        
        let deviceInfo = DeviceInfo(
            protocolVersion: .v1_0,
            deviceModelID: .zero,
            productCategory: .notDeclared,
            softwareVersionID: .zero,
            dmx512Footprint: .nullStartCode,
            dmx512Personality: DMX512Personality(current: 1, total: 0),
            dmx512StartAddress: .zero,
            subDeviceCount: .zero,
            sensorCount: .zero
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceInfoResponse(.init(deviceInfo: deviceInfo))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetProductDetailIDList() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x70, 0x00, 0x06, 0xA4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getProductDetailIDList
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetProductDetailIDListResponse() {
        
        let data = Data([0xCC, 0x01, 0x22, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x03, 0x00, 0x00, 0x00, 0x21, 0x00, 0x70, 0x0A, 0x00, 0x01, 0x0A, 0x01, 0x02, 0x00, 0x03, 0x03, 0x04, 0x03, 0x06, 0xD6])
        
        let productDetailIDs: [ProductDetail] = [.arc, .battery, .video , .co2, .pwm]
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgementOverflow,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getProductDetailIDListResponse(.init(productDetailIDs: productDetailIDs))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceModelDescription() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x80, 0x00, 0x06, 0xB4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceModelDescription
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceModelDescriptionResponse() {
        
        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x80, 0x20, 0x44, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x20, 0x6C, 0x69, 0x6D, 0x69, 0x74, 0x65, 0x64, 0x20, 0x75, 0x70, 0x20, 0x74, 0x6F, 0x20, 0x33, 0x32, 0x20, 0x63, 0x68, 0x61, 0x12, 0x59])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceModelDescriptionResponse(.init(modelDescription: "Description limited up to 32 characters"))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetManufacturerLabel() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x81, 0x00, 0x06, 0xB5])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getManufacturerLabel
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetManufacturerLabelResponse() {
        
        
        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x80, 0x20, 0x44, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x20, 0x6C, 0x69, 0x6D, 0x69, 0x74, 0x65, 0x64, 0x20, 0x75, 0x70, 0x20, 0x74, 0x6F, 0x20, 0x33, 0x32, 0x20, 0x63, 0x68, 0x61, 0x12, 0x59])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceModelDescriptionResponse(.init(modelDescription: "Description limited up to 32 characters"))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceLabel() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x82, 0x00, 0x06, 0xB6])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceLabel
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceLabelResponse() {
        
        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x82, 0x20, 0x41, 0x53, 0x43, 0x49, 0x49, 0x20, 0x74, 0x65, 0x78, 0x74, 0x20, 0x6C, 0x61, 0x62, 0x65, 0x6C, 0x2E, 0x20, 0x55, 0x70, 0x20, 0x74, 0x6F, 0x20, 0x33, 0x32, 0x20, 0x63, 0x68, 0x61, 0x72, 0x61, 0x11, 0x1E])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceLabelResponse(.init(deviceLabel: "ASCII text label. Up to 32 characters."))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDeviceLabel() {
        
        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x82, 0x20, 0x41, 0x53, 0x43, 0x49, 0x49, 0x20, 0x74, 0x65, 0x78, 0x74, 0x20, 0x6C, 0x61, 0x62, 0x65, 0x6C, 0x2E, 0x20, 0x55, 0x70, 0x20, 0x74, 0x6F, 0x20, 0x33, 0x32, 0x20, 0x63, 0x68, 0x61, 0x72, 0x61, 0x11, 0x2E])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDeviceLabel(.init(deviceLabel: "ASCII text label. Up to 32 characters."))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDeviceLabelResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0x82, 0x00, 0x06, 0xC6])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDeviceLabelResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetFactoryDefaults() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x90, 0x00, 0x06, 0xC4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getFactoryDefaults
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetFactoryDefaultsResponse() {

        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x90, 0x01, 0x00, 0x06, 0xC6])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getFactoryDefaultsResponse(.init(response: false))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetFactoryDefaults() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x90, 0x00, 0x06, 0xD4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setFactoryDefaults
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetFactoryDefaultsResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0x90, 0x00, 0x06, 0xD4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setFactoryDefaultsResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLanguageCapabilities() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xA0, 0x00, 0x06, 0xD4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getLanguageCapabilities
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLanguageCapabilitiesResponse() {

        let data = Data([0xCC, 0x01, 0x26, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xA0, 0x0E, 0x41, 0x5A, 0x44, 0x5A, 0x48, 0x5A, 0x55, 0x5A, 0x5A, 0x41, 0x5A, 0x48, 0x5A, 0x55, 0x0B, 0x66])
        
        let strings = Locale.isoLanguageCodes.filter{ $0.count == 2 && $0.contains("z")}.map{ $0.uppercased() }
        
        dump(strings)
        
        let languageCodes: [LanguageCode] = strings.compactMap{ LanguageCode(stringLiteral: $0) }
        
        dump(languageCodes.description)
        
        XCTAssertEqual(strings.count, languageCodes.count)
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getLanguageCapabilitiesResponse(.init(languageCodes: languageCodes))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLanguage() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xB0, 0x00, 0x06, 0xE4])

        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getLanguage
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLanguageResponse() {
        
        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xB0, 0x02, 0x45, 0x4E, 0x07, 0x7B])

        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getLanguageResponse(.init(languageCode: .en))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLanguage() {

        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0xB0, 0x02, 0x00, 0x00, 0x06, 0xF8])

        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setLanguage(.init(languageCode: .reset))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLanguageResponse() {
 
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0xB0, 0x00, 0x06, 0xF4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setLanguageResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSoftwareVersionLabel() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xC0, 0x00, 0x06, 0xF4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getSoftwareVersionLabel
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSoftwareVersionLabelResponse() {

        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xC0, 0x20, 0x41, 0x53, 0x43, 0x49, 0x49, 0x20, 0x74, 0x65, 0x78, 0x74, 0x20, 0x53, 0x6F, 0x66, 0x74, 0x77, 0x61, 0x72, 0x65, 0x20, 0x56, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x20, 0x4C, 0x61, 0x62, 0x65, 0x12, 0x87])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getSoftwareVersionLabelResponse(.init(versionLabel: "ASCII text Software Version Label Up to 32 characters."))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetBootSoftwareVersionID() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xC1, 0x00, 0x06, 0xF5])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getBootSoftwareVersionID
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetBootSoftwareVersionIDResponse() {

        let data = Data([0xCC, 0x01, 0x1C, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xC1, 0x04, 0x00, 0x00, 0x07, 0xE4, 0x07, 0xE8])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getBootSoftwareVersionIDResponse(.init(versionID: 2020))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetBootSoftwareVersionLabel() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xC2, 0x00, 0x06, 0xF6])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getBootSoftwareVersionLabel
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetBootSoftwareVersionLabelResponse() {

        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xC2, 0x20, 0x41, 0x53, 0x43, 0x49, 0x49, 0x20, 0x74, 0x65, 0x78, 0x74, 0x20, 0x53, 0x6F, 0x66, 0x74, 0x77, 0x61, 0x72, 0x65, 0x20, 0x42, 0x6F, 0x6F, 0x74, 0x20, 0x56, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x12, 0xA9])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getBootSoftwareVersionLabelResponse(.init(versionLabel: "ASCII text Software Boot Version Label Up to 32 characters."))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDMX512Personality() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xE0, 0x00, 0x07, 0x14])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDMX512Personality
        )
        
        dump(packet)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDMX512PersonalityResponse() {

        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xE0, 0x02, 0x01, 0x01, 0x07, 0x1A])
        
        
        
        let dmxPersonality = DMX512Personality.init(current: 1, total: 1)
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDMX512PersonalityResponse(.init(dmxPersonality: dmxPersonality))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDMX512Personality() {

        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0xE0, 0x01, 0x01, 0x07, 0x27])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDMX512Personality(.init(personality: 1))
        )
        
        dump(packet)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDMX512PersonalityResponse() {

        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0xE0, 0x00, 0x07, 0x24])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDMX512PersonalityResponse
        )
        
        dump(packet)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
}
