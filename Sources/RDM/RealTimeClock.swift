//
//  RealTimeClock.swift
//  
//
//  Created by Jorge Loc Rubio on 4/16/20.
//

import Foundation

/**
 Real Time Clock

 - SeeAlso: ANSI E1.20 – 2010, page 92, Table 10-2: Date and Time Ranges
*/
public struct RealTimeClock: Equatable, Hashable {
    
    // MARK: - Properties
       
    /// Year
    public var year: Year
    
    /// Month
    public var month: Month
    
    /// Day
    public var day: Day
    
    /// Hour
    public var hour: Hour
    
    /// Minute
    public var minute: Minute
    
    /// Second
    public var second: Second
    
    // MARK: - Initialization
    
    public init(year: Year,
                month: Month,
                day: Day,
                hour: Hour,
                minute: Minute,
                second: Second) {
        
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
        self.second = second
    }
}

// MARK: - Data

public extension RealTimeClock {
    
    internal static var length: Int { return 7 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length,
            let year = Year(rawValue: UInt16(bigEndian: UInt16(bytes: (data[0], data[1])))),
            let month = Month(rawValue: data[2]),
            let day = Day(rawValue: data[3]),
            let hour = Hour(rawValue: data[4]),
            let minute = Minute(rawValue: data[5]),
            let second = Second(rawValue: data[6])
            else { return nil }
        
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension RealTimeClock: DataConvertible {
    
    var dataLength: Int {
        return StatusMessage.length
    }
    
    static func += (data: inout Data, value: Self) {
        data += value.year.rawValue.bigEndian
        data += value.month.rawValue
        data += value.day.rawValue
        data += value.hour.rawValue
        data += value.minute.rawValue
        data += value.second.rawValue
    }
}

// MARK: - Supporting Types

// MARK: - Year

public extension RealTimeClock {
    
    /// Year
    struct Year: RawRepresentable, Equatable, Hashable {
        
        public var rawValue: UInt16
        
        public init?(rawValue: UInt16) {
            guard rawValue <= Year.max.rawValue,
                rawValue >= Year.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
}

// MARK: - CustomStringConvertible

extension RealTimeClock.Year: CustomStringConvertible {
    
    public var description: String {
        return "0x" + rawValue.toHexadecimal()
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension RealTimeClock.Year: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(value)
    }
}

// MARK: - Definitions

public extension RealTimeClock.Year {
    
    /// Minimum Value
    static var min : RealTimeClock.Year { return 2003 }
    
    /// Maximum Value
    static var max : RealTimeClock.Year { return 65535 }
}

// MARK: - Month

public extension RealTimeClock {
    
    /// Month
    struct Month: RawRepresentable, Equatable, Hashable {
        
        public var rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            guard rawValue <= Month.max.rawValue,
                rawValue >= Month.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

// MARK: - CustomStringConvertible

extension RealTimeClock.Month: CustomStringConvertible {
    
    public var description: String {
        return "0x" + rawValue.toHexadecimal()
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension RealTimeClock.Month: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(value)
    }
}

// MARK: - Definitions

public extension RealTimeClock.Month {
    
    /// Minimum Value
    static var min : RealTimeClock.Month { return 1 }
    
    /// Maximum Value
    static var max : RealTimeClock.Month { return 12 }
}

// MARK: - Day

public extension RealTimeClock {
    
    /// Day
    struct Day: RawRepresentable, Equatable, Hashable {
        
        public var rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            guard rawValue <= Day.max.rawValue,
                rawValue >= Day.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

// MARK: - CustomStringConvertible

extension RealTimeClock.Day: CustomStringConvertible {
    
    public var description: String {
        return "0x" + rawValue.toHexadecimal()
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension RealTimeClock.Day: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(value)
    }
}

// MARK: - Definitions

public extension RealTimeClock.Day {
    
    /// Minimum Value
    static var min : RealTimeClock.Day { return 1 }
    
    /// Maximum Value
    static var max : RealTimeClock.Day { return 31 }
}

// MARK: - Hour

public extension RealTimeClock {
    
    /// Hour
    struct Hour: RawRepresentable, Equatable, Hashable {
        
        public var rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            guard rawValue <= Hour.max.rawValue,
                rawValue >= Hour.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

// MARK: - CustomStringConvertible

extension RealTimeClock.Hour: CustomStringConvertible {
    
    public var description: String {
        return "0x" + rawValue.toHexadecimal()
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension RealTimeClock.Hour: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(value)
    }
}

// MARK: - Definitions

public extension RealTimeClock.Hour {
    
    /// Minimum Value
    static var min : RealTimeClock.Hour { return 0 }
    
    /// Maximum Value
    static var max : RealTimeClock.Hour { return 23 }
}

// MARK: - Minute

public extension RealTimeClock {
    
    /// Minute
    struct Minute: RawRepresentable, Equatable, Hashable {
        
        public var rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            guard rawValue <= Minute.max.rawValue,
                rawValue >= Minute.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

// MARK: - CustomStringConvertible

extension RealTimeClock.Minute: CustomStringConvertible {
    
    public var description: String {
        return "0x" + rawValue.toHexadecimal()
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension RealTimeClock.Minute: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(value)
    }
}

// MARK: - Definitions

public extension RealTimeClock.Minute {
    
    /// Minimum Value
    static var min : RealTimeClock.Minute { return 0 }
    
    /// Maximum Value
    static var max : RealTimeClock.Minute { return 59 }
}

// MARK: - Second

public extension RealTimeClock {
    
    /// Second
    struct Second: RawRepresentable, Equatable, Hashable {
        
        public var rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            guard rawValue <= Second.max.rawValue,
                rawValue >= Second.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

// MARK: - CustomStringConvertible

extension RealTimeClock.Second: CustomStringConvertible {
    
    public var description: String {
        return "0x" + rawValue.toHexadecimal()
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension RealTimeClock.Second: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(value)
    }
}

// MARK: - Definitions

public extension RealTimeClock.Second {
    
    /// Minimum Value
    static var min : RealTimeClock.Second { return 0 }
    
    /// Maximum Value
    static var max : RealTimeClock.Second { return 59 }
}
