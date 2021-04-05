# Store API for MySabay iOS SDK

MySabay SDK provides UI support and functionalities for your app to access store process.

## UI Support

MySabay SDK built-in with ui support for access store. This will make you easy without making your own ui show store products or handle payment process.

### Store Process

Call this function if you want to use ui support for store, all you will do is to wait for result. 

```swift
MSMySabaySDK.shared.openStoreScreen { result in
    switch result {
        case let .success(purchase):
        break
        case let .failure(error):
        break
    }
}
```

## Funtionalities

## Store Products

To get all store products for your service, call this function. 

```swift
func getStoreProducts() -> MSPromise<[MSStoreProduct]>
```

Each store product has it own supported providers. To get providers for specific product, call this function.

```swift
func getPaymentServiceProvidersByProduct(productId: String) -> MSPromise<[MSPsProviderGroup]>
```

## Payment Detail

Every purchase with MySabay SDK has to be recorded in our network. Call function below before doing any purchase

```swift
createPaymentDetail(pspId: String, items: [invoice_JSONObject], amount: Double, currency: MSCurrency) -> MSPromise<(MSPaymentDetail, String)>
```

## In App Purchase

To purchase with iOS in-app purchase, call below function. 

```swift
func purchaseIapProduct(productIdentifier: String) -> MSPromise<PurchaseDetails>
```

To fetch iOS in-app purchase receipt, call this function.

```swift
func fetchInAppPurchaseReceiptData() -> MSPromise<Data>
```

To verify iOS in-app purchase, call this function.

```swift
func verifyInAppPurcahse(paymentDetail: MSPaymentDetail, invoiceId: String, receiptData: Data) -> MSPromise<String>
```

To finish in-app purchase transation that needs finishing, call this function in you `appDelegate`

```swift
func completeTransactions()
```

## Pre Authorization Purchase 

To make purchase with pre-authorization provider, call this function 

```swift
func createPreAuthPayment(paymentDetail: MSPaymentDetail, invoiceId: String) -> MSPromise<String>
```

## One Time Purchase

To make purchase with one-time provider, you have to create [Payment Detail](#payment-detail). For detail instruction to process one-time payment, you can read [One-Time Instruction](). 

## Payment Status

When purchase is finished, you have to check status for invoice that you have created for payment. This is the final step to make sure that purchase is paid in our system. To check payment status, call this function.

```swift
func checkPaymentStatus(invoiceId: String) -> MSPromise<MSInvoice>
```

Invoice status will take some time to update. To check payment status schedully, call this function.

```swift
func scheduledCheckPaymentStatus(invoiceId: String, interval: TimeInterval, repeats: Int) -> MSPromise<MSInvoice>
```

These will return a promise with invoice object with `paid` status that means purchase is successful.

## How Can I Implement Purchase With MySabay SDK?

To implement purchase with MySabay SDK, it will take some steps based on payment provider:

### In-app purchase

    1. Create payment detail
    2. Purchase with StoreKit
    3. Fetch receipt data
    4. Verfify purcahse
    5. Check payment status

### Pre-authorization purchase

    1. Create payment detail
    2. Create pre-auth payment
    3. Check payment status

### One-time purchase

    1. Create payment detail
    2. Compose html template with payment detail
    3. Process payment on web
    4. Check payment status


