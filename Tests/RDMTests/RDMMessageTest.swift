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
        ("testMessageGetStatusController", testMessageGetStatusController)
    ]
    
    func testDataCheckSum() {
        
        let data: Data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x30, 0x01, 0x04, 0x06 , 0x6A])
        
        XCTAssertEqual(Checksum.checksum(data: data), 0x066A)
        
        let dataMax: Data = Data([UInt8](repeating: 0xFF, count: 259))
        
        XCTAssertEqual(Checksum.checksum(data: dataMax), UInt16.max)
    }
    
    func testMessageGetStatusController() {
        
        let data: Data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x30, 0x01, 0x04, 0x06 , 0x6A])
        
        let value = MessageGetStatusController(
            destinationUID: DeviceUID(rawValue: "1234:56789ABC")!,
            sourceUID: DeviceUID(rawValue: "CBA9:87654321")!,
            transactionNumber: TransactionNumber(),
            typeField: 0x01, //port
            messageCount: 0x00,
            subDevice: .root,
            messageData: .init(parameterData: .error),
            checkSum: 0x066A)
        dump(value)
        
        guard let dataValue = MessageGetStatusController(data: data)
            else { XCTFail("could not convert value from data"); return }
        XCTAssertEqual(value, dataValue)
        
        XCTAssertEqual(dataValue.checkSum, Checksum.checksum(data: data))
        dump(dataValue)
    }
}
