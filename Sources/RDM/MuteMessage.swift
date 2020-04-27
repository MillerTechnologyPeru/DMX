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
    
    /// Data Length
    internal let length: DataLength
    
    // MARK: - Initialization
    
    public init(controlField: BitMaskOptionSet<ControlField>,
                bindingUID: DeviceUID? = nil) {
    
        self.controlField = controlField
        self.bindingUID = bindingUID
        self.length = bindingUID != nil ? .lengthWithUID : .length
    }
}

// MARK: - Data

public extension MuteMessage {
    
    init?(data: Data) {
        if let length = DataLength(rawValue: data.count) {
            switch length {
            case .lengthWithUID:
                guard let uid = DeviceUID(data: data.subdataNoCopy(in: DataLength.length.rawValue ..< data.count))
                    else { return nil }
                
                self.init(
                    controlField: BitMaskOptionSet<ControlField>(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))),
                    bindingUID: uid
                )
            case .length:
                self.init(controlField: BitMaskOptionSet<ControlField>(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))))
            }
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
        return length.rawValue
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.controlField.rawValue.bigEndian
        guard let uid = value.bindingUID
            else { return }
        data += uid
    }
}

// MARK: - Supporting Types

// MARK: - Length

extension MuteMessage {
    
    enum DataLength: Int, Equatable {
        
        case length = 2
        case lengthWithUID = 8
    }
}
