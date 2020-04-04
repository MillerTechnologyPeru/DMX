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
        ("testGetStatusMessages", testGetStatusMessages),
        ("testGetStatusMessagesResponse", testGetStatusMessagesResponse)
    ]
    
    func testDataCheckSum() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x30, 0x01, 0x04, 0x06 , 0x6A])
        XCTAssertEqual(Checksum(data: data.prefix(data.count - 2)), 0x066A)
        XCTAssertEqual(Checksum(rawValue: 0x066A).description, "0x066A")
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
}
