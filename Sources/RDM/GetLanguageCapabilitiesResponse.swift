//
//  GetLanguageCapabilitiesResponse.swift
//  
//
//  Created by Jorge Loc Rubio on 4/9/20.
//

import Foundation

/**
 This parameter is used to identify languages that the device supports for using the LANGUAGE parameter.
 The response contains a packed message of 2 character Language Codes as defined by ISO 639-1.
 International Standard ISO 639-1, Code for the representation of names of languages - Part 1: Alpha 2 code.
 */
public struct GetLanguageCapabilitiesResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .languageCapabilities }
    
    public let languageCodes: [LanguageCode]
    
    // MARK: - Initialization
    
    public init(languageCodes: [LanguageCode]) {
        self.languageCodes = languageCodes
    }
}

// MARK: - Data

public extension GetLanguageCapabilitiesResponse {
    
    internal static var maxLength: Int { return 230 } // 0xE6
    
    init?(data: Data) {
        guard data.count % MemoryLayout<LanguageCode>.size == 0
             else { return nil }
        let count = data.count / LanguageCode.length
        let languageCodes = (0 ..< count)
                  .map { $0 * LanguageCode.length ..< ($0 + 1) * LanguageCode.length }
                  .compactMap { LanguageCode(data: data.subdataNoCopy(in: $0)) }
        assert(languageCodes.count == count)
        self.init(languageCodes: languageCodes)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetLanguageCapabilitiesResponse: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt16>.size
    }
    
    static func += (data: inout Data, value: GetLanguageCapabilitiesResponse) {
        value.languageCodes.forEach{ data += $0 }
    }
}
