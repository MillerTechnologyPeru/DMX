//
//  RdmUIDTests.swift
//  
//
//  Created by Alsey Coleman Miller on 3/11/20.
//

import Foundation
import XCTest
@testable import RDM

final class UIDTests: XCTestCase {
    
    static let allTests = [
        ("testString", testString),
        ("testMalformedString", testMalformedString),
        ("testData", testData),
        ("testMalformedData", testMalformedData),
        ("testEUID", testEUID)
    ]
    
    func testString() {
        
        let rawValues = [
            "001A:7DDA7113",
            "5980:ED81EE35",
            "ACBC:32A66742"
        ]
        
        rawValues.forEach { XCTAssertEqual(DeviceUID(rawValue: $0)?.rawValue, $0) }
    }
    
    func testMalformedString() {
        
        let malformed = [
            "0",
            "01",
            "012",
            "xxxx",
            "xxxxx",
            "0xxxxx",
            "0123456",
            "012g4567",
            "012345678",
            "0x234567u9",
            "01234567890",
            "@aXX:XX:XX:XX:&&",
            "AABBCCDD$$",
            "AABBCCDD^^",
            "12C:BB:CC:DD:EE",
            "12C:BB:CC:DD:E",
            "FFFF::7D:DA:71:13",
            "00:1A:7D:DA:71:13a",
            "0:1A:7D:DA:71:13",
            "00:1A:7D:DA:71;13",
            "001A::DDA7113"
        ]
        
        malformed.forEach { XCTAssertNil(DeviceUID(rawValue: $0), $0) }
    }
    
    func testData() {
        
        let testData: [(rawValue: String, data: Data)] = [
            ("001A:7DDA7113", Data([0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13])),
            ("5980:ED81EE35", Data([0x59, 0x80, 0xED, 0x81, 0xEE, 0x35])),
            ("ACBC:32A66742", Data([0xAC, 0xBC, 0x32, 0xA6, 0x67, 0x42]))
        ]
        
        for test in testData {
            
            guard let address = DeviceUID(rawValue: test.rawValue)
                else { XCTFail("Could not parse"); continue }
            
            XCTAssertEqual(address.rawValue, test.rawValue)
            XCTAssertEqual(address, DeviceUID(data: test.data))
            XCTAssertEqual(address.data, test.data)
        }
    }
    
    func testMalformedData() {
        
        let malformed = [
            Data(),
            Data([0x00]),
            Data([0x00, 0x1A]),
            Data([0x00, 0x1A, 0x7D]),
            Data([0x00, 0x1A, 0x7D, 0xDA]),
            Data([0x00, 0x1A, 0x7D, 0xDA, 0x71]),
            Data([0x00, 0x1A, 0x7D, 0xDA, 0x71, 0x13, 0xAA])
        ]
        
        malformed.forEach { XCTAssertNil(DeviceUID(data: $0)) }
    }
    
    func testEUID() {
        
        let uid = Broadcast.broadcastAllDevicesID(manufacturerId: 0x001A)
        
        XCTAssertEqual(uid.index(before: 0), -1)
        
        let euid = EncodedUID(uid: uid)
        
        let euidFromData = EncodedUID(data: euid.data)
        XCTAssertEqual(euid, euidFromData)
        XCTAssertEqual(euid.dataLength, euidFromData?.dataLength)
        XCTAssertEqual(euid.hashValue, euidFromData?.hashValue)
    }
}
