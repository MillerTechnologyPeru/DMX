//
//  Dictionary.swift
//  
//
//  Created by Alsey Coleman Miller on 2/23/20.
//

internal extension Dictionary where Key: FixedWidthInteger {
    
    var lastKey: Key? {
        return keys.sorted(by: { $0 < $1 }).last
    }
    
    var firstKey: Key? {
        return keys.sorted(by: { $0 < $1 }).first
    }
}
