//
//  SetLanguage.swift
//  
//
//  Created by Jorge Loc Rubio on 4/9/20.
//

import Foundation

/**
 This parameter is used to change the language of the messages from the device.
 Supported languages of the device can be determined by the `LANGUAGE_CAPABILITIES`.
 The Language Codes are 2 character alpha codes as defined by ISO 639-1.
 International Standard ISO 639-1, Code for the representation of names of languages - Part 1: Alpha 2 code.
 
 Set Language Code to `0x0000` to reset device to Default Language.
 */
public struct SetLanguage: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .set }
    
    public static var parameterID: ParameterID { return .language }
    
    public let languageCode: LanguageCode
    
    // MARK: - Initialization
    
    public init(languageCode: LanguageCode) {
        self.languageCode = languageCode
    }
}

// MARK: - Data

public extension SetLanguage {
    
    init?(data: Data) {
        guard data.count == LanguageCode.length,
              let languageCode = LanguageCode(data: data)
             else { return nil }
        self.init(languageCode: languageCode)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension SetLanguage: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt16>.size
    }
    
    static func += (data: inout Data, value: SetLanguage) {
        data += value.languageCode
    }
}
