import Foundation

public extension Collection {

    /// Safe element access; returns `nil` when `index` is out of bounds.
    func element(at index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

public extension Array {

    /// Returns a copy with the element at `index` removed, or `self` when out of bounds.
    func removed(at index: Int) -> [Element] {
        guard indices.contains(index) else { return self }
        var copy = self
        copy.remove(at: index)
        return copy
    }

    /// Appends elements and returns a new array.
    func appending(_ elements: Element...) -> [Element] {
        self + elements
    }

    /// Splits the array into consecutive chunks of at most `size` elements.
    func chunked(into size: Int) -> [[Element]] {
        guard size > 0 else { return isEmpty ? [] : [self] }
        var result: [[Element]] = []
        result.reserveCapacity((count + size - 1) / size)
        var start = startIndex
        while start != endIndex {
            let end = index(start, offsetBy: size, limitedBy: endIndex) ?? endIndex
            result.append(Array(self[start..<end]))
            start = end
        }
        return result
    }
}

public extension Sequence where Element: Hashable {

    /// Preserves order while removing duplicate elements.
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }
}
