import Foundation

public extension Dictionary {

    /// Returns the value for `key`, or inserts and returns `defaultValue` when missing.
    mutating func value(for key: Key, default defaultValue: @autoclosure () -> Value) -> Value {
        if let existing = self[key] {
            return existing
        }
        let value = defaultValue()
        self[key] = value
        return value
    }
}
