//
//  SetPerformSelfTest.swift
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
public struct SetPerformSelfTest: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .performSelfTest }
    
    public var selfTest: SelfTest
    
    // MARK: - Initialization
    
    public init(selfTest: SelfTest) {
        self.selfTest = selfTest
    }
}

// MARK: - Data

public extension SetPerformSelfTest {
    
    init?(data: Data) {
        guard data.count == MemoryLayout<SelfTest>.size
            else { return nil }
        self.init(selfTest: SelfTest(rawValue: data[0]))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetPerformSelfTest: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<SelfTest>.size
    }
    
    static func += (data: inout Data, value: SetPerformSelfTest) {
        data += value.selfTest.rawValue
    }
}
