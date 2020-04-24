//
//  MuteMessage.swift
//  
//
//  Created by Jorge Loc Rubio on 4/24/20.
//

import Foundation

/**
 Mute Message
 
 - See Also: ANSI E1.20 – 2010, page 35
*/
public struct MuteMessage: Equatable, Hashable {
    
    // MARK: - Properties
    
    /// ControlField
    ///
    /// The 16-bit Control Field contains bit flags as in Table 7-3:
    public var controlField: BitMaskOptionSet<ControlField>
    
    /// Binding UID
    ///
    /// The Binding UID field shall only be included when the responding device contains multiple responder ports.
    /// If the device does contain multiple ports, then the Binding UID field shall contain the UID for the primary port on the device.
    /// This Binding UID field allows the controller to associate multiple responder ports discovered within a single physical device.
    public var bindingUID: DeviceUID?
    
    // MARK: - Initialization
    
    public init(controlField: BitMaskOptionSet<ControlField>,
                bindingUID: DeviceUID? = nil) {
    
        self.controlField = controlField
        self.bindingUID = bindingUID
    }
}

// MARK: - Data

public extension MuteMessage {
    
    internal static var lengthWithUID: Int { return 8 }
    
    internal static var length: Int { return 2 }
    
    init?(data: Data) {
        if data.count == type(of: self).lengthWithUID {
            guard let uid = DeviceUID(data: data.subdataNoCopy(in: type(of: self).length ..< data.count))
                else { return nil }
            
            self.init(
                controlField: BitMaskOptionSet<ControlField>(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))),
                bindingUID: uid
            )
        } else if data.count == type(of: self).length {
            
            self.init(controlField: BitMaskOptionSet<ControlField>(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))))
        } else {
            return nil
        }
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension MuteMessage: DataConvertible {
    
    var dataLength: Int {
        guard let _ = bindingUID
            else { return type(of: self).length }
        return type(of: self).lengthWithUID
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.controlField.rawValue.bigEndian
        guard let uid = value.bindingUID
            else { return }
        data += uid
    }
}
