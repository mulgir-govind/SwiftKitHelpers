import Foundation

public extension URL {

    /// First query item value for `name`, if present.
    func queryValue(for name: String) -> String? {
        URLComponents(url: self, resolvingAgainstBaseURL: false)?
            .queryItems?
            .first(where: { $0.name == name })?
            .value
    }

    /// Returns a copy with an added or replaced query parameter.
    func appendingQueryItem(name: String, value: String) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }
        var items = components.queryItems ?? []
        if let index = items.firstIndex(where: { $0.name == name }) {
            items[index] = URLQueryItem(name: name, value: value)
        } else {
            items.append(URLQueryItem(name: name, value: value))
        }
        components.queryItems = items
        return components.url
    }
}
