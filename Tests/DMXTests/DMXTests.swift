import XCTest
@testable import DMX

final class DMXTests: XCTestCase {
    
    static let allTests = [
        ("testChannels", testChannels),
    ]
    
    func testChannels() {
        
        XCTAssert(Channels().isEmpty)
        XCTAssertEqual(Channels().count, 0)
        XCTAssertEqual(Channels().data.count, 0)
        XCTAssert(Channels(data: Data())!.isEmpty)
        
        XCTAssertEqual(Channels(count: 3).description, "[0%, 0%, 0%]")
        
        do {
            let value: Channels = [0x00, 0x01, 0xFF, 0x05, 0xFF, 0x01]
            XCTAssertEqual(value.count, 6)
            XCTAssertEqual(value, [0: 0x00, 1: 0x01, 2: 0xFF, 3: 0x05, 4: 0xFF, 5: 0x01])
            XCTAssertEqual(value.description, "[0%, 0.4%, 100%, 2%, 100%, 0.4%]")
        }
    }
}
