//
//  GetPerformSelfTestResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/17/20.
//

import Foundation

/**
 The `PERFORM_SELFTEST` message is used to execute any built in Self-Test routine that may be present.
 The test may run continuously until receiving a `PERFORM_SELFTEST` with a `SELF_TEST_OFF` value, or may exit upon completion.
 
 The `GET_COMMAND` may be used to determine if any Self Tests are currently running.
 If any Self Tests are running the response flag shall be set to `0x01`.
 A Self Test operation may return pass/fail status or other information by queuing a Status Message response.
 
 The Parameter Data includes a value indicating the self-test to execute as shown in `Table A-10`.
 */
public struct GetPerformSelfTestResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .performSelfTest }
    
    public var selfTestActive: Bool
    
    // MARK: - Initialization
    
    public init(selfTestActive: Bool) {
        self.selfTestActive = selfTestActive
    }
}

// MARK: - Data

public extension GetPerformSelfTestResponse {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<Bool>.size,
              let response = Bool(byteValue: data[0])
            else { return nil }
        self.init(selfTestActive: response)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetPerformSelfTestResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<Bool>.size
    }
    
    static func += (data: inout Data, value: GetPerformSelfTestResponse) {
        data += value.selfTestActive.byteValue
    }
}
