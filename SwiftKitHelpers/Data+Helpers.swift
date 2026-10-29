import Foundation

public extension Data {

    /// Lowercase hex representation (no `0x` prefix).
    var hexString: String {
        map { String(format: "%02x", $0) }.joined()
    }

    /// Creates data from a hex string; ignores whitespace and optional `0x` prefix.
    init?(hexString: String) {
        var sanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if sanitized.hasPrefix("0x") || sanitized.hasPrefix("0X") {
            sanitized.removeFirst(2)
        }
        guard sanitized.count.isMultiple(of: 2) else { return nil }

        var data = Data(capacity: sanitized.count / 2)
        var index = sanitized.startIndex
        while index < sanitized.endIndex {
            let next = sanitized.index(index, offsetBy: 2)
            guard next <= sanitized.endIndex else { return nil }
            let byte = sanitized[index..<next]
            guard let value = UInt8(byte, radix: 16) else { return nil }
            data.append(value)
            index = next
        }
        self = data
    }
}
