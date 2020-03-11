# Official MySabay SDK for iOS

## Create your application

Create your MySabay application at [MySabay App Dashboard](https://kh.mysabay.com:8443/index.html) and copy your `appId` and `appSecret`

## Installing

```bash
pod 'MySabaySdk'
```

## Configuration

Info.plist

Replace `{appId}` `{appName}` and `{appSecret}` with your `appId`, `appName` and `appSecret`.

MySabay is providing sandbox environment for testing. To point to testing environment, just update `MySabayAppSandbox` to `TRUE` and vice versus.

You can update your theme color by using pre-define themes:

`Soyo`: for light theme

`MySabay`: for dark theme

```xml
<key>MySabayAppId</key>
<string>{appId}</string>
<key>MySabayAppName</key>
<string>{appName}</string>
<key>MySabayAppSecret</key>
<string>{appSecret}</string>
<key>MySabayAppTheme</key>
<string>MySabay</string>
<key>MySabayAppSandbox</key>
<true/>
```

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
	    <string>Viewer</string>
	    <key>CFBundleURLName</key>
	    <string>aog</string>
	    <key>CFBundleURLSchemes</key>
	    <array>
	        <string>mysabay{appId}</string>
	    </array>
	</dict>
</array>
```

AppDelegate.swift

```swift
import MySabaySdk

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    MSMySabayManager.shared.addTransactionObserver()
    return true
}
    
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    return MSMySabayManager.shared.handleOpenUrl(url: url)
}
    
func applicationWillTerminate(_ application: UIApplication) {
    MSMySabayManager.shared.removeTransactionObserver()
}
```

SceneDelegate.swift

```swift
func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    MSMySabayManager.shared.handleOpenUrl(contexts: URLContexts)
}
```

Login

```swift
import MySabaySdk

MSMySabayManager.shared.logIn(fromController: self) { result in
    switch result {
        case .loginSuccess(let token):
            print("\(token.tokenString!)")
            break
        case .loginFailed(let error):
            print(error.localizedDescription)
            break
        }
    }
}
```

Purchase

```swift
import MySabaySdk

MSMySabayManager.shared.openStore(fromController: self) { result in
    switch result {
        case .purchaseMySabay(let hash):
            print("\(hash)")
            //some work after success with MySabay
            break
        case .purchaseApple(let product):
            print("\(product.productIdentifier)")
            //some work after success with Apple In-App purchase
            break
        case .purchaseFailed(let error):
            print("\(error.localizedDescription)")
            break
    }
}
```

Get profile

```swift
import MySabaySdk

MSMySabayManager.shared.getUserProfile { result in
    switch result {
        case .fetchSuccess(let profile):
            //work with profile
            break
        case .fetchFailed(let error):
            print("\(error.localizedDescription)")
            break
    }
}
```

Refresh token

```swift
import MySabaySdk

MSMySabayManager.shared.refreshToken { result in
    switch result {
        case .refreshSuccess(let token):
            //work with token
            break
        case .refreshFailed(let error):
            print("\(error.localizedDescription)")
            break
    }
}
```

Get current token

```swift
if let token = MSToken.currentToken {

}
```

Check valid token

```swift
if MSToken.isValid {

}
```

Logout

```swift
MSMySabayManager.shared.logOut()
```

