//
//  GetSelfTestDescription.swift
//  
//
//  Created by Jorge Loc Rubio on 4/17/20.
//

import Foundation

/**
 This parameter is used to get a descriptive ASCII text label for a given Self Test Operation.
 
 The label may be up to 32 characters.
 */
public struct GetSelfTestDescription: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .get }
    
    public static var parameterID: ParameterID { return .selfTestDescription }
    
    public var selfTestRequested: SelfTest
    
    // MARK: - Initialization
    
    public init(selfTestRequested: SelfTest) {
       self.selfTestRequested = selfTestRequested
    }
}

// MARK: - Data

public extension GetSelfTestDescription {
    
    internal static var length: Int { return MemoryLayout<SelfTest>.size }
    
    init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        self.init(selfTestRequested: SelfTest(rawValue: data[0]))
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetSelfTestDescription: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: GetSelfTestDescription) {
        data += value.selfTestRequested.rawValue
    }
}
