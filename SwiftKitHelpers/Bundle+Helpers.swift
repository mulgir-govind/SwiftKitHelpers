import Foundation

public extension Bundle {

    /// Marketing version string (`CFBundleShortVersionString`).
    var appVersion: String? {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    /// Build number string (`CFBundleVersion`).
    var buildNumber: String? {
        object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }

    /// `"version (build)"` when both values exist.
    var versionDisplayString: String? {
        guard let version = appVersion, let build = buildNumber else { return appVersion ?? buildNumber }
        return "\(version) (\(build))"
    }
}
