import Foundation

public extension UserDefaults {

    /// Stores a `Codable` value as JSON data.
    func setCodable<T: Encodable>(_ value: T, forKey key: String) {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(value) else { return }
        set(data, forKey: key)
    }

    /// Reads and decodes a `Codable` value, or `nil` if missing or invalid.
    func codable<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(type, from: data)
    }
}
