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
        ("testQueueMessage", testQueueMessage),
        ("testGetStatusMessages", testGetStatusMessages),
        ("testGetStatusMessagesResponse", testGetStatusMessagesResponse),
        ("testGetStatusIDDescription",testGetStatusIDDescription),
        ("testGetStatusIDDescriptionResponse",testGetStatusIDDescriptionResponse),
        ("testClearStatusID",testClearStatusID),
        ("testClearStatusIDResponse",testClearStatusIDResponse),
        ("testGetSubDeviceStatusReportingThreshold",testGetSubDeviceStatusReportingThreshold),
        ("testGetSubDeviceStatusReportingThresholdResponse",testGetSubDeviceStatusReportingThreshold),
        ("testSetSubDeviceStatusReportingThreshold",testSetSubDeviceStatusReportingThreshold),
        ("testSetSubDeviceStatusReportingThresholdResponse",testSetSubDeviceStatusReportingThreshold),
        ("testGetSupportedParameters", testGetSupportedParameters),
        ("testGetSupportedParametersResponse", testGetSupportedParametersResponse),
        ("testGetParameterDescription", testGetParameterDescription),
        ("testGetParameterDescriptionResponse", testGetParameterDescriptionResponse),
        ("testGetDeviceInfo", testGetDeviceInfo),
        ("testGetDeviceInfoResponse", testGetDeviceInfoResponse),
        ("testGetProductDetailIDList", testGetProductDetailIDList),
        ("testGetProductDetailIDListResponse", testGetProductDetailIDListResponse),
        ("testGetDeviceModelDescription", testGetDeviceModelDescription),
        ("testGetDeviceModelDescriptionResponse", testGetDeviceModelDescriptionResponse),
        ("testGetManufacturerLabel", testGetManufacturerLabel),
        ("testGetManufacturerLabelResponse", testGetManufacturerLabelResponse),
        ("testGetDeviceLabel", testGetDeviceLabel),
        ("testGetDeviceLabelResponse", testGetDeviceLabelResponse),
        ("testSetDeviceLabel", testSetDeviceLabel),
        ("testSetDeviceLabelResponse", testSetDeviceLabelResponse),
        ("testGetFactoryDefaults", testGetFactoryDefaults),
        ("testGetFactoryDefaultsResponse", testGetFactoryDefaultsResponse),
        ("testSetFactoryDefaults", testSetFactoryDefaults),
        ("testSetFactoryDefaultsResponse", testSetFactoryDefaultsResponse),
        ("testGetLanguageCapabilities", testGetLanguageCapabilities),
        ("testGetLanguageCapabilitiesResponse", testGetLanguageCapabilitiesResponse),
        ("testGetLanguage", testGetLanguage),
        ("testGetLanguageResponse", testGetLanguageResponse),
        ("testSetLanguage", testSetLanguage),
        ("testSetLanguageResponse", testSetLanguageResponse),
        ("testGetSoftwareVersionLabel", testGetSoftwareVersionLabel),
        ("testGetSoftwareVersionLabelResponse", testGetSoftwareVersionLabelResponse),
        ("testGetBootSoftwareVersionID", testGetBootSoftwareVersionID),
        ("testGetBootSoftwareVersionIDResponse", testGetBootSoftwareVersionIDResponse),
        ("testGetBootSoftwareVersionLabel", testGetBootSoftwareVersionLabel),
        ("testGetBootSoftwareVersionLabelResponse", testGetBootSoftwareVersionLabelResponse),
        ("testGetDMX512Personality", testGetDMX512Personality),
        ("testGetDMX512PersonalityResponse", testGetDMX512PersonalityResponse),
        ("testSetDMX512Personality", testSetDMX512Personality),
        ("testSetDMX512PersonalityResponse", testSetDMX512PersonalityResponse),
        ("testGetDMX512PersonalityDescription", testGetDMX512PersonalityDescription),
        ("testGetDMX512PersonalityDescriptionResponse", testGetDMX512PersonalityDescriptionResponse),
        ("testGetDMX512StartingAddress", testGetDMX512StartingAddress),
        ("testGetDMX512StartingAddressResponse", testGetDMX512StartingAddressResponse),
        ("testSetDMX512StartingAddress", testSetDMX512StartingAddress),
        ("testSetDMX512StartingAddressResponse", testSetDMX512StartingAddressResponse),
        ("testGetSlotInfo", testGetSlotInfo),
        ("testGetSlotInfoResponse", testGetSlotInfoResponse),
        ("testGetSlotDescription", testGetSlotDescription),
        ("testGetSlotDescriptionResponse", testGetSlotDescriptionResponse),
        ("testGetDefaultSlotValue", testGetDefaultSlotValue),
        ("testGetDefaultSlotValueResponse", testGetDefaultSlotValueResponse),
        ("testGetSensorDefinition", testGetSensorDefinition),
        ("testGetSensorDefinitionResponse", testGetSensorDefinitionResponse),
        ("testGetSensor", testGetSensor),
        ("testGetSensorResponse", testGetSensorResponse),
        ("testSetSensor", testSetSensor),
        ("testSetSensorResponse", testSetSensorResponse),
        ("testRecordSensors", testRecordSensors),
        ("testRecordSensorsResponse", testRecordSensorsResponse),
        ("testGetDeviceHours", testGetDeviceHours),
        ("testGetDeviceHoursResponse", testGetDeviceHoursResponse),
        ("testSetDeviceHours", testSetDeviceHours),
        ("testSetDeviceHoursResponse", testSetDeviceHoursResponse),
        ("testGetLampHours", testGetLampHours),
        ("testGetLampHoursResponse", testGetLampHoursResponse),
        ("testSetLampHours", testSetLampHours),
        ("testSetLampHoursResponse", testSetLampHoursResponse),
        ("testGetLampStrikes", testGetLampStrikes),
        ("testGetLampStrikesResponse", testGetLampStrikesResponse),
        ("testSetLampStrikes", testSetLampStrikes),
        ("testSetLampStrikesResponse", testSetLampStrikesResponse),
        ("testGetLampState", testGetLampState),
        ("testGetLampStateResponse", testGetLampStateResponse),
        ("testSetLampState", testSetLampState),
        ("testSetLampStateResponse", testSetLampStateResponse),
        ("testGetLampOnMode", testGetLampOnMode),
        ("testGetLampOnModeResponse", testGetLampOnModeResponse),
        ("testSetLampOnMode", testSetLampOnMode),
        ("testSetLampOnModeResponse", testSetLampOnModeResponse),
        ("testGetDevicePowerCycles", testGetDevicePowerCycles),
        ("testGetDevicePowerCyclesResponse", testGetDevicePowerCyclesResponse),
        ("testSetDevicePowerCycles", testSetDevicePowerCycles),
        ("testSetDevicePowerCyclesResponse", testSetDevicePowerCyclesResponse),
        ("testGetDisplayInvert", testGetDisplayInvert),
        ("testGetDisplayInvertResponse", testGetDisplayInvertResponse),
        ("testSetDisplayInvert", testSetDisplayInvert),
        ("testSetDisplayInvertResponse", testSetDisplayInvertResponse),
        ("testGetDisplayLevel", testGetDisplayLevel),
        ("testGetDisplayLevelResponse", testGetDisplayLevelResponse),
        ("testSetDisplayLevel", testSetDisplayLevel),
        ("testSetDisplayLevelResponse", testSetDisplayLevelResponse),
        ("testGetPanInvert", testGetPanInvert),
        ("testGetPanInvertResponse", testGetPanInvertResponse),
        ("testSetPanInvert", testSetPanInvert),
        ("testSetPanInvertResponse", testSetPanInvertResponse),
        ("testGetTiltInvert", testGetTiltInvert),
        ("testGetTiltInvertResponse", testGetTiltInvertResponse),
        ("testSetTiltInvert", testSetTiltInvert),
        ("testSetTiltInvertResponse", testSetTiltInvertResponse),
        ("testGetPanTiltSwap", testGetPanTiltSwap),
        ("testGetPanTiltSwapResponse", testGetPanTiltSwapResponse),
        ("testSetPanTiltSwap", testSetPanTiltSwap),
        ("testSetPanTiltSwapResponse", testSetPanTiltSwapResponse),
        ("testGetDeviceRealTimeClock", testGetDeviceRealTimeClock),
        ("testGetDeviceRealTimeClockResponse", testGetDeviceRealTimeClockResponse),
        ("testSetDeviceRealTimeClock", testSetDeviceRealTimeClock),
        ("testSetDeviceRealTimeClockResponse", testSetDeviceRealTimeClockResponse),
        ("testGetIdentifyDevice", testGetIdentifyDevice),
        ("testGetIdentifyDeviceResponse", testGetIdentifyDeviceResponse),
        ("testSetIdentifyDevice", testSetIdentifyDevice),
        ("testSetIdentifyDeviceResponse", testSetIdentifyDeviceResponse),
    ]
    
    func testDataCheckSum() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x30, 0x01, 0x04, 0x06 , 0x6A])
        XCTAssertEqual(Checksum(data: data.prefix(data.count - 2)), 0x066A)
        XCTAssertEqual(Checksum(rawValue: 0x066A).description, "0x066A")
    }
    
    func testQueueMessage() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x20, 0x01, 0x04, 0x06 , 0x5A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 0x01,
            messageCount: 0x00,
            subDevice: .root,
            messageData: .getQueueMessage(.init(status: .error))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .queuedMessage)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetStatusMessages() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x30, 0x01, 0x04, 0x06 , 0x6A])
                
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 0x01,
            messageCount: 0x00,
            subDevice: .root,
            messageData: .getStatusMessages(.init(status: .error))
        )
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .statusMessages)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssertEqual(packet.data.count, 27)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.checksum, 0x066A)
        XCTAssertEqual(packet.messageLength, 25)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        
        XCTAssertEqual(packet, decodedPacket)
    }
    
    func testGetStatusMessagesResponse() {
        
        let data = Data([0xCC, 0x01, 0x33, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x08, 0x00, 0x00, 0x21, 0x00, 0x30, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x50, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x00, 0x09 , 0x96])
        
        let parameterData = Data([0x21, 0x00, 0x30, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x50, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x00])
        
        let statusMessageResponse1 = StatusMessage(
            subDeviceID: .root,
            statusType: .none,
            statusMessageID: .ready)
        
        let statusMessageResponse3 = StatusMessage(
            subDeviceID: SubDevice(rawValue: 0x01),
            statusType: .none,
            statusMessageID: .notReady)
        
        let statusMessageResponse2 = StatusMessage(
            subDeviceID: SubDevice(rawValue: 0x02),
            statusType: .getLastMessage,
            statusMessageID: .ready,
            dataValue1: SlotID.undenifed.rawValue,
            dataValue2: 0)
        
        let statusMessages = [statusMessageResponse1, statusMessageResponse2, statusMessageResponse3]
        
        XCTAssertNotNil(statusMessageResponse1.description)
        XCTAssertNotNil(statusMessageResponse2.description)
        XCTAssertNotNil(statusMessageResponse3.description)
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgementTimer,
            messageCount: 8,
            subDevice: .root,
            messageData: .getStatusMessagesResponse(.init(statusMessage: statusMessages))
        )
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .statusMessages)
        XCTAssertEqual(packet.messageData.parameterDataLength, statusMessages.map{ $0.data.count }.reduce(0, +))
        
        XCTAssertEqual(packet.data, data)
        XCTAssertEqual(packet.data.count, 53)
        XCTAssertEqual(packet.messageData.data, parameterData)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.checksum, 0x0996)
        XCTAssertEqual(packet.messageLength, 51)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        
        XCTAssertEqual(packet, decodedPacket)
    }
    
    func testGetStatusIDDescription() {
        
        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x31, 0x02, 0x00, 0x50, 0x06, 0xB9])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getStatusIDDescription(.init(statusID: StatusMessageID.ready))
        )
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .statusIdDescription)
        XCTAssertEqual(packet.messageData.parameterDataLength, 2)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetStatusIDDescriptionResponse() {
        
        let data = Data([0xCC, 0x01, 0x24, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x31, 0x0C, 0x44, 0x6F, 0x75, 0x73, 0x65, 0x72, 0x20, 0x72, 0x65, 0x61, 0x64, 0x79, 0x0B, 0x24])
        
        let statusMessage = StatusMessage(
            subDeviceID: .root,
            statusType: .none,
            statusMessageID: .ready,
            dataValue1: SlotID.douser.rawValue
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: ResponseType.acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getStatusIDDescriptionResponse(.init(response: statusMessage.description))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .statusIdDescription)
        XCTAssertEqual(packet.messageData.parameterDataLength, statusMessage.description.count)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testClearStatusID() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x32, 0x00, 0x06, 0x76])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .clearStatusID
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .clearStatusId)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 26)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testClearStatusIDResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0x32, 0x00, 0x06, 0x76])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .clearStatusIDResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .clearStatusId)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 26)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        XCTAssertEqual(packet.messageData.data, messageData.data)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSubDeviceStatusReportingThreshold() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x33, 0x00, 0x06, 0x67])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSubDeviceStatusReportingThreshold
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .subDeviceStatusReport)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 26)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSubDeviceStatusReportingThresholdResponse() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x33, 0x01, 0x00, 0x06, 0x69])

        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSubDeviceStatusReportingThresholdResponse(.init(status: .none))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .subDeviceStatusReport)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 27)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetSubDeviceStatusReportingThreshold() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x33, 0x01, 0x01, 0x06, 0x7A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setSubDeviceStatusReportingThreshold(.init(status: .getLastMessage))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .subDeviceStatusReport)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 27)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetSubDeviceStatusReportingThresholdResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0x33, 0x00, 0x06, 0x77])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setSubDeviceStatusReportingThresholdResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .subDeviceStatusReport)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 26)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSupportedParameters() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x50, 0x00, 0x06, 0x84])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSupportedParameters
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .supportedParameters)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 26)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSupportedParametersResponse() {
        
        let data = Data([0xCC, 0x01, 0x1E, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x03, 0x00, 0x00, 0x00, 0x21, 0x00, 0x50, 0x06, 0x10, 0x10, 0x10, 0x30, 0x00, 0x60, 0x07, 0x53])
        
        let parameterIDs: [ParameterID] = [.powerState, .capturePreset, .deviceInfo]
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgementOverflow,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSupportedParametersResponse(.init(parameterIDs: parameterIDs))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .supportedParameters)
        XCTAssertEqual(packet.messageData.parameterDataLength, parameterIDs.map{ $0.data.count }.reduce(0, +))
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        XCTAssertEqual(packet.data.count, 32)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetParameterDescription() {
        
        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x51, 0x02, 0x80, 0x00, 0x07, 0x09])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getParameterDescription(.init(parameterID: ParameterID(rawValue: 0x8000)))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .parameterDescription)
        XCTAssertEqual(packet.messageData.parameterDataLength, 2)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetParameterDescriptionResponse() {
        
        let data = Data([0xCC, 0x01, 0x3E, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x51, 0x26, 0x80, 0x00, 0x00, 0x01, 0x03, 0x00, 0x1C, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x52, 0x61, 0x6E, 0x64, 0x6F, 0x6D, 0x20, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x0E, 0xAC])
        
        let parameterDescription = ParameterDescription(
            pidRequested: ParameterID(rawValue: 0x8000),
            pldSize: 0,
            dataType: .bitField,
            commandClass: .getSet,
            unit: .byte,
            prefix: .mega,
            minValidValue: 0,
            maxValidValue: 256,
            maxDefaultValue: 256,
            description: "Random description"
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getParameterDescriptionResponse(.init(parameterDescription: parameterDescription))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .parameterDescription)
        XCTAssertEqual(packet.messageData.parameterDataLength, 20 + parameterDescription.description.rawValue.count)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceInfo() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00, 0x06, 0x94])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceInfo
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .deviceInfo)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceInfoResponse() {
        
        let data = Data([0xCC, 0x01, 0x2B, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x60, 0x13, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x08, 0xBA])
        
        let deviceInfo = DeviceInfo(
            protocolVersion: .v1_0,
            deviceModelID: .zero,
            productCategory: .notDeclared,
            softwareVersionID: .zero,
            dmx512Footprint: .nullStartCode,
            dmx512Personality: DMX512Personality(current: 1, total: 0),
            dmx512StartAddress: .zero,
            subDeviceCount: .zero,
            sensorCount: .zero
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceInfoResponse(.init(deviceInfo: deviceInfo))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .deviceInfo)
        XCTAssertEqual(packet.messageData.parameterDataLength, 19)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetProductDetailIDList() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x70, 0x00, 0x06, 0xA4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getProductDetailIDList
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .productDetail)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetProductDetailIDListResponse() {
        
        let data = Data([0xCC, 0x01, 0x22, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x03, 0x00, 0x00, 0x00, 0x21, 0x00, 0x70, 0x0A, 0x00, 0x01, 0x0A, 0x01, 0x02, 0x00, 0x03, 0x03, 0x04, 0x03, 0x06, 0xD6])
        
        let productDetailIDs: [ProductDetail] = [.arc, .battery, .video , .co2, .pwm]
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgementOverflow,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getProductDetailIDListResponse(.init(productDetailIDs: productDetailIDs))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .productDetail)
        XCTAssertEqual(packet.messageData.parameterDataLength, productDetailIDs.map{ $0.data.count }.reduce(0, +))
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceModelDescription() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x80, 0x00, 0x06, 0xB4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceModelDescription
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .deviceModelDescription)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceModelDescriptionResponse() {
        
        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x80, 0x20, 0x44, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x20, 0x6C, 0x69, 0x6D, 0x69, 0x74, 0x65, 0x64, 0x20, 0x75, 0x70, 0x20, 0x74, 0x6F, 0x20, 0x33, 0x32, 0x20, 0x63, 0x68, 0x61, 0x12, 0x59])
        
        let modelDescription:TextDescription = "Description limited up to 32 characters"
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceModelDescriptionResponse(.init(modelDescription: modelDescription))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .deviceModelDescription)
        XCTAssertEqual(packet.messageData.parameterDataLength, modelDescription.rawValue.count)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetManufacturerLabel() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x81, 0x00, 0x06, 0xB5])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getManufacturerLabel
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .manufacturerLabel)
        XCTAssertEqual(packet.messageData.parameterDataLength,0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetManufacturerLabelResponse() {
        
        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x81, 0x20, 0x44, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x20, 0x6C, 0x69, 0x6D, 0x69, 0x74, 0x65, 0x64, 0x20, 0x75, 0x70, 0x20, 0x74, 0x6F, 0x20, 0x33, 0x32, 0x20, 0x63, 0x68, 0x61, 0x12, 0x5A])
        
        let modelDescription:TextDescription = "Description limited up to 32 characters"
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getManufacturerLabelResponse(.init(manufacturerName: modelDescription))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .manufacturerLabel)
        XCTAssertEqual(packet.messageData.parameterDataLength, modelDescription.rawValue.count)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceLabel() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x82, 0x00, 0x06, 0xB6])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceLabel
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .deviceLabel)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceLabelResponse() {
        
        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x82, 0x20, 0x41, 0x53, 0x43, 0x49, 0x49, 0x20, 0x74, 0x65, 0x78, 0x74, 0x20, 0x6C, 0x61, 0x62, 0x65, 0x6C, 0x2E, 0x20, 0x55, 0x70, 0x20, 0x74, 0x6F, 0x20, 0x33, 0x32, 0x20, 0x63, 0x68, 0x61, 0x72, 0x61, 0x11, 0x1E])
        
        let deviceLabel:TextDescription = "ASCII text label. Up to 32 characters."
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceLabelResponse(.init(deviceLabel: deviceLabel))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .deviceLabel)
        XCTAssertEqual(packet.messageData.parameterDataLength, deviceLabel.rawValue.count)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDeviceLabel() {
        
        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x82, 0x20, 0x41, 0x53, 0x43, 0x49, 0x49, 0x20, 0x74, 0x65, 0x78, 0x74, 0x20, 0x6C, 0x61, 0x62, 0x65, 0x6C, 0x2E, 0x20, 0x55, 0x70, 0x20, 0x74, 0x6F, 0x20, 0x33, 0x32, 0x20, 0x63, 0x68, 0x61, 0x72, 0x61, 0x11, 0x2E])
        
        let deviceLabel:TextDescription = "ASCII text label. Up to 32 characters."
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDeviceLabel(.init(deviceLabel: deviceLabel))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .deviceLabel)
        XCTAssertEqual(packet.messageData.parameterDataLength, deviceLabel.rawValue.count)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDeviceLabelResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0x82, 0x00, 0x06, 0xC6])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDeviceLabelResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .deviceLabel)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetFactoryDefaults() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x90, 0x00, 0x06, 0xC4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getFactoryDefaults
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .factoryDefaults)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetFactoryDefaultsResponse() {

        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x90, 0x01, 0x00, 0x06, 0xC6])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getFactoryDefaultsResponse(.init(response: false))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .factoryDefaults)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetFactoryDefaults() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x90, 0x00, 0x06, 0xD4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setFactoryDefaults
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .factoryDefaults)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetFactoryDefaultsResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0x90, 0x00, 0x06, 0xD4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setFactoryDefaultsResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .factoryDefaults)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLanguageCapabilities() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xA0, 0x00, 0x06, 0xD4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getLanguageCapabilities
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .languageCapabilities)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLanguageCapabilitiesResponse() {

        let data = Data([0xCC, 0x01, 0x26, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xA0, 0x0E, 0x41, 0x5A, 0x44, 0x5A, 0x48, 0x5A, 0x55, 0x5A, 0x5A, 0x41, 0x5A, 0x48, 0x5A, 0x55, 0x0B, 0x66])
        
        let strings = Locale.isoLanguageCodes.filter{ $0.count == 2 && $0.contains("z")}.map{ $0.uppercased() }
        
        dump(strings)
        
        let languageCodes: [LanguageCode] = strings.compactMap{ LanguageCode(stringLiteral: $0) }
        
        dump(languageCodes.description)
        
        XCTAssertEqual(strings.count, languageCodes.count)
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getLanguageCapabilitiesResponse(.init(languageCodes: languageCodes))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .languageCapabilities)
        XCTAssertEqual(packet.messageData.parameterDataLength, languageCodes.map{ $0.data.count }.reduce(0, +))
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLanguage() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xB0, 0x00, 0x06, 0xE4])

        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getLanguage
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .language)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLanguageResponse() {
        
        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xB0, 0x02, 0x45, 0x4E, 0x07, 0x7B])

        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getLanguageResponse(.init(languageCode: .en))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .language)
        XCTAssertEqual(packet.messageData.parameterDataLength, 2)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLanguage() {

        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0xB0, 0x02, 0x00, 0x00, 0x06, 0xF8])

        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setLanguage(.init(languageCode: .reset))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .language)
        XCTAssertEqual(packet.messageData.parameterDataLength, 2)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLanguageResponse() {
 
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0xB0, 0x00, 0x06, 0xF4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setLanguageResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .language)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSoftwareVersionLabel() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xC0, 0x00, 0x06, 0xF4])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getSoftwareVersionLabel
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .softwareVersionLabel)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSoftwareVersionLabelResponse() {

        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xC0, 0x20, 0x41, 0x53, 0x43, 0x49, 0x49, 0x20, 0x74, 0x65, 0x78, 0x74, 0x20, 0x53, 0x6F, 0x66, 0x74, 0x77, 0x61, 0x72, 0x65, 0x20, 0x56, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x20, 0x4C, 0x61, 0x62, 0x65, 0x12, 0x87])
        
        let versionLabel:TextDescription = "ASCII text Software Version Label Up to 32 characters."
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getSoftwareVersionLabelResponse(.init(versionLabel: versionLabel))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .softwareVersionLabel)
        XCTAssertEqual(packet.messageData.parameterDataLength, versionLabel.rawValue.count)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetBootSoftwareVersionID() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xC1, 0x00, 0x06, 0xF5])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getBootSoftwareVersionID
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .bootSoftwareVersionId)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetBootSoftwareVersionIDResponse() {

        let data = Data([0xCC, 0x01, 0x1C, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xC1, 0x04, 0x00, 0x00, 0x07, 0xE4, 0x07, 0xE8])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getBootSoftwareVersionIDResponse(.init(versionID: 2020))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .bootSoftwareVersionId)
        XCTAssertEqual(packet.messageData.parameterDataLength, 4)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetBootSoftwareVersionLabel() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xC2, 0x00, 0x06, 0xF6])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getBootSoftwareVersionLabel
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .bootSoftwareVersionLabel)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetBootSoftwareVersionLabelResponse() {

        let data = Data([0xCC, 0x01, 0x38, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xC2, 0x20, 0x41, 0x53, 0x43, 0x49, 0x49, 0x20, 0x74, 0x65, 0x78, 0x74, 0x20, 0x53, 0x6F, 0x66, 0x74, 0x77, 0x61, 0x72, 0x65, 0x20, 0x42, 0x6F, 0x6F, 0x74, 0x20, 0x56, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x12, 0xA9])
        
        let versionLabel:TextDescription = "ASCII text Software Boot Version Label Up to 32 characters."
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getBootSoftwareVersionLabelResponse(.init(versionLabel: versionLabel))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .bootSoftwareVersionLabel)
        XCTAssertEqual(packet.messageData.parameterDataLength, versionLabel.rawValue.count)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDMX512Personality() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xE0, 0x00, 0x07, 0x14])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDMX512Personality
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .dmxPersonality)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDMX512PersonalityResponse() {

        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xE0, 0x02, 0x01, 0x01, 0x07, 0x1A])
        
        
        
        let dmxPersonality = DMX512Personality.init(current: 1, total: 1)
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDMX512PersonalityResponse(.init(dmxPersonality: dmxPersonality))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .dmxPersonality)
        XCTAssertEqual(packet.messageData.parameterDataLength, 2)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDMX512Personality() {

        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0xE0, 0x01, 0x01, 0x07, 0x27])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDMX512Personality(.init(personality: 1))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .dmxPersonality)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDMX512PersonalityResponse() {

        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0xE0, 0x00, 0x07, 0x24])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDMX512PersonalityResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .dmxPersonality)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDMX512PersonalityDescription() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xE1, 0x01, 0x01, 0x07, 0x18])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDMX512PersonalityDescription(.init(personality: 1))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .dmxPersonalityDescription)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDMX512PersonalityDescriptionResponse() {

        let data = Data([0xCC, 0x01, 0x3B, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xE1, 0x23, 0x01, 0x02, 0x00, 0x41, 0x53, 0x43, 0x49, 0x49, 0x20, 0x54, 0x65, 0x78, 0x74, 0x20, 0x46, 0x69, 0x65, 0x6C, 0x64, 0x20, 0x6F, 0x66, 0x20, 0x76, 0x61, 0x72, 0x69, 0x61, 0x62, 0x6C, 0x65, 0x20, 0x73, 0x69, 0x7A, 0x12, 0x61])
        
        
        let personalityDescription = DMX512PersonalityDescription(
            personality: 1,
            slots: 512,
            description: "ASCII Text Field of variable size"
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDMX512PersonalityDescriptionResponse(.init(description: personalityDescription))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .dmxPersonalityDescription)
        XCTAssertEqual(packet.messageData.parameterDataLength, 3 + personalityDescription.description.rawValue.count)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDMX512StartingAddress() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0xF0, 0x00, 0x07, 0x24])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDMX512StartingAddress
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .dmxStartAddress)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDMX512StartingAddressResponse() {

        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0xF0, 0x02, 0xFF, 0xFF, 0x09, 0x26])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDMX512StartingAddressResponse(.init(address: UInt16.max))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .dmxStartAddress)
        XCTAssertEqual(packet.messageData.parameterDataLength, 2)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDMX512StartingAddress() {

        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0xF0, 0x02, 0x02, 0x00, 0x07, 0x3A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDMX512StartingAddress(.init(address: 512))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .dmxStartAddress)
        XCTAssertEqual(packet.messageData.parameterDataLength, 2)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDMX512StartingAddressResponse() {

        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0xF0, 0x00, 0x07, 0x34])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDMX512StartingAddressResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .dmxStartAddress)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSlotInfo() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x01, 0x20, 0x00, 0x06, 0x55])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getSlotInfo
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .slotInfo)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSlotInfoResponse() {

        let data = Data([0xCC, 0x01, 0x27, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x20, 0x0F, 0x04, 0x08, 0x00, 0x00, 0x00, 0x03, 0x04, 0x03, 0x00, 0x00, 0x04, 0x01, 0xFF, 0x00, 0x00, 0x07, 0x8D])
        
        let slotInfo1 = SlotInfo(
            offset: SlotOffset(
                slotID: .douser,
                slotType: .primary),
            slotLabel: .min
        )
        
        let slotInfo2 = SlotInfo(
            offset: SlotOffset(
                slotID: .effectsWheel,
                slotType: .secSpeed),
            slotLabel: .min
        )
        
        let slotInfo3 = SlotInfo(
            offset: SlotOffset(
                slotID: .beamSizeIris,
                slotType: .secUndenifed),
            slotLabel: .min
        )
        
        let slotInfo = [slotInfo1, slotInfo2, slotInfo3]
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getSlotInfoResponse(.init(slotInfo: slotInfo))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .slotInfo)
        XCTAssertEqual(packet.messageData.parameterDataLength, slotInfo.map{ $0.data.count }.reduce(0, +))
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSlotDescription() {
        
        let data = Data([0xCC, 0x01, 0x1A, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x01, 0x21, 0x02, 0x04, 0x08, 0x06, 0x66])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSlotDescription(.init(slotRequested: .douser))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .slotDescription)
        XCTAssertEqual(packet.messageData.parameterDataLength, 2)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSlotDescriptionResponse() {
        
        let data = Data([0xCC, 0x01, 0x20, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x21, 0x08, 0x04, 0x08, 0x44, 0x6F, 0x75, 0x73, 0x65, 0x72, 0x08, 0xE4])
        
        let slotDescription = SlotDescription(
            slotResquested: .douser,
            description: TextDescription(rawValue: SlotID.douser.description)
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getSlotDescriptionResponse(.init(slotDescription: slotDescription))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .slotDescription)
        XCTAssertEqual(packet.messageData.parameterDataLength, 2 + slotDescription.description.rawValue.count)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDefaultSlotValue() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x01, 0x22, 0x00, 0x06, 0x57])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getDefaultSlotValue
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .defaultSlotValue)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDefaultSlotValueResponse() {
        
        let data = Data([0xCC, 0x01, 0x21, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x03, 0x00, 0x00, 0x00, 0x21, 0x01, 0x22, 0x09, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0xFF, 0x00, 0x07, 0x6D])
        
        let slotOffset1 = SlotOffset(
            offsetField: 0,
            defaultSlotValue: 0
        )
        
        let slotOffset2 = SlotOffset(
            offsetField: 1,
            defaultSlotValue: 1
        )
        
        let slotOffset3 = SlotOffset(
            offsetField: 0x00FF,
            defaultSlotValue: 0
        )
        
        let slotOffsets = [slotOffset1, slotOffset2, slotOffset3]
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgementOverflow,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDefaultSlotValueResponse(.init(slotOffsets: slotOffsets))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .defaultSlotValue)
        XCTAssertEqual(packet.messageData.parameterDataLength, slotOffsets.map{ $0.data.count }.reduce(0, +))
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSensorDefinition() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x02, 0x00, 0x01, 0x01, 0x06, 0x39])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSensorDefinition(.init(sensorRequested: SensorNumber(rawValue: 1)))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .sensorDefinition)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSensorDefinitionResponse() {
        
        let data = Data([0xCC, 0x01, 0x45, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x02, 0x00, 0x2D, 0x01, 0x0D, 0x12, 0x14, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x03, 0x44, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x20, 0x5B, 0x56, 0x61, 0x72, 0x69, 0x61, 0x62, 0x6C, 0x65, 0x20, 0x30, 0x2D, 0x33, 0x32, 0x20, 0x63, 0x68, 0x61, 0x72, 0x73, 0x12, 0x03])
        
        let sensorDefinition = SensorDefinition(
            sensorRequested: SensorNumber(rawValue: 1),
            sensorType: SensorType.force,
            unit: SensorUnit.newton,
            prefix: SensorUnitPrefix.mega,
            rangeMinimumValue: 0,
            rangeMaximumValue: 512,
            normalMinimumValue: 0,
            normalMaximumValue: 512,
            recordedValueSupport: [.recordedValueSupported, .detectedValuesSupported],
            description: "Description [Variable 0-32 chars]"
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getSensorDefinitionResponse(.init(sensorDefinition: sensorDefinition))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .sensorDefinition)
        XCTAssertEqual(packet.messageData.parameterDataLength, sensorDefinition.dataLength)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSensor() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x02, 0x01, 0x01, 0x01, 0x06, 0x3A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getSensor(.init(sensorRequested: SensorNumber(rawValue: 1)))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .sensorValue)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetSensorResponse() {
        
        let data = Data([0xCC, 0x01, 0x21, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x02, 0x01, 0x09, 0x01, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0xCA])
        
        let sensorValue = SensorValue(
            sensorRequested: SensorNumber(rawValue: 1),
            presentValue: .min
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getSensorResponse(.init(sensorValue: sensorValue))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .sensorValue)
        XCTAssertEqual(packet.messageData.parameterDataLength, 9)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetSensor() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x02, 0x01, 0x01, 0x01, 0x06, 0x4A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setSensor(.init(sensorRequested: SensorNumber(rawValue: 1)))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .sensorValue)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetSensorResponse() {
        
        let data = Data([0xCC, 0x01, 0x21, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x02, 0x01, 0x09, 0x01, 0x80, 0x00, 0x00, 0x00, 0x7F, 0xFF, 0x00, 0x01, 0x08, 0x59])
        
        let sensorValue = SensorValue(
            sensorRequested: 1,
            presentValue: .min,
            lowestDetectedValue: .zero,
            highestDetectedValue: .max,
            recordedValue: 1
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setSensorResponse(.init(sensorValue: sensorValue))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .sensorValue)
        XCTAssertEqual(packet.messageData.parameterDataLength, 9)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testRecordSensors() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x02, 0x02, 0x01, 0x01, 0x06, 0x4B])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .recordSensors(.init(sensorNumber: SensorNumber(rawValue: 1)))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .recordSensors)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testRecordSensorsResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x02, 0x02, 0x00, 0x06, 0x48])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .recordSensorsResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .recordSensors)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceHours() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x04, 0x00, 0x00, 0x06, 0x38])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getDeviceHours
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .deviceHours)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceHoursResponse() {
        
        let data = Data([0xCC, 0x01, 0x1C, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x18, 0x06, 0x58])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getDeviceHoursResponse(.init(deviceHours: 24))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .deviceHours)
        XCTAssertEqual(packet.messageData.parameterDataLength, 4)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDeviceHours() {
        
        let data = Data([0xCC, 0x01, 0x1C, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x18, 0x06, 0x68])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setDeviceHours(.init(deviceHours: 24))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .deviceHours)
        XCTAssertEqual(packet.messageData.parameterDataLength, 4)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDeviceHoursResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x04, 0x00, 0x00, 0x06, 0x48])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setDeviceHoursResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .deviceHours)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLampHours() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x04, 0x01, 0x00, 0x06, 0x39])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getLampHours
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .lampHours)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLampHoursResponse() {
        
        let data = Data([0xCC, 0x01, 0x1C, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x04, 0x01, 0x04, 0x00, 0x00, 0x00, 0x18, 0x06, 0x59])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .getLampHoursResponse(.init(lampHours: 24))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .lampHours)
        XCTAssertEqual(packet.messageData.parameterDataLength, 4)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLampHours() {
        
        let data = Data([0xCC, 0x01, 0x1C, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x04, 0x01, 0x04, 0xFF, 0xFF, 0xFF, 0xFF, 0x0A, 0x4D])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setLampHours(.init(lampHours: .max))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .lampHours)
        XCTAssertEqual(packet.messageData.parameterDataLength, 4)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLampHoursResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x04, 0x01, 0x00, 0x06, 0x49])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: .zero,
            subDevice: .root,
            messageData: .setLampHoursResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .lampHours)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLampStrikes() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x04, 0x02, 0x00, 0x06, 0x3A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getLampStrikes
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .lampStrikes)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLampStrikesResponse() {
        
        let data = Data([0xCC, 0x01, 0x1C, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x04, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x06, 0x42])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getLampStrikesResponse(.init(lampStrikes: .min))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .lampStrikes)
        XCTAssertEqual(packet.messageData.parameterDataLength, 4)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLampStrikes() {
        
        let data = Data([0xCC, 0x01, 0x1C, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x04, 0x02, 0x04, 0xFF, 0xFF, 0xFF, 0xFF, 0x0A, 0x4E])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setLampStrikes(.init(lampStrikes: .max))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .lampStrikes)
        XCTAssertEqual(packet.messageData.parameterDataLength, 4)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLampStrikesResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x04, 0x02, 0x00, 0x06, 0x4A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setLampStrikesResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .lampStrikes)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLampState() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x04, 0x03, 0x00, 0x06, 0x3B])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getLampState
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .lampState)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLampStateResponse() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x04, 0x03, 0x01, 0x01, 0x06, 0x3E])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getLampStateResponse(.init(lampState: .on))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .lampState)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLampState() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x04, 0x03, 0x01, 0x00, 0x06, 0x4D])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setLampState(.init(lampState: .off))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .lampState)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLampStateResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x04, 0x03, 0x00, 0x06, 0x4B])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setLampStateResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .lampState)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLampOnMode() {
    
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x04, 0x04, 0x00, 0x06, 0x3C])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getLampOnMode
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .lampOnMode)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetLampOnModeResponse() {
    
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x04, 0x04, 0x01, 0x03, 0x06, 0x41])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getLampOnModeResponse(.init(lampMode: .afterCalibration))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .lampOnMode)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLampOnMode() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x04, 0x04, 0x01, 0x01, 0x06, 0x4F])
    
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setLampOnMode(.init(lampMode: .dmx))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .lampOnMode)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetLampOnModeResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x04, 0x04, 0x00, 0x06, 0x4C])
    
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setLampOnModeResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .lampOnMode)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDevicePowerCycles() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x04, 0x05, 0x00, 0x06, 0x3D])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getDevicePowerCycles
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .devicePowerCycles)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDevicePowerCyclesResponse() {
        
        let data = Data([0xCC, 0x01, 0x1C, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x04, 0x05, 0x04, 0xFF, 0xFF, 0xFF, 0xFF, 0x0A, 0x41])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getDevicePowerCyclesResponse(.init(powerCyclesCount: .max))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .devicePowerCycles)
        XCTAssertEqual(packet.messageData.parameterDataLength, 4)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDevicePowerCycles() {
        
        let data = Data([0xCC, 0x01, 0x1C, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x04, 0x05, 0x04, 0x00, 0x00, 0x00, 0x00, 0x06, 0x55])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setDevicePowerCycles(.init(powerCyclesCount: .zero))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .devicePowerCycles)
        XCTAssertEqual(packet.messageData.parameterDataLength, 4)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDevicePowerCyclesResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x04, 0x05, 0x00, 0x06, 0x4D])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setDevicePowerCyclesResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .devicePowerCycles)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDisplayInvert() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x05, 0x00, 0x00, 0x06, 0x39])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getDisplayInvert
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .displayInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDisplayInvertResponse() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x05, 0x00, 0x01, 0x02, 0x06, 0x3D])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getDisplayInvertResponse(.init(displayInvertSetting: .auto))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .displayInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDisplayInvert() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x05, 0x00, 0x01, 0x01, 0x06, 0x4C])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setDisplayInvert(.init(displayInvertSetting: .on))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .displayInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDisplayInvertResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x05, 0x00, 0x00, 0x06, 0x49])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setDisplayInvertResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .displayInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDisplayLevel() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x05, 0x01, 0x00, 0x06, 0x3A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getDisplayLevel
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .displayLevel)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDisplayLevelResponse() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x05, 0x01, 0x01, 0x00, 0x06, 0x3C])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getDisplayLevelResponse(.init(displayLevel: 0))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .displayLevel)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDisplayLevel() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x05, 0x01, 0x01, 0xFF, 0x07, 0x4B])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setDisplayLevel(.init(displayLevel: .max))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .displayLevel)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDisplayLevelResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x05, 0x01, 0x00, 0x06, 0x4A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setDisplayLevelResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .displayLevel)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetPanInvert() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x06, 0x00, 0x00, 0x06, 0x3A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getPanInvert
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .panInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetPanInvertResponse() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x06, 0x00, 0x01, 0x01, 0x06, 0x3D])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getPanInvertResponse(.init(panInvert: true))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .panInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetPanInvert() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x06, 0x00, 0x01, 0x00, 0x06, 0x4C])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setPanInvert(.init(panInvert: false))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .panInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetPanInvertResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x06, 0x00, 0x00, 0x06, 0x4A])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setPanInvertResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .panInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetTiltInvert() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x06, 0x01, 0x00, 0x06, 0x3B])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getTiltInvert
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .tiltInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetTiltInvertResponse() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x06, 0x01, 0x01, 0x00, 0x06, 0x3D])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getTiltInvertResponse(.init(tiltInvert: false))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .tiltInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetTiltInvert() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x06, 0x01, 0x01, 0x01, 0x06, 0x4E])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setTiltInvert(.init(tiltInvert: true))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .tiltInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetTiltInvertResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x06, 0x01, 0x00, 0x06, 0x4B])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setTiltInvertResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .tiltInvert)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetPanTiltSwap() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x06, 0x02, 0x00, 0x06, 0x3C])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getPanTiltSwap
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .panTiltSwap)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetPanTiltSwapResponse() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x06, 0x02, 0x01, 0x01, 0x06, 0x3F])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getPanTiltSwapResponse(.init(panTiltSwap: true))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .panTiltSwap)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetPanTiltSwap() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x06, 0x02, 0x01, 0x00, 0x06, 0x4E])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setPanTiltSwap(.init(panTiltSwap: false))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .panTiltSwap)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetPanTiltSwapResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x06, 0x02, 0x00, 0x06, 0x4C])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setPanTiltSwapResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .panTiltSwap)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceRealTimeClock() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x06, 0x03, 0x00, 0x06, 0x3D])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getDeviceRealTimeClock
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .realTimeClock)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetDeviceRealTimeClockResponse() {
        
        let data = Data([0xCC, 0x01, 0x1F, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x06, 0x03, 0x07, 0x07, 0xD3, 0x01, 0x01, 0x00, 0x00, 0x00, 0x07, 0x27])
        
        let realTimeClock = RealTimeClock(
            year: .min,
            month: .min,
            day: .min,
            hour: .min,
            minute: .min,
            second: .min
        )
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getDeviceRealTimeClockResponse(.init(realTimeClock: realTimeClock))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .realTimeClock)
        XCTAssertEqual(packet.messageData.parameterDataLength, 7)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDeviceRealTimeClock() {
        
        let data = Data([0xCC, 0x01, 0x1F, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x06, 0x03, 0x07, 0x07, 0xE4, 0x04, 0x16, 0x13, 0x27, 0x36, 0x07, 0xD0])
        
        let realTimeClock = RealTimeClock(date: Date())
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setDeviceRealTimeClock(.init(realTimeClock: realTimeClock))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .realTimeClock)
        XCTAssertEqual(packet.messageData.parameterDataLength, 7)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetDeviceRealTimeClockResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x06, 0x03, 0x00, 0x06, 0x4D])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setDeviceRealTimeClockResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .realTimeClock)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetIdentifyDevice() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x10, 0x00, 0x00, 0x06, 0x44])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .getIdentifyDevice
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .get)
        XCTAssertEqual(packet.messageData.parameterID, .identifyDevice)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testGetIdentifyDeviceResponse() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x10, 0x00, 0x01, 0x01, 0x06, 0x47])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .getIdentifyDeviceResponse(.init(identifyDevice: true))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .getResponse)
        XCTAssertEqual(packet.messageData.parameterID, .identifyDevice)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetIdentifyDevice() {
        
        let data = Data([0xCC, 0x01, 0x19, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x10, 0x00, 0x01, 0x00, 0x06, 0x56])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            portID: 1,
            messageCount: 0,
            subDevice: .root,
            messageData: .setIdentifyDevice(.init(identifyDevice: false))
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .set)
        XCTAssertEqual(packet.messageData.parameterID, .identifyDevice)
        XCTAssertEqual(packet.messageData.parameterDataLength, 1)
        
        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let messageData = MessageDataBlock(data: packet.messageData.data)
            else { XCTFail("Could not parse Message Data Block"); return }
        dump(messageData)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
    
    func testSetIdentifyDeviceResponse() {
        
        let data = Data([0xCC, 0x01, 0x18, 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xCB, 0xA9, 0x87, 0x65, 0x43, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x10, 0x00, 0x00, 0x06, 0x54])
        
        let packet = RDM.Packet(
            destination: DeviceUID(rawValue: "1234:56789ABC")!,
            source: DeviceUID(rawValue: "CBA9:87654321")!,
            transaction: 0,
            responseType: .acknowledgement,
            messageCount: 0,
            subDevice: .root,
            messageData: .setIdentifyDeviceResponse
        )
        
        dump(packet)
        
        XCTAssertEqual(packet.messageData.commandClass, .setResponse)
        XCTAssertEqual(packet.messageData.parameterID, .identifyDevice)
        XCTAssertEqual(packet.messageData.parameterDataLength, 0)

        XCTAssertEqual(packet.data, data)
        XCTAssert(packet.isChecksumValid)
        
        guard let decodedPacket = RDM.Packet(data: data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedPacket)
        
        guard let decodedFromPacketData = RDM.Packet(data: packet.data)
            else { XCTFail("Could not parse packet"); return }
        XCTAssertEqual(packet, decodedFromPacketData)
    }
}
