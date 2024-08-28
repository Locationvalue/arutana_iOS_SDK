#
#  Be sure to run `pod spec lint Arutana.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "Arutana"
  spec.version      = "0.0.2"
  spec.summary      = "Arutana ad network"
  spec.homepage     = "https://github.com/Locationvalue/arutana_iOS_SDK/wiki"
  spec.license      = "PROPRIETARY"
  spec.author       = { "DearOne, Inc." => "info@dearone.io" }
  spec.platform     = :ios
  spec.source       = { :git => "https://github.com/Locationvalue/arutana_iOS_SDK", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "Arutana.xcframework/ios-arm64/Arutana.framework"
  spec.platform     = :ios, "14.0"
  spec.public_header_files = 'Headers/**/*.h'
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"
  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"
  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"
  # spec.requires_arc = true
  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"
end
