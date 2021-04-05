# Tracking API for MySabay iOS SDK

MySabay SDK provides functions for tracking in your app.

## Functions

### Tracking Screens

This function can be called on screen that triggers when the user visits.

```swift
func trackPageView(screens: [String])
```

- `screens: [String]`: An array of strings of page title. You can use this to create a hierachical and logical grouping of screen views. For iOS, ios will always appear at the top level of the hierachy.

### Tracking Event

This function can be called to track events triggered by the user's action or any processes of the app.

```swift
func trackEvent(event: MSTrackingEvent)
```

- `event: MSTrackingEvent`: Event object that you want to track.

`MSTrackingEvent`

- `category: String`: defines a category that the event should be in.

- `action: String`: defines what kind of action triggers this event.

- `name: String`: defines the name of the event.

- `value: NSNumber`: defines the value of the event (Optional: default value is nil). 

### Tracking Order

This function can be called to track when purchase is made in the app.

```swift
func trackOrder(order: MSTrackingOrder)
```

- `order: MSTrackingOrder`: Order object that you want to track.

`MSTrackingOrder`

- `id: String`: defines a order id
- `items: [OrderItem]`: defines the array of items of order
- `revenue: Float`: defines the revenue of order
- `subTotal: Float`: defines the sub total of order (Optional)
- `tax: Float`: defines the tax of order (Optional)
- `shippingCost: Float`: defines the shipping cost of order (Optional)
- `discount: Float`: defines the discount of order (Optional)

### Custom User ID

This function can be called to set a custom user ID in place of the default UUID created for each visitor.

```swift
func setCustomUserId(userId: String)
```

- `userId: String`: defines a custom ID to be used to identify a user.

## Internal Tracking

We automatically track page views and events within the SDK. The following will outline where and how we track these data.

### Tracking Screens

The following screens are automatically tracked on when the user visits.

`trackPageView` automatically adds `[PLATFORM]` to the beginning of the array. In this iOS SDK, it adds `ios`. This properly defines structure for the data to be viewed later on the Matomo dashboard. For Example, `["sdk", "login-screen"]` will show up as `ios/sdk/login-screen` in the dashboard.

| Screen                                 | ViewController                | Code                                                                         |
| -------------------------------------- | ----------------------------- | ---------------------------------------------------------------------------- |
| Main Login Screen                      | `MSPhoneController`           | `trackingService.trackPageView(screens: ["sdk", "login-screen"])`            |
| Verify OTP Screen                      | `MSOtpController`             | `trackingService.trackPageView(screens: ["sdk", "otp-screen"])`              |
| Verify Existing MySabay Account Screen | `MSVerifyMySabayController`   | `trackingService.trackPageView(screens: ["sdk", "verify-mysabay-screen"])`   |
| Register for a MySabay Account Screen  | `MSRegisterMySabayController` | `trackingService.trackPageView(screens: ["sdk", "register-mysabay-screen"])` |
| Store Screen                           | `MSProductController`         | `trackingService.trackPageView(screens: ["sdk", "product-screen"])`          |

### Tracking Event

There are many places in the SDK that we use` trackEvent`. Mainly, we use it to track user's interaction and any important processes of the app.

The function takes the following arguments and standards are defined for these arguments as stated below:
  - `category: String`: the format for category is `[PLATFORM]/sdk/[SCOPE]`. Platform can be either `ios` or `android`, where there are 3 defined Scopes for the SDK, `sso`, `store` and `payment`.
    - `sso`: used when the event triggered anywhere within the login/register scope.
    - `store`: used when the event triggered anywhere within the store scope.
    - `payment`: used when the event triggered anywhere within the payment scope.
  - `action: String`: there are currently two actions for the SDK, `tap` and `process`.
    - `tap`: used when the user taps on something on the screen.
    - `process`: used whenever there's a process to be completed within the app. For example, you can use this event to track whether the payment is successful or not. Please refer to the code example below for more details.
  - `name: String`: used to identify the event and it should be given a meaningful name. It should follow kebab-case convention. Avoid using abbreviations.

You should implement `input` tracking for all buttons in the SDK. For example,

```swift
// Track when the user taps login
var event = MSTrackingEvent()
event.category = "ios-sdk-sso"
event.action = "tap"
event.name = "login-with-phone-number"
MSMySabaySDK.shared.trackEvent(event: event)
```

You should implement `process` tracking for any important API call. This will allow us to track whether the call is successful or not.

```swift
MSMySabaySDK.shared.loginWithMySabay(username: username, password: password)
    .then { token in
        // Track event when the user login with mysabay successfully
        var event = MSTrackingEvent()
        event.category = "ios-sdk-sso"
        event.action = "process"
        event.name = "login-mysabay-success"
        MSMySabaySDK.shared.trackEvent(event: event)
    }.catch { error in
        // Track event when the user failed to login with mysabay
        var event = MSTrackingEvent()
        event.category = "ios-sdk-sso"
        event.action = "process"
        event.name = "login-mysabay-fail"
        MSMySabaySDK.shared.trackEvent(event: event)
    }
```



