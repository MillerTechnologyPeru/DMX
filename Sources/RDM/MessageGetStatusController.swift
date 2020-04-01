//
//  MessageGetStatusController.swift
//  
//
//  Created by Jorge Loc Rubio on 4/1/20.
//

import Foundation

public struct MessageGetStatusController: MessageDelegate, Equatable, Hashable {
    
    public var startCode: UInt8 { DefinedParameters.startCode }
    
    public var subStartCode: UInt8 { DefinedParameters.subMessage }
    
    public var length: UInt8
    
    public var destinationUID: DeviceUID
    
    public var sourceUID: DeviceUID
    
    public var transactionNumber: TransactionNumber
    
    public var typeField: UInt8
    
    public var messageCount: UInt8
    
    public var subDevice: SubDevice
    
    public var messageData: RDMGetStatusMessagesController
    
    public var checkSum: UInt16
    
    public init(destinationUID: DeviceUID,
                sourceUID: DeviceUID,
                transactionNumber: TransactionNumber,
                typeField: UInt8,
                messageCount: UInt8,
                subDevice: SubDevice,
                messageData: RDMGetStatusMessagesController,
                checkSum: UInt16) {
        
        self.destinationUID = destinationUID
        self.sourceUID = sourceUID
        self.transactionNumber = transactionNumber
        self.typeField = typeField
        self.messageCount = messageCount
        self.subDevice = subDevice
        self.messageData = messageData
        self.length = type(of: self)._elements + messageData.elements
        
        self.checkSum = checkSum
    }
}

// MARK: - CheckSum

public extension MessageGetStatusController {
    
    internal var _checkSum: UInt16 {
        let sum = UInt16( bytes: (0, startCode))
            + UInt16( bytes: (0, subStartCode))
            + UInt16( bytes: (0, length))
            + UInt16( bytes: (0, destinationUID.manufacturer.bytes.0))
            + UInt16( bytes: (0, destinationUID.manufacturer.bytes.1))
            + UInt16( bytes: (0, destinationUID.device.bytes.0))
            + UInt16( bytes: (0, destinationUID.device.bytes.1))
            + UInt16( bytes: (0, destinationUID.device.bytes.2))
            + UInt16( bytes: (0, destinationUID.device.bytes.3))
            + UInt16( bytes: (0, sourceUID.manufacturer.bytes.0))
            + UInt16( bytes: (0, sourceUID.manufacturer.bytes.1))
            + UInt16( bytes: (0, sourceUID.device.bytes.0))
            + UInt16( bytes: (0, sourceUID.device.bytes.1))
            + UInt16( bytes: (0, sourceUID.device.bytes.2))
            + UInt16( bytes: (0, sourceUID.device.bytes.3))
            + UInt16( bytes: (0, transactionNumber.rawValue))
            + UInt16( bytes: (0, typeField))
            + UInt16( bytes: (0, messageCount))
            + UInt16( bytes: (0, subDevice.rawValue.bytes.0))
            + UInt16( bytes: (0, subDevice.rawValue.bytes.1))
            + messageData.checksum
        return UInt16(sum)
    }
    
    func validateCheckSum() -> Bool {
        return checkSum == _checkSum
    }
}

// MARK: - Elements

public extension MessageGetStatusController {
    
    static var _elements: UInt8 {
        return 1 // startCode
             + 1 // subStartCode
             + 1 // destinationUID
             + 6 // destinationUID
             + 6 // sourceUID
             + 1 // transactionNumber
             + 1 // typeField
             + 1 // messageCount
             + 2 // subDevice
    }
}

// MARK: - Data

public extension MessageGetStatusController {
    
    init?(data: Data) {
        guard data.isEmpty == false
            else { return nil }
        
        var offset = 2 // 0 = StartCode / 1 = subcode
        
        self.length = data[offset]
        offset += 1
        
        self.destinationUID = DeviceUID(data: data.subdataNoCopy(in: offset ..< offset + 6))!
        offset += 6
        
        self.sourceUID = DeviceUID(data: data.subdataNoCopy(in: offset ..< offset + 6))!
        offset += 6
        
        self.transactionNumber = TransactionNumber(rawValue: data[offset])
        offset += 1
        
        self.typeField = data[offset]
        offset += 1
        
        self.messageCount = data[offset]
        offset += 1
        
        self.subDevice = SubDevice(rawValue: UInt16(bigEndian: UInt16(bytes: (data[offset], data[offset + 1]))))
        offset += 2
        
        self.messageData = RDMGetStatusMessagesController(data: data.subdataNoCopy(in: offset ..< Int(length)))!
        
        self.checkSum = Checksum.checksum(data: data.subdataNoCopy(in: 0 ..< data.count))
    }
}
