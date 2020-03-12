//
//  RDMTests.swift
//  
//
//  Created by Alsey Coleman Miller on 3/12/20.
//

import Foundation
import XCTest
@testable import RDM

final class RDMTests: XCTestCase {

    static let allTests = [
        ("testResponseError", testResponseError),
    ]

    func testResponseError() {
        
        let error = RDM.ResponseError.unknownPID
        XCTAssertEqual(error.errorDescription, "The responder cannot comply with request because the message is not implemented in responder.")
        
        #if canImport(Darwin)
        
        XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. The responder cannot comply with request because the message is not implemented in responder.")
        XCTAssertEqual(error.errorCode, numericCast(error.rawValue))
        
        #endif
    }
    
    func testCommandClass() {
        
        XCTAssertTrue(CommandClass.get.isResponseExpected)
        XCTAssertFalse(CommandClass.getResponse.isResponseExpected)
    }
}
