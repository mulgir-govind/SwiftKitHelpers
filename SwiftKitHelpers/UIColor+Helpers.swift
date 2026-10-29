import UIKit

public extension UIColor {

    /// Creates a color from a hex string (`#RGB`, `#RRGGBB`, or `#RRGGBBAA`).
    convenience init?(hex: String) {
        var sanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if sanitized.hasPrefix("#") {
            sanitized.removeFirst()
        }

        guard sanitized.count == 3 || sanitized.count == 6 || sanitized.count == 8 else {
            return nil
        }

        if sanitized.count == 3 {
            sanitized = sanitized.map { String(repeating: $0, count: 2) }.joined()
        }

        var value: UInt64 = 0
        guard Scanner(string: sanitized).scanHexInt64(&value) else { return nil }

        let r, g, b, a: CGFloat
        if sanitized.count == 8 {
            r = CGFloat((value & 0xFF00_0000) >> 24) / 255
            g = CGFloat((value & 0x00FF_0000) >> 16) / 255
            b = CGFloat((value & 0x0000_FF00) >> 8) / 255
            a = CGFloat(value & 0x0000_00FF) / 255
        } else {
            r = CGFloat((value & 0xFF0000) >> 16) / 255
            g = CGFloat((value & 0x00FF00) >> 8) / 255
            b = CGFloat(value & 0x0000FF) / 255
            a = 1
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
