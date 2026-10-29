# SwiftKitHelpers

Lightweight Swift extensions and helpers for iOS development. Distributed as a [CocoaPods](https://cocoapods.org/pods/SwiftKitHelpers) library.

## Requirements

- iOS 13.0+
- Swift 5.0+
- Xcode 14+

## Installation

### CocoaPods

Add to your `Podfile`:

```ruby
pod 'SwiftKitHelpers', '~> 2.0.0'
```

Then run:

```bash
pod install
```

## Usage

Import the module in Swift source files:

```swift
import SwiftKitHelpers
```

### Examples

```swift
// String
"  hello  ".trimmed
"https://example.com".isValidURL
"user@example.com".isValidEmail

// Collections
[1, 2, 3].element(at: 10) // nil instead of crash
["a", "b", "c"].chunked(into: 2)

// Optional
optionalString.orEmpty
optionalInt.orZero

// Date
Date().startOfDay
DateFormatter.shortDate.string(from: Date())

// UserDefaults
UserDefaults.standard.setCodable(user, forKey: "currentUser")
let user: User? = UserDefaults.standard.codable(forKey: "currentUser")

// UIKit
view.roundCorners(radius: 8)
view.addSubviews(titleLabel, subtitleLabel)
UIColor(hex: "#FF5733")

// More
"hello".capitalizedFirst
Date().isToday
(3.14159).rounded(toDecimalPlaces: 2)
URL(string: "https://example.com?id=1")?.queryValue(for: "id")
Data([0xDE, 0xAD]).hexString
```

## Helpers overview

| Area | Highlights |
|------|------------|
| `String` | Trim, blank check, email/URL validation, base64, `nilIfBlank`, `capitalizedFirst` |
| `Collection` / `Array` | Safe access, chunking, uniquing, `removed(at:)`, `appending` |
| `Dictionary` | Lazy default value with `value(for:default:)` |
| `Optional` | Default values for common types |
| `Date` | Start/end of day, `isToday`, `days(to:)` |
| `DateFormatter` | Shared short/medium/long presets |
| `Data` | Hex encode/decode |
| `URL` | Query read/write helpers |
| `Double` / floats | Decimal rounding, `clamped(to:)` |
| `Bundle` | App version and build number |
| `UserDefaults` | Codable get/set |
| `DispatchQueue` | Main/async helpers |
| `UIView` | Corner radius, subviews, fade, animated hide |
| `UIColor` | Hex initialization |

## License

SwiftKitHelpers is available under the [MIT License](LICENSE).

## Author

**mulgir-govind** — [GitHub](https://github.com/mulgir-govind)
