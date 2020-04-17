//
//  SelfTestDescription.swift
//  
//
//  Created by Jorge Loc Rubio on 4/17/20.
//

import Foundation

/**
 Self Test Description
 
 - See Also: ANSI E1.20 – 2010, page 96
*/
public struct SelfTestDescription: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// Self Test Requested
    public var selfTestRequested: SelfTest
    
    /// Description
    public var description: TextDescription
    
    // MARK: - Initialization
    
    public init(selfTestRequested: SelfTest,
                description: TextDescription) {
        
        self.selfTestRequested = selfTestRequested
        self.description = description
    }
}

// MARK: - Data

public extension SelfTestDescription {
    
    internal static var maxLength: Int { return 33 }
    
    internal static var minLength: Int { return 1 }
    
    
    init?(data: Data) {
        guard data.count >= type(of: self).minLength,
            data.count <= type(of: self).maxLength
            else { return nil }
        self.selfTestRequested = SelfTest(rawValue: data[0])
        self.description = TextDescription(data: data.subdata(in: type(of: self).minLength ..< data.count)) ?? TextDescription(rawValue: "")
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SelfTestDescription: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).minLength + description.dataLength
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.selfTestRequested.rawValue
        data += value.description
    }
}
