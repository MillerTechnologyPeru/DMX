//
//  ResponseError.swift
//  
//
//  Created by Alsey Coleman Miller on 3/12/20.
//

import Foundation

/// RDM Response NACK Reason Code Defines
///
/// - SeeAlso:  ANSI E1.20 – 2010, Page 116, Table A-17: Response NACK Reason Code Defines
public enum ResponseError: UInt8, Codable, Error {
    
    /// The responder cannot comply with request because the message is not implemented in responder.
    case unknownPID                 = 0x0000 // NR_UNKNOWN_PID
    
    /// The responder cannot interpret request as controller data was not formatted correctly.
    case formatError                = 0x0001 // NR_FORMAT_ERROR
    
    // TODO: Finish list
}

// MARK: - Description

public extension ResponseError {
    
    var errorDescription: String {
        switch self {
        case .unknownPID:
            return "The responder cannot comply with request because the message is not implemented in responder."
        case .formatError:
            return "The responder cannot interpret request as controller data was not formatted correctly."
        }
    }
}

// MARK: - CustomNSError

#if canImport(Darwin)

extension ResponseError: CustomNSError {
    
    /// The domain of the error.
    static var errorDomain: String { return "org.esta.rdm.error" }
    
    /// The error code within the given domain.
    var errorCode: Int {
        return numericCast(rawValue)
    }

    /// The user-info dictionary.
    var errorUserInfo: [String : Any] {
        
        var userInfo: [String: Any]()
        userInfo[NSLocalizedFailureReasonErrorKey] = errorDescription
        return userInfo
    }
}

#endif
