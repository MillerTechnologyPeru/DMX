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
        ("testGetStatusMessages", testGetStatusMessages)
    ]
    
    func testDataCheckSum() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x30, 0x01, 0x04, 0x06 , 0x6A])
        XCTAssertEqual(Checksum(data: data.prefix(data.count - 2)), 0x066A)
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
            messageData: GetStatusMessages(status: .error)
        )
        
        XCTAssertEqual(packet.data, data)
        XCTAssertEqual(packet.data.count, 27)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.checksum, 0x066A)
        XCTAssertEqual(packet.messageLength, 25)
        
        /*
        guard let dataValue = GetStatusMessages(data: data)
            else { XCTFail("could not convert value from data"); return }
        XCTAssertEqual(value, dataValue)
        
        XCTAssertEqual(dataValue.checkSum, Checksum.checksum(data: data))
        dump(dataValue)*/
    }
}
