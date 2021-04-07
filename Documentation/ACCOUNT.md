# Account API for MySabay iOS SDK

MySabay SDK provides UI support and functionalities for your app to access account authentication.

**Table of Contents**
- [UI Support](#ui-support)
    - [Login Process](#login-process)
- [Functionalities](#functionalities)
    - [Login Guest](#login-guest)
    - [Login Phone](#login-phone)
    - [Login Facebook](#login-facebook)
    - [Login MySabay](#login-mysabay)
    - [Register MySabay](#register-mysabay)
    - [Check MySabay](#check-mysabay)
    - [Verify MySabay](#verify-mysabay)
    - [Request Creating MySabay With Phone](#request-creating-mysabay-with-phone)
    - [Create MySabay Account with Phone](#create-mysabay-account-with-phone)
    - [Check Local Payment](#check-local-payment)
    - [Get Profile](#get-profile)
    - [Refresh Tokens](#refresh-tokens)
    - [Verify Tokens](#verify-tokens)
    - [Logout](#logout)
    - [Tokens Management](#tokens-management)

## UI Support

MySabay SDK built-in with ui support for authentication for account. This will make you easy without making your own ui form to handle all functionalities for authentication process. Here we will handle for login with phone and one-time password, MySabay account and Facebook, registering MySabay account, verifying and creating MySabay account related to a phone number.

### Login Process

Call this function if you want to use ui support, all you will do is to wait for result. 

```swift
MSMySabaySDK.shared.openLoginScreen { result in
    switch result {
        case let .success(token):
            print(token.accessToken.tokenString!)
            print(token.refreshToken.tokenString!)
        break
        case let .failure(error):
            print(error.localizedDescription)
        break
    }
}
```

Using ui support you dont to care about session for user, MySabay SDK will handle it for you.

## Funtionalities

### Login Guest

If you want user to try your app without login with account, MySabay SDK provides function to login as guest. 

```swift
func loginGuest() -> MSPromise<MSToken>
```

### Login Phone

Sending phone number to login and waiting for one-time password to verify

```swift
func loginWithPhone(phoneNumber: String) -> MSPromise<(String, Bool, String)>
```

This will return a promise with turple

- `phoneNumber: String` phone number that you want to login.

- `verifyMySabay: Bool` this can be `true` or `false`

    - `true`: It indicates that this phone number is related to any MySabay account. You will get `mySabayUserName` value in return. This requires user to have option to confirm their MySabay account my input password that is matched `mySabayUserName` with [verifyMySabay](#verify-mysabay) function or user can request to create another MySabay account by calling [requestCreatingMySabayWithPhone](#request-creating-mysabay-with-phone) function.
    - `false`: It indicated that this phone number is not related to any MySabay account, you can go to one-time password verificaiton.

- `mySabayUserName: String` this can be empty or with value based on `verifyMySabay`.


```swift
func verifyOtp(phoneNumber: String, otp: String) -> MSPromise<MSToken>
```

Seding phone number and one-time password to server for verification.

### Login Facebook

MySabay SDK allows user to login with Facebook. Here you have to get Facebook App ID from us to integrate in your app. After login process with Facebook SDK is successfully, send token with function below to login.

```swift
func loginWithFacebook(token: String) -> MSPromise<MSToken>
```

### Login MySabay

Login with MySabay is for user who has MySabay account. Call this function in your app to login.

```swift
func loginWithMySabay(username: String, password: String) -> MSPromise<MSToken>
```

### Register MySabay

To register as new MySabay user, call function below.

```swift
func registerMySabayAccount(username: String, password: String) -> MSPromise<MSToken>
```

### Check MySabay

Before calling [Register MySabay](#register-mysabay) account, you can check if username is already exist in MySabay system by calling function below.

```swift
func checkExistingMySabayUsername(username: String) -> MSPromise<Bool>
```

This will return a promise with boolean

- `true`: Username is already taken
- `false`: Username is available to use.

### Verify MySabay

This function is described in [Login Phone](#login-phone)

```swift
func verifyMySabay(username: String, password: String) -> MSPromise<MSToken>
```

### Request Creating MySabay With Phone

This function is described in [Login Phone](#login-phone)

```swift
func requestCreatingMySabayWithPhone(phoneNumber: String) -> MSPromise<(Bool?, String?)>
```

### Create MySabay Account with Phone 

This is finalizing the process with [requestCreatingMySabayWithPhone](#request-creating-mysabay-with-phone) after getting one-time password.

```swift
func createMySabayWithPhone(username: String, password: String, phoneNumber: String, otpCode: String) -> MSPromise<MSToken>
```

### Check Local Payment 

Some user might not be eligible for local payment with MySabay. Call this function to check the availability. This will return a promise with boolean.

- `true`: User is eligible for local payment with MySabay 

- `false`: User is not eligible. Only in-app purchase is an option for purchase.

```swift
func getLocalPaymentStatus() -> MSPromise<Bool>
```

### Get Profile

This is to get user's profile.

```swift
func getUserProfile() -> MSPromise<MSUserProfile>
```

### Refresh Tokens

Call this function to refresh login's tokens.

```swift
func refreshTokens() -> MSPromise<MSToken>
```

### Verify Tokens

To check if token is verified, call this function.

```swift
func verifyTokens() -> MSPromise<Bool>
```

### Logout

To logout user, call this function

```swift
func logout(all: Bool) -> MSPromise<String>
```

### Tokens Management

MySabay SDK will manage tokens when loggin in with UI support. For functionalities, you have to manage tokens manually for later use.

```swift
MSAccessToken.setCurrentToken(token: token.accessToken)
MSRefreshToken.setCurrentToken(token: token.refreshToken)
```

```swift
MSMySabaySDK.shared.verifyOtp(phoneNumber: phone, otp: otp)
    .then { token in
        MSAccessToken.setCurrentToken(token: token.accessToken)
        MSRefreshToken.setCurrentToken(token: token.refreshToken)
    }.catch{ error in
        print(error.localizedDescription)
    }
```

```swift
MSMySabaySDK.shared.refreshTokens()
    .then { token in
        MSAccessToken.setCurrentToken(token: token.accessToken)
        MSRefreshToken.setCurrentToken(token: token.refreshToken)
    }
    .catch { error in
        print(error.localizedDescription)
    }
```


