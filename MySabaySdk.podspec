#
# Be sure to run `pod lib lint NaturalVoice.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name         = "MySabaySdk"
  spec.version      = "2.0.7"
  spec.summary      = "Official MySabay iOS SDK in Swift."
  spec.description  = "Official MySabay iOS SDK in Swift for MySabay platform."
  spec.homepage     = "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public"
  spec.license      = { :type => 'MIT', :text => <<-LICENSE
                          Permission is hereby granted, free of charge, to any person obtaining a copy
                          of this software and associated documentation files (the "Software"), to deal
                          in the Software without restriction, including without limitation the rights
                          to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
                          copies of the Software, and to permit persons to whom the Software is
                          furnished to do so, subject to the following conditions:
                          
                          The above copyright notice and this permission notice shall be included in
                          all copies or substantial portions of the Software.
                          
                          THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                          IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
                          FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
                          AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
                          LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
                          OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
                          THE SOFTWARE.
                        LICENSE
                      }
  spec.author             = { "Sabay Digital" => "partner.cocoapods@sabay.com" }
  spec.ios.deployment_target = '13.0'
  spec.ios.vendored_frameworks = 'MySabaySdk.xcframework'
  spec.source       = { :http => "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public/raw/2.0.7/MySabaySdk.xcframework.zip" }
  spec.swift_version = '5.3.2'
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



