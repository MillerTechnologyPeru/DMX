//
//  GetCommsStatusResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/23/20.
//

import Foundation

/**
 The COMMS_STATUS parameter is used to collect information that may be useful in analyzing the integrity of the communication system.

 A responder shall respond to a `GET_COMMAND` for this PID with a cumulative total of each error type in the response message defined below.
 Responders shall ignore any errors detected during the response period following a `DISC_UNIQUE_BRANCH` message, since it is expected that collisions may result in corrupted messages.
 
 The values for these fields shall be unsigned and not roll over when maximum value is reached.
 A responder shall clear all of the error totals to zero when receiving a `SET_COMMAND` for this PID.
 
 Status Collection Messages include messages used to retrieve deferred (queued) responses, device status and error information, and information regarding the RDM parameters supported by the device. Status Collection messages are normally addressed to Root Devices.
*/
public struct GetCommsStatusResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .communicationStatus }
    
    public let commStatus: CommsStatus
    
    // MARK: - Initialization
    
    public init(commStatus: CommsStatus) {
        self.commStatus = commStatus
    }
}

// MARK: - Data

public extension GetCommsStatusResponse {
    
    init?(data: Data) {
        guard data.count == CommsStatus.length, let commStatus = CommsStatus(data: data)
            else { return nil }
        self.init(commStatus: commStatus)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetCommsStatusResponse: DataConvertible {
    
    var dataLength: Int {
        return commStatus.dataLength
    }
    
    static func += (data: inout Data, value: GetCommsStatusResponse) {
        data += value.commStatus
    }
}
