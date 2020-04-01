//
//  Checksum.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

import Foundation

public struct Checksum {
    
    static func checksum(data: Data) -> UInt16 {
        guard data.count <= 259
            else { fatalError("data size will overflow an UInt16 value verify data") }
        var bitArray:[UInt8] = Array(data)
        let checksumLow = bitArray.removeLast()
        let checksumHigh = bitArray.removeLast()
        let _checkSum = UInt16(bigEndian: UInt16(bytes: (checksumHigh, checksumLow)))
        let checkSum = bitArray.map{ UInt16(bigEndian: UInt16(bytes: (0, $0))) }.reduce(0, +)
        assert(_checkSum == checkSum)
        return checkSum
    }
}
