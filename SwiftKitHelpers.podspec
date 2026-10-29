Pod::Spec.new do |s|
  s.name             = 'SwiftKitHelpers'
  s.version          = '1.0.0'
  s.summary          = 'Lightweight Swift extensions and helpers for iOS apps.'
  s.description      = <<-DESC
    SwiftKitHelpers is a small collection of Foundation and UIKit utilities:
    string and collection helpers, safe optional utilities, date formatting,
    UserDefaults wrappers, and common UIView/UIColor conveniences.
  DESC

  s.homepage         = 'https://github.com/mulgir-govind/SwiftKitHelpers'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mulgir-govind' => 'govind.mulgir.17@gmail.com' }
  s.source           = {
    :git => 'https://github.com/mulgir-govind/SwiftKitHelpers.git',
    :tag => s.version.to_s
  }

  s.swift_version       = '5.0'
  s.ios.deployment_target = '13.0'
  s.source_files        = 'SwiftKitHelpers/**/*.swift'
  s.frameworks          = 'Foundation', 'UIKit'
end
