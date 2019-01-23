import Foundation

/// Encapsulation of a Date object that's added a gigSecond to it
class Gigasecond {

    /// MARK: - Properties

    /// The time between the given date and a Giagasecond
    var description: String {
        return Gigasecond.formatter.string(from: date)
    }

    private static var formatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()

    /// The date created from the `TimeInterval` in the init
    private let date: Date

    /// MARK: - Lifecycle functions
    init?(from startDate: String) {

        /// The length of one gigaSecond is 10^9
        let gigaSecond = pow(10.0, 9.0)

        // Cast gigaSecond to alias `TimeInterval` to work with `Date` objects
        let gigaSecondInterval = TimeInterval(gigaSecond)


        guard let date = Gigasecond.formatter.date(from: startDate) else { return nil }

        // Let our date be the given date offSet by a gigaSecond
        self.date = Date(timeInterval: gigaSecondInterval, since: date)
    }

}
