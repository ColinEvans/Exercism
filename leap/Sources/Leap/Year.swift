//Solution goes in Sources

class Year {

    /// MARK: - Properties

    /// The given year according to the Gregorian calendar
    let calendarYear: Int

    /// Is the given year a leap year, using computed properties
    var isLeapYear: Bool {
        if calendarYear % 4 == 0,
            (calendarYear % 400 == 0 ||
            calendarYear % 100 != 0) {
            return true
        }

        return false
    }
    init(calendarYear: Int) {
        self.calendarYear = calendarYear
    }

}
