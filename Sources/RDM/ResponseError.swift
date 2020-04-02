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
public enum ResponseError: UInt8, Error {
    
    /// The responder cannot comply with request because the message is not implemented in responder.
    case unknownPID                 = 0x0000 // NR_UNKNOWN_PID
    
    /// The responder cannot interpret request as controller data was not formatted correctly.
    case formatError                = 0x0001 // NR_FORMAT_ERROR
    
    /// The responder cannot comply due to an internal hardware fault.
    case hardwareFault              = 0x0002 // NR_HARDWARE_FAULT
    
    /// Proxy is not the RDM line master and cannot comply with message.
    case proxyReject                = 0x0003 // NR_PROXY_REJECT
    
    /// SET Command normally allowed but being blocked currently.
    case writeProtect               = 0x0004 // NR_WRITE_PROTECT
    
    /// Not valid for Command Class attempted. May be used where GET allowed but SET is not supported.
    case unsupportedCommandClass    = 0x0005 //NR_UNSUPPORTED_COMMAND_CLASS
    
    /// Value for given Parameter out of allowable range or not supported.
    case dataOutOfRange             = 0x0006 // NR_DATA_OUT_OF_RANGE
    
    /// Buffer or Queue space currently has no free space to store data.
    case bufferFull                 = 0x0007 // NR_BUFFER_FULL
    
    /// Incoming message exceeds buffer capacity.
    case packetSizeUnsupported      = 0x0008 // NR_PACKET_SIZE_UNSUPPORTED
    
    /// Sub-Device is out of range or unknown.
    case subDeviceOutOfRange        = 0x0009 // NR_SUB_DEVICE_OUT_OF_RANGE
    
    /// The proxy buffer is full and can not store any more Queued Message or Status Message responses.
    case proxyBufferFull            = 0x000A // NR_PROXY_BUFFER_FULL
}

// MARK: - Description

public extension ResponseError {
    
    var errorDescription: String {
        switch self {
        case .unknownPID:
            return "The responder cannot comply with request because the message is not implemented in responder."
        case .formatError:
            return "The responder cannot interpret request as controller data was not formatted correctly."
        case .hardwareFault:
            return "The responder cannot comply due to an internal hardware fault."
        case .proxyReject:
            return "Proxy is not the RDM line master and cannot comply with message."
        case .writeProtect:
            return "SET Command normally allowed but being blocked currently."
        case .unsupportedCommandClass:
            return "Not valid for Command Class attempted. May be used where GET allowed but SET is not supported."
        case .dataOutOfRange:
            return "Value for given Parameter out of allowable range or not supported."
        case .bufferFull:
            return "Buffer or Queue space currently has no free space to store data."
        case .packetSizeUnsupported:
            return "Incoming message exceeds buffer capacity."
        case .subDeviceOutOfRange:
            return "Sub-Device is out of range or unknown."
        case .proxyBufferFull:
            return "The proxy buffer is full and can not store any more Queued Message or Status Message responses."
        }
    }
}

// MARK: - CustomNSError

#if canImport(Darwin)

extension ResponseError: CustomNSError {
    
    /// The domain of the error.
    public static var errorDomain: String { return "org.esta.rdm.error" }
    
    /// The error code within the given domain.
    public var errorCode: Int {
        return numericCast(rawValue)
    }

    /// The user-info dictionary.
    public var errorUserInfo: [String : Any] {
        
        var userInfo = [String: Any]()
        userInfo[NSLocalizedFailureReasonErrorKey] = errorDescription
        return userInfo
    }
}

#endif
