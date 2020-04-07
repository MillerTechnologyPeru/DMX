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
        ("testGetParameterDescriptionResponse", testGetParameterDescriptionResponse)
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
            typeField: 0x01,
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
            typeField: 0x01,
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
            typeField: 0x01,
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
            typeField: 1,
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
            typeField: ResponseType.acknowledgement.rawValue,
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
            typeField: 1,
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
            typeField: ResponseType.acknowledgement.rawValue,
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
            typeField: 1,
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
            typeField: ResponseType.acknowledgement.rawValue,
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
            typeField: 1,
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
            typeField: ResponseType.acknowledgement.rawValue,
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
            typeField: 1,
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
            typeField: ResponseType.acknowledgementOverflow.rawValue,
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
            typeField: 1,
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
            typeField: ResponseType.acknowledgement.rawValue,
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
}
