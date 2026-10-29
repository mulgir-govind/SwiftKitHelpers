import Foundation

public extension String {

    /// Whitespace and newline trimmed copy.
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// `true` when the string is empty or contains only whitespace.
    var isBlank: Bool {
        trimmed.isEmpty
    }

    /// Basic RFC-style email format check (not a guarantee of deliverability).
    var isValidEmail: Bool {
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return range(of: pattern, options: .regularExpression) != nil
    }

    /// `true` when the string can be parsed as a URL with a scheme and host.
    var isValidURL: Bool {
        guard let url = URL(string: self), url.scheme != nil, url.host != nil else {
            return false
        }
        return true
    }

    /// UTF-8 data encoded as a Base64 string.
    var base64Encoded: String? {
        data(using: .utf8)?.base64EncodedString()
    }

    /// Decodes a Base64 string to UTF-8 text.
    var base64Decoded: String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    /// `nil` when the string is blank after trimming; otherwise the trimmed value.
    var nilIfBlank: String? {
        let value = trimmed
        return value.isEmpty ? nil : value
    }

    /// Uppercases only the first character; leaves the rest unchanged.
    var capitalizedFirst: String {
        guard let first = first else { return self }
        return String(first).uppercased() + dropFirst()
    }

    /// Case-insensitive containment check against any of the given substrings.
    func containsAny(_ substrings: String..., ignoreCase: Bool = true) -> Bool {
        let options: String.CompareOptions = ignoreCase ? .caseInsensitive : []
        return substrings.contains { range(of: $0, options: options) != nil }
    }
}
