
import Foundation

class Clock: CustomStringConvertible {
    
    /// MARK: - Properties
    
    /// The current hour time (00 - 24)
    private var hours: Int
    
    /// The current minute time (00 - 59)
    private var minutes: Int

    /// Overflow minutes when adding and subtracting from the clock
    private static var overflowMins = 0
    
    /// Returns the current calculated time
    var description: String {

        var hoursToAdd = 0

        // Calculate the overflow minutes and convert into hours
        minutes += Clock.overflowMins

        if minutes >= 60 {
            hoursToAdd = minutes / 60
            minutes = minutes % 60
        } else if minutes < 0 {
            hoursToAdd = (minutes / 60) - 1
            minutes = 60 + (minutes % 60)
        }
        
        // Add the overflow hours to the clock
        hours += hoursToAdd
        if hours >= 24 {
            hours = hours % 24
        } else if hours < 0 {
            if hours % 24 == 0 {
                hours = 0
            } else {
                hours = 24 + (hours % 24) // bc 48 % 24 = 0 and 24 - 0
            }
        }

        // similar to C, can use the formatter to add leading 0's
        let time = String(format: "%02d:%02d", hours, minutes)

        Clock.overflowMins = 0

        return time
    }

    /// MARK: - Methods
    func add(minutes: Int) -> Clock {
        Clock.overflowMins += minutes
        return Clock(hours: self.hours, minutes: self.minutes)
    }
    
    func subtract(minutes: Int) -> Clock {
        Clock.overflowMins -= minutes
        return Clock(hours: self.hours, minutes: self.minutes)
    }
    
    /// MARK:  - Lifecycle Functions
    init(hours: Int, minutes: Int = 0) {
        self.hours = hours
        self.minutes = minutes
    }
}

/// MARK: Extensions - <Equatable>
extension Clock: Equatable {
 
    static func == (lhs: Clock, rhs: Clock) -> Bool {
        if lhs.description == rhs.description {
            return true
        }
        return false
    }
}
