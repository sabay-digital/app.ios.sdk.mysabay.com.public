# Official MySabay SDK for iOS

**Table of Contents**
- [Introduction](#introduction)
- [SDK Functionalities](#sdk-functionalities)
  - [UI Support](#ui-support)
    - [User](#user)
    - [Store](#store)
  - [Functionalities support](#functionalities-support)
    - [User](#user-1)
    - [Store](#store-1)
    - [Tracking](#tracking)
- [Sample Project](#sample-project)

# Introduction

This is the official MySabay SDK for native iOS application.

- [Installation & Configuration](Documentation/INSTALLATION.md)
- [Authentication & Account](Documentation/ACCOUNT.md)
- [Store & Purchase](Documentation/STORE.md)
- [Tracking](Documentation/TRACKING.md)

# SDK Functionalities

Currently, MySabay SDK both provides UI support and functionalities Support

## UI Support

There are 2 main functions offered by sdk to use built-in ui support 

### User

|         Function        |           Desciption              |
| ----------------------- | --------------------------------- |
| ```func openLoginScreen(resultHandler: @escaping MSMySabayResultHandler<MSToken>)``` | Open ui support for user process. In this function SDK handle many processes of user management as below <ul><li>Login with Phone number</li><li>Login with Mysabay</li><li>Login with Facebook</li><li>Register MySabay account</li><li>Register MySabay account</li><li>Create new MySabay account related to phone number</li><li>Logout</li></ul> |

### Store

|         Function        |           Desciption              |
| ----------------------- | --------------------------------- |
| ```func openStoreScreen(resultHandler: @escaping MSMySabayResultHandler<MSPurchase>)``` | Open ui support for store process. In this function SDK handle many processes of store management as below <ul><li>Show store products</li><li>Checkout payment service provider</li><li>Purchase with three type of payment</li><ul><li>MySabay</li><li>In app purchase</li><li>Other Payment Options</li></ul></ul> | 

In ui support you can also use theses function too.
|         Function        |           Desciption              |
| ----------------------- | --------------------------------- |
| ```func getUserProfile() -> MSPromise<MSUserProfile>``` | To get user's profile. |
| ```func refreshTokens() -> MSPromise<MSToken>``` | To refresh login's tokens. |
| ```func verifyTokens() -> MSPromise<Bool>``` | To check if token is verified |
| ```func logout(all: Bool) -> MSPromise<String>``` | To logout user |

## Functionalities support

### User

|         Function        |           Desciption              |
| ----------------------- | --------------------------------- |
| ```func loginGuest() -> MSPromise<MSToken>``` | Login without providing credential but You need to provide your deviceId, MySabay SDK allow user to login as a guest. |
| ```func loginWithPhone(phoneNumber: String) -> MSPromise<(String, Bool, String)>``` | Login with phone number and waiting for one-time password to verify. |
| ```func verifyOtp(phoneNumber: String, otp: String) -> MSPromise<MSToken>``` | Verify phone number with one-time otp-code to server for verification. |
| ```func loginWithFacebook(token: String) -> MSPromise<MSToken>``` | Login with Facebook by passing token form login with Facebook SDK. <br/><b>Note</b> You need to get Facebook app id from us |
| ```func loginWithMySabay(username: String, password: String) -> MSPromise<MSToken>``` | Login with MySabay if you have MySabay account |
| ```func registerMySabayAccount(username: String, password: String) -> MSPromise<MSToken>``` | Register new user MySabay account|
| ```func verifyMySabay(username: String, password: String) -> MSPromise<MSToken>``` | Confirm MySabay account in case you login with phone number that related to MySabay account So you need to confirm MySabay account to login without confirm with otp-code |
| ```func requestCreatingMySabayWithPhone(phoneNumber: String) -> MSPromise<(Bool?, String?)>``` | In case you cannot confirm MySabay account you can use this function to request new MySabay account that related to your phone number |
| ```func createMySabayWithPhone(username: String, password: String, phoneNumber: String, otpCode: String) -> MSPromise<MSToken>``` | After request new MySabay Account You need to use this function to create new MySabay account that related to your phone number|
| ```func checkExistingMySabayUsername(username: String) -> MSPromise<Bool>``` | Before calling `Register MySabay` account, you can use this function to check username is already exist or not in MySabay system.|
| ```func getUserProfile() -> MSPromise<MSUserProfile>``` | To get user's profile. |
| ```func getLocalPaymentStatus() -> MSPromise<Bool>``` | To check if user is eligible for local payment. |
| ```func refreshTokens() -> MSPromise<MSToken>``` | To refresh login's tokens. |
| ```func verifyTokens() -> MSPromise<Bool>``` | To check if token is verified |
| ```func logout(all: Bool) -> MSPromise<String>``` | To logout user |

## Store 
|         Function        |           Desciption              |
| ----------------------- | --------------------------------- |
| ```func getStoreProducts() -> MSPromise<[MSStoreProduct]>``` | To get all store products |
| ```func getPaymentServiceProvidersByProduct(productId: String) -> MSPromise<[MSPsProviderGroup]>``` | Each store product has it own supported providers. Call this function to get providers for specific product |
| ```func createPaymentDetail(pspId: String, items: [invoice_JSONObject], amount: Double, currency: MSCurrency) -> MSPromise<(MSPaymentDetail, String)>``` | To create a purchase you need to call this function to get payment data |
| ```func createPreAuthPayment(paymentDetail: MSPaymentDetail, invoiceId: String) -> MSPromise<String>``` | To make purchase with pre-authorization provider |
| ```func purchaseIapProduct(productIdentifier: String) -> MSPromise<MSIapPurchase>``` | To make purchase with in-app purchase provider |
| ```func fetchInAppPurchaseReceiptData() -> MSPromise<Data>``` | To fetch receipt data for in-app purchase |
| ```func verifyInAppPurcahse(paymentDetail: MSPaymentDetail, invoiceId: String, receiptData: Data) -> MSPromise<String>``` | To verify in-app purchase |
| ```func checkPaymentStatus(invoiceId: String) -> MSPromise<MSInvoice>``` | The final step to check that purchase is paid or not|
| ```func scheduledCheckPaymentStatus(invoiceId: String, interval: TimeInterval, repeats: Int) -> MSPromise<MSInvoice>``` | The final step to check that purchase is paid or not as schedule|
| ```func getHtmlTemplate(paymentDetail: MSPaymentDetail, invoiceId: String) -> String``` | Get HTML template with payment detail and invoice ID to process One-Time payment |
| ```func getRequestWithAdditionalHeader(paymentDetail: MSPaymentDetail, request: URLRequest) -> URLRequest``` | Get request object with additional header of payment detail|

### Tracking

|         Function        |           Desciption              |
| ----------------------- | --------------------------------- |
| ```func trackPageView(screens: [String])``` | Track screen where the user visit |
| ```func trackEvent(event: MSTrackingEvent)``` | Tracking events triggered by the user's action or any processes of the app |
| ```func trackOrder(order: MSTrackingOrder)``` | Track when purchase is made in the app |
| ```func setCustomUserId(userId: String)``` | Set a custom user ID for user tracking |

## Sample Project

- [MySabaySdkExample](https://git.sabay.com/lay.channara/app.ios.sdk.mysabay.com.sample.ui): an sample project with demonstration of MySabay SDK UI support.


