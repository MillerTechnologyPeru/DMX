//
//  StatusMessage.swift
//  
//
//  Created by Jorge Loc Rubio on 4/2/20.
//

import Foundation

/**
  Status Message
*/
public struct StatusMessage: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Sub Device ID
    public var subDeviceID: SubDevice

    /// Status Type
    public var statusType: StatusType
    
    /// Parameter Data
    public var statusMessageID: StatusMessageID
    
    /// Parameter Data
    public var dataValue1: UInt16
    
    /// Parameter Data
    public var dataValue2: UInt16
    
    // MARK: - Initialization
    
    public init(subDeviceID: SubDevice,
                statusType: StatusType,
                statusMessageID: StatusMessageID,
                dataValue1: UInt16 = 0,
                dataValue2: UInt16 = 0) {
        
        self.subDeviceID = subDeviceID
        self.statusType = statusType
        self.statusMessageID = statusMessageID
        self.dataValue1 = dataValue1
        self.dataValue2 = dataValue2
    }
}

// MARK: - Data

public extension StatusMessage {
    
    internal static var length: Int { return 9 }
    
    init?(data: Data) {
        guard data.count == StatusMessage.length
            else { return nil }
        self.subDeviceID = SubDevice(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1]))))
        self.statusType = StatusType(rawValue: data[2])
        self.statusMessageID = StatusMessageID(rawValue: UInt16(bigEndian: UInt16(bytes: (data[3], data[4]))))
        self.dataValue1 = UInt16(bigEndian: UInt16(bytes: (data[5], data[6])))
        self.dataValue2 = UInt16(bigEndian: UInt16(bytes: (data[7], data[8])))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension StatusMessage: DataConvertible {
    
    var dataLength: Int {
        return StatusMessage.length
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.subDeviceID.rawValue.bigEndian
        data += value.statusType.rawValue
        data += value.statusMessageID.rawValue.bigEndian
        data += value.dataValue1.bigEndian
        data += value.dataValue2.bigEndian
    }
}

// MARK: - CustomStringConvertible

extension StatusMessage: CustomStringConvertible {
    
    public var description: String {
        switch statusMessageID {
        case .calibrationFail: return "\(SlotID(rawValue: dataValue1).description) failed calibration"
        case .sensorNotFound: return "\(SlotID(rawValue: dataValue1).description) sensor not found"
        case .sensorAlwaysOn: return "\(SlotID(rawValue: dataValue1).description) sensor always on"
        case .lampDoused: return "Lamp doused"
        case .lampStrike: return "Lamp failed to strike"
        case .overTemp: return "Sensor \(Int(dataValue1)) over temp at \(Int(dataValue2)) degrees C)"
        case .underTemp: return "Sensor \(Int(dataValue1)) under temp at \(Int(dataValue2)) degrees C)"
        case .sensorOutOfRange: return "Sender \(dataValue1) out of range"
        case .overVoltagePhase: return "Phase \(Int(dataValue1)) over voltage at \(Int(dataValue2)) V."
        case .underVoltagePhase: return "Phase \(Int(dataValue1)) under voltage at \(Int(dataValue2)) V."
        case .overCurrent: return "Phase \(Int(dataValue1)) over current at \(Int(dataValue2)) A."
        case .underCurrent: return "Phase \(Int(dataValue1)) under current at \(Int(dataValue2)) A."
        case .phase: return "Phase \(Int(dataValue1)) is at \(Int(dataValue2)) degrees"
        case .phaseError: return "Phase \(Int(dataValue1)) Error."
        case .apms: return "\(Int(dataValue1)) Amps"
        case .volts: return "\(Int(dataValue1)) Volts"
        case .dimslotOccupied: return "No Dimmer"
        case .breakerTrip: return "Tripped Breaker"
        case .watts: return "\(Int(dataValue1)) Watts"
        case .dimmerFailure: return "Dimmer Failure"
        case .dimmerPanic: return "Panic Mode"
        case .ready: return "\(SlotID(rawValue: dataValue1)) ready"
        case .notReady: return "\(SlotID(rawValue: dataValue1)) not ready"
        case .lowFluid: return "\(SlotID(rawValue: dataValue1)) low fluid"
        default: return ""
        }
    }
}
