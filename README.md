# SwiftKitHelpers

Lightweight Swift extensions and helpers for iOS development. Distributed as a [CocoaPods](https://cocoapods.org) library.

## Requirements

- iOS 13.0+
- Swift 5.0+
- Xcode 14+

## Installation

### CocoaPods

Add to your `Podfile`:

```ruby
pod 'SwiftKitHelpers', '~> 0.1.0'
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
```

## Helpers overview

| Area | Highlights |
|------|------------|
| `String` | Trim, blank check, email/URL validation, base64 |
| `Collection` | Safe subscript, chunking, uniquing |
| `Optional` | Default values for common types |
| `Date` | Start/end of day, adding components |
| `DateFormatter` | Shared short/medium/long presets |
| `Bundle` | App version and build number |
| `UserDefaults` | Codable get/set |
| `DispatchQueue` | Main/async helpers |
| `UIView` | Corner radius, subviews, fade |
| `UIColor` | Hex initialization |

## License

SwiftKitHelpers is available under the [MIT License](LICENSE).

## Author

**mulgir-govind** — [GitHub](https://github.com/mulgir-govind)

Before publishing to CocoaPods, update the author email in `SwiftKitHelpers.podspec`.

## Publishing checklist (maintainer)

1. Replace `YOUR_EMAIL_HERE` in `SwiftKitHelpers.podspec`.
2. Commit and push to `https://github.com/mulgir-govind/SwiftKitHelpers`.
3. Tag the release: `git tag 0.1.0 && git push origin 0.1.0`
4. Validate: `pod lib lint SwiftKitHelpers.podspec --allow-warnings`
5. Register (first time only): `pod trunk register YOUR_EMAIL 'mulgir-govind'`
6. Publish: `pod trunk push SwiftKitHelpers.podspec --allow-warnings`
