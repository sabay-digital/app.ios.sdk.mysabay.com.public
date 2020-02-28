# Official MySabay SDK for iOS
## Setup project info.plist
### App Secret
```xml
<key>MySabayAppId</key>
<string>55</string>
<key>MySabayAppName</key>
<string>ExampleApp</string>
<key>MySabayAppSecret</key>
<string>9c85c50a4362f687cd4507771ba81db5cf50eaa0b3008f4f943f77ba3ac6386b</string>
```
### URL Scheme
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
			<string>mysabay55</string>
		</array>
	</dict>
</array>
```

## Token
### Get Current Token
```swift
if let token = MSrToken.currentToken {}
```
### Checl Valid Token
```swift
if MSToken.isValid {}
```

## Authentication
### Login
```swift
MSMySabayManager.shared.logIn(fromController: self) { result in
    switch result {
    case .success(let token):
        print(token.tokenString!)
        break
    case .failure(let error):
        print(error.localizedDescription)
        break
    }
}
```
### Logout
```swift
MSMySabayManager.shared.logOut()
```

## Store
```swift
MSMySabayManager.shared.openStore(fromController: self) { result in
    switch result {
    case .success(_):
        break
    case .failure(let error):
        print(error.localizedDescription)
        break
    }
}
```
