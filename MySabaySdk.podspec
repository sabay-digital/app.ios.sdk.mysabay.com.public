#
# Be sure to run `pod lib lint NaturalVoice.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name         = "MySabaySdk"
  spec.version      = "1.0.30"
  spec.summary      = "Official MySabay iOS SDK in Swift."
  spec.description  = "Official MySabay iOS SDK in Swift for MySabay platform."
  spec.homepage     = "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public"
  spec.license      = { :type => "MIT", :file => "MySabaySdk/LICENSE" }
  spec.author             = { "Sabay Digital" => "partner.cocoapods@sabay.com" }
  spec.ios.deployment_target = '13.0'
  spec.ios.vendored_frameworks = 'MySabaySdk/MySabaySdk.framework'
  spec.source       = { :http => "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public/raw/1.0.30/MySabaySdk.zip" }
  spec.swift_version = '5.3.2'
  spec.exclude_files = "Classes/Exclude"
  spec.pod_target_xcconfig = {'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.dependency 'MatomoTracker', '~> 7.4'
  spec.dependency 'Kingfisher', '~> 6.0'
  spec.dependency "Apollo"
  spec.dependency 'SwiftyStoreKit'
  spec.dependency 'KeychainSwift', '~> 19.0'
  spec.dependency 'ReSwift'
  spec.dependency 'FacebookCore'
  spec.dependency 'FacebookLogin'
  spec.dependency 'JSONValueRX'
  spec.dependency 'PhoneNumberKit', '~> 3.3'
end

