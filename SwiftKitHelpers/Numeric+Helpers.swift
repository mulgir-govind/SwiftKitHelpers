import Foundation

public extension Double {

    /// Rounds to the given number of decimal places.
    func rounded(toDecimalPlaces places: Int) -> Double {
        guard places >= 0 else { return self }
        let factor = pow(10.0, Double(places))
        return (self * factor).rounded() / factor
    }
}

public extension BinaryFloatingPoint {

    /// Clamps the value to `min`...`max`.
    func clamped(to range: ClosedRange<Self>) -> Self {
        min(max(self, range.lowerBound), range.upperBound)
    }
}
