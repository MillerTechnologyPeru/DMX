import XCTest
@testable import DMX

final class DMXTests: XCTestCase {
    
    static let allTests = [
        ("testChannels", testChannels),
    ]
    
    func testChannels() {
        
        XCTAssert(Channels().isEmpty)
        XCTAssert(Channels().count == 0)
        
    }
}
