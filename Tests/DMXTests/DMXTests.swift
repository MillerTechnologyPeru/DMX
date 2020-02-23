import XCTest
@testable import DMX

final class DMXTests: XCTestCase {
    
    static let allTests = [
        ("testExample", testExample),
    ]
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DMX().text, "Hello, World!")
    }

    
}
