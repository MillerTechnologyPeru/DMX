import XCTest
@testable import DMX

final class DMXTests: XCTestCase {
    
    static let allTests = [
        ("testChannels", testChannels),
    ]
    
    func testChannels() {
        
        do {
            XCTAssert(Channels().isEmpty)
            XCTAssert(Channels(count: 0).isEmpty)
            XCTAssertEqual(Channels(count: 0).count, 0)
            XCTAssertEqual(Channels().count, 0)
            XCTAssertEqual(Channels().data.count, 0)
            XCTAssert(Channels(data: Data())!.isEmpty)
            XCTAssertNotEqual(Channels(), [0x00])
            XCTAssertNil(Channels().elements.firstKey)
            XCTAssertNil(Channels().elements.lastKey)
            XCTAssertEqual(Channels().hashValue, Channels().hashValue)
        }
        
        do {
            XCTAssertEqual(Channels(count: 3).description, "[0%, 0%, 0%]")
            XCTAssertEqual(Channels(count: 0).description, "[]")
        }
        
        do {
            let value: Channels = [0.0, 0.004, 1.0, 0.02, 1.0, 0.004]
            XCTAssertEqual(value.count, 6)
            XCTAssertEqual(value.elements.firstKey, 0)
            XCTAssertEqual(value.elements.lastKey, 5)
            XCTAssertEqual(value, [0: 0x00, 1: 0x01, 2: 0xFF, 3: 0x05, 4: 0xFF, 5: 0x01])
            XCTAssertEqual(value[0], .zero)
            XCTAssertEqual(value.description, "[0%, 0.4%, 100%, 2%, 100%, 0.4%]")
            XCTAssertEqual(value, Channels(data: Data([0x00, 0x01, 0xFF, 0x05, 0xFF, 0x01])))
            XCTAssertEqual(value, Channels([0x00, 0x01, 0xFF, 0x05, 0xFF, 0x01]))
            XCTAssertEqual(value, value)
            XCTAssertEqual(value.reversed(), value.reversed())
            XCTAssertEqual(value.hashValue, value.hashValue)
            XCTAssertNotEqual(value, [])
            XCTAssertNotEqual(value, [0x00])
            XCTAssertNotEqual(value, [0x00, 0x01])
            XCTAssertNotEqual(value, [1, 1, 1, 1, 1, 1])
        }
        
        do {
            var value = Channels()
            value[0] = 0.01
            value[1] = 0.02
            value[2] = 0.03
            value[Channels.maxLength - 1] = 1.0
            XCTAssertEqual(value, value)
            XCTAssertEqual(value.hashValue, value.hashValue)
            XCTAssertEqual(value.elements.firstKey, 0)
            XCTAssertEqual(value.elements.lastKey, UInt(Channels.maxLength - 1))
            XCTAssertEqual(value.count, Channels.maxLength)
            XCTAssertFalse(value.isEmpty)
            XCTAssertNotEqual(value.elements.count, Channels.maxLength)
            XCTAssertNotEqual(value.count, value.elements.count)
            XCTAssertEqual(value.elements.count, 4)
            XCTAssertEqual(value.data.count, 512)
            value.count = 3
            XCTAssertEqual(value, value)
            XCTAssertEqual(value.hashValue, value.hashValue)
            XCTAssertEqual(value.count, 3)
            XCTAssertFalse(value.isEmpty)
            XCTAssertEqual(value.elements.count, 3)
            XCTAssertEqual(value.data.count, 3)
            XCTAssertEqual(value.count, value.elements.count)
            value.count = 6
            XCTAssertEqual(value, value)
            XCTAssertEqual(value.hashValue, value.hashValue)
            XCTAssertEqual(Array(value), [0.01, 0.02, 0.03, 0.0, 0.0, 0.0])
            XCTAssertEqual(value.elements.count, 4)
            XCTAssertNotEqual(value.count, value.elements.count)
            value.count = 2
            XCTAssertEqual(value, value)
            XCTAssertEqual(value.hashValue, value.hashValue)
            XCTAssertEqual(Array(value), [0.01, 0.02])
            XCTAssertEqual(value.elements.count, 2)
            XCTAssertEqual(value.count, value.elements.count)
        }
        
        do {
            XCTAssertNil(Channels([Channels.Slot].init(repeating: 0x00, count: 513)))
            XCTAssertNil(Channels(data: Data(count: 513)))
        }
        
        do {
            let descriptions: [Channels.Slot: String] = [
                0x00 : "0%",
                0x01 : "0.4%",
                0x02 : "0.8%",
                0x03 : "1.2%",
                0x04 : "1.6%",
                0x05 : "2%",
                0x06 : "2.4%",
                0x07 : "2.7%",
                0x08 : "3.1%",
                0x09 : "3.5%",
                0x0A : "3.9%",
                0x0B : "4.3%",
                0x0C : "4.7%",
                0x0D : "5.1%",
                0x0E : "5.5%",
                0x0F : "5.9%",
                0x10 : "6.3%",
                0x11 : "6.7%",
                0x12 : "7.1%",
                0x13 : "7.5%",
                0x14 : "7.8%",
                0x15 : "8.2%",
                0x16 : "8.6%",
                0x17 : "9%",
                0x18 : "9.4%",
                0x19 : "9.8%",
                0x1A : "10.2%",
                0x1B : "10.6%",
                0x1C : "11%",
                0x1D : "11.4%",
                0x1E : "11.8%",
                0x1F : "12.2%",
                0x20 : "12.5%",
                0x21 : "12.9%",
                0x22 : "13.3%",
                0x23 : "13.7%",
                0x24 : "14.1%",
                0x25 : "14.5%",
                0x26 : "14.9%",
                0x27 : "15.3%",
                0x28 : "15.7%",
                0x29 : "16.1%",
                0x2A : "16.5%",
                0x2B : "16.9%",
                0x2C : "17.3%",
                0x2D : "17.6%",
                0x2E : "18%",
                0x2F : "18.4%",
                0x30 : "18.8%",
                0x31 : "19.2%",
                0x32 : "19.6%",
                0x33 : "20%",
                0x34 : "20.4%",
                0x35 : "20.8%",
                0x36 : "21.2%",
                0x37 : "21.6%",
                0x38 : "22%",
                0x39 : "22.4%",
                0x3A : "22.7%",
                0x3B : "23.1%",
                0x3C : "23.5%",
                0x3D : "23.9%",
                0x3E : "24.3%",
                0x3F : "24.7%",
                0x40 : "25.1%",
                0x41 : "25.5%",
                0x42 : "25.9%",
                0x43 : "26.3%",
                0x44 : "26.7%",
                0x45 : "27.1%",
                0x46 : "27.5%",
                0x47 : "27.8%",
                0x48 : "28.2%",
                0x49 : "28.6%",
                0x4A : "29%",
                0x4B : "29.4%",
                0x4C : "29.8%",
                0x4D : "30.2%",
                0x4E : "30.6%",
                0x4F : "31%",
                0x50 : "31.4%",
                0x51 : "31.8%",
                0x52 : "32.2%",
                0x53 : "32.5%",
                0x54 : "32.9%",
                0x55 : "33.3%",
                0x56 : "33.7%",
                0x57 : "34.1%",
                0x58 : "34.5%",
                0x59 : "34.9%",
                0x5A : "35.3%",
                0x5B : "35.7%",
                0x5C : "36.1%",
                0x5D : "36.5%",
                0x5E : "36.9%",
                0x5F : "37.3%",
                0x60 : "37.6%",
                0x61 : "38%",
                0x62 : "38.4%",
                0x63 : "38.8%",
                0x64 : "39.2%",
                0x65 : "39.6%",
                0x66 : "40%",
                0x67 : "40.4%",
                0x68 : "40.8%",
                0x69 : "41.2%",
                0x6A : "41.6%",
                0x6B : "42%",
                0x6C : "42.4%",
                0x6D : "42.7%",
                0x6E : "43.1%",
                0x6F : "43.5%",
                0x70 : "43.9%",
                0x71 : "44.3%",
                0x72 : "44.7%",
                0x73 : "45.1%",
                0x74 : "45.5%",
                0x75 : "45.9%",
                0x76 : "46.3%",
                0x77 : "46.7%",
                0x78 : "47.1%",
                0x79 : "47.5%",
                0x7A : "47.8%",
                0x7B : "48.2%",
                0x7C : "48.6%",
                0x7D : "49%",
                0x7E : "49.4%",
                0x7F : "49.8%",
                0x80 : "50.2%",
                0x81 : "50.6%",
                0x82 : "51%",
                0x83 : "51.4%",
                0x84 : "51.8%",
                0x85 : "52.2%",
                0x86 : "52.5%",
                0x87 : "52.9%",
                0x88 : "53.3%",
                0x89 : "53.7%",
                0x8A : "54.1%",
                0x8B : "54.5%",
                0x8C : "54.9%",
                0x8D : "55.3%",
                0x8E : "55.7%",
                0x8F : "56.1%",
                0x90 : "56.5%",
                0x91 : "56.9%",
                0x92 : "57.3%",
                0x93 : "57.6%",
                0x94 : "58%",
                0x95 : "58.4%",
                0x96 : "58.8%",
                0x97 : "59.2%",
                0x98 : "59.6%",
                0x99 : "60%",
                0x9A : "60.4%",
                0x9B : "60.8%",
                0x9C : "61.2%",
                0x9D : "61.6%",
                0x9E : "62%",
                0x9F : "62.4%",
                0xA0 : "62.7%",
                0xA1 : "63.1%",
                0xA2 : "63.5%",
                0xA3 : "63.9%",
                0xA4 : "64.3%",
                0xA5 : "64.7%",
                0xA6 : "65.1%",
                0xA7 : "65.5%",
                0xA8 : "65.9%",
                0xA9 : "66.3%",
                0xAA : "66.7%",
                0xAB : "67.1%",
                0xAC : "67.5%",
                0xAD : "67.8%",
                0xAE : "68.2%",
                0xAF : "68.6%",
                0xB0 : "69%",
                0xB1 : "69.4%",
                0xB2 : "69.8%",
                0xB3 : "70.2%",
                0xB4 : "70.6%",
                0xB5 : "71%",
                0xB6 : "71.4%",
                0xB7 : "71.8%",
                0xB8 : "72.2%",
                0xB9 : "72.5%",
                0xBA : "72.9%",
                0xBB : "73.3%",
                0xBC : "73.7%",
                0xBD : "74.1%",
                0xBE : "74.5%",
                0xBF : "74.9%",
                0xC0 : "75.3%",
                0xC1 : "75.7%",
                0xC2 : "76.1%",
                0xC3 : "76.5%",
                0xC4 : "76.9%",
                0xC5 : "77.3%",
                0xC6 : "77.6%",
                0xC7 : "78%",
                0xC8 : "78.4%",
                0xC9 : "78.8%",
                0xCA : "79.2%",
                0xCB : "79.6%",
                0xCC : "80%",
                0xCD : "80.4%",
                0xCE : "80.8%",
                0xCF : "81.2%",
                0xD0 : "81.6%",
                0xD1 : "82%",
                0xD2 : "82.4%",
                0xD3 : "82.7%",
                0xD4 : "83.1%",
                0xD5 : "83.5%",
                0xD6 : "83.9%",
                0xD7 : "84.3%",
                0xD8 : "84.7%",
                0xD9 : "85.1%",
                0xDA : "85.5%",
                0xDB : "85.9%",
                0xDC : "86.3%",
                0xDD : "86.7%",
                0xDE : "87.1%",
                0xDF : "87.5%",
                0xE0 : "87.8%",
                0xE1 : "88.2%",
                0xE2 : "88.6%",
                0xE3 : "89%",
                0xE4 : "89.4%",
                0xE5 : "89.8%",
                0xE6 : "90.2%",
                0xE7 : "90.6%",
                0xE8 : "91%",
                0xE9 : "91.4%",
                0xEA : "91.8%",
                0xEB : "92.2%",
                0xEC : "92.5%",
                0xED : "92.9%",
                0xEE : "93.3%",
                0xEF : "93.7%",
                0xF0 : "94.1%",
                0xF1 : "94.5%",
                0xF2 : "94.9%",
                0xF3 : "95.3%",
                0xF4 : "95.7%",
                0xF5 : "96.1%",
                0xF6 : "96.5%",
                0xF7 : "96.9%",
                0xF8 : "97.3%",
                0xF9 : "97.6%",
                0xFA : "98%",
                0xFB : "98.4%",
                0xFC : "98.8%",
                0xFD : "99.2%",
                0xFE : "99.6%",
                0xFF : "100%",
            ]
            
            for (value, string) in descriptions {
                XCTAssertEqual(value.description, string)
            }
        }
    }
}
