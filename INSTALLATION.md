# Installation for MySabay iOS SDK

This is the quick guide to install MySabay iOS SDK in your app.

## Service Code

MySabay SDK distinguishes the service based on service code. You can create your service at ....

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. To integrate MySabay SDK into your Xcode project using CocoaPods, specify it in your `Podfile`

```ruby
pod 'MySabaySdk', '~> 2.0.1'
```

## Configuration

Next, it is time to config your Xcode project to update `Info.plist` and `AppDelegate`

### Info.plist

MySabay SDK provides login option with `Facebook`. Please contact us to get your Facebook App ID.

```xml
 <key>CFBundleURLTypes</key>
 <array>
   <dict>
   <key>CFBundleURLSchemes</key>
   <array>
     <string>fb{facebook_app_id}</string>
   </array>
   </dict>
 </array>
 <key>FacebookAppID</key>
 <string>{facebook_app_id}</string>
 <key>FacebookDisplayName</key>
 <string>MySabaySDK</string>

<key>LSApplicationQueriesSchemes</key>
<array>
  <string>fbapi</string>
  <string>fbapi20130214</string>
  <string>fbapi20130410</string>
  <string>fbapi20130702</string>
  <string>fbapi20131010</string>
  <string>fbapi20131219</string>
  <string>fbapi20140410</string>
  <string>fbapi20140116</string>
  <string>fbapi20150313</string>
  <string>fbapi20150629</string>
  <string>fbapi20160328</string>
  <string>fbauth</string>
  <string>fb-messenger-share-api</string>
  <string>fbauth2</string>
  <string>fbshareextension</string>
</array>
```

### AppDelegate

Add the following code to your `AppDelegate` file

```swift
import UIKit
import MySabaySdk
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        var appearance = MSAppearance()
        appearance.title = "MyApp"
        var configure = MSConfigure()
        configure.serviceCode = "{service_code}"
        configure.environment = .sandbox
        configure.theme = .dark
        configure.appearance = appearance
        MSMySabaySDK.configure(configure: configure)
        MSMySabaySDK.shared.completeTransactions()
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }
}
```

If you're using iOS 13 and above, you need to add the following method to your `SceneDelegate`

```swift
import UIKit
import FacebookCore
import MySabaySdk

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        ApplicationDelegate.shared.application( UIApplication.shared, open: url, sourceApplication: nil, annotation: [UIApplication.OpenURLOptionsKey.annotation])
    }
}
```


