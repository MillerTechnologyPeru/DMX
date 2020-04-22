//
//  File.swift
//  
//
//  Created by Jorge Loc Rubio on 4/17/20.
//

import Foundation

/**
 This parameter is used to get a descriptive ASCII text label for a given Self Test Operation.
 
 The label may be up to 32 characters.
 */
public struct GetSelfTestDescriptionResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .selfTestDescription }
    
    public var selfTestDescription: SelfTestDescription
    
    // MARK: - Initialization
    
    public init(selfTestDescription: SelfTestDescription) {
       self.selfTestDescription = selfTestDescription
    }
}

// MARK: - Data

public extension GetSelfTestDescriptionResponse {
    
    init?(data: Data) {
        guard data.count >= SelfTestDescription.minLength,
            data.count <= SelfTestDescription.maxLength,
            let selfTestDescription = SelfTestDescription(data: data)
            else { return nil }
        self.init(selfTestDescription: selfTestDescription)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetSelfTestDescriptionResponse: DataConvertible {
    
    var dataLength: Int {
        return selfTestDescription.dataLength
    }
    
    static func += (data: inout Data, value: GetSelfTestDescriptionResponse) {
        data += value.selfTestDescription
    }
}
