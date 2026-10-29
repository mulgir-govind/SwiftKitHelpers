import Foundation

public extension Optional where Wrapped == String {

    var orEmpty: String { self ?? "" }
}

public extension Optional where Wrapped == Int {

    var orZero: Int { self ?? 0 }
}

public extension Optional where Wrapped == Double {

    var orZero: Double { self ?? 0 }
}

public extension Optional where Wrapped == Bool {

    var orFalse: Bool { self ?? false }
}

public extension Optional {

    /// Returns `defaultValue` when `self` is `nil`.
    func or(_ defaultValue: Wrapped) -> Wrapped {
        self ?? defaultValue
    }
}
