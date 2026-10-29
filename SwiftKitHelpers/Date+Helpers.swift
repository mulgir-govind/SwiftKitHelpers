import Foundation

public extension Date {

    /// Start of the calendar day in the current time zone.
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    /// Last instant of the calendar day in the current time zone.
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay) ?? self
    }

    /// Adds calendar components and returns a new date.
    func adding(_ component: Calendar.Component, value: Int) -> Date {
        Calendar.current.date(byAdding: component, value: value, to: self) ?? self
    }

    /// `true` when the date falls on the same calendar day as `other`.
    func isSameDay(as other: Date, calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, inSameDayAs: other)
    }

    /// `true` when the date is on the current calendar day.
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }

    /// `true` when the date is strictly after the current instant.
    var isInFuture: Bool {
        self > Date()
    }

    /// Whole number of calendar days from this date to `other` (can be negative).
    func days(to other: Date, calendar: Calendar = .current) -> Int {
        let start = calendar.startOfDay(for: self)
        let end = calendar.startOfDay(for: other)
        return calendar.dateComponents([.day], from: start, to: end).day ?? 0
    }
}

public extension DateFormatter {

    private static func makeFormatter(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        formatter.locale = Locale.current
        return formatter
    }

    static let shortDate: DateFormatter = makeFormatter(dateStyle: .short, timeStyle: .none)
    static let mediumDate: DateFormatter = makeFormatter(dateStyle: .medium, timeStyle: .none)
    static let longDateTime: DateFormatter = makeFormatter(dateStyle: .long, timeStyle: .short)
}
