// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "MySabaySdk",
	products: [
		.library(name: "MySabaySdk", targets: ["MySabaySdkFramework", "MySabaySdkDependencies"])
	],
	dependencies: [
		.package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "19.0.0"),
		.package(url: "https://github.com/marmelroy/PhoneNumberKit", from: "3.3.1"),
		.package(url: "https://github.com/rexmas/JSONValue.git", from: "7.0.0"),
		.package(url: "https://github.com/facebook/facebook-ios-sdk", from: "8.2.0"),
		.package(url: "https://github.com/apollographql/apollo-ios.git", from: "0.37.0"),
		.package(url: "https://github.com/bizz84/SwiftyStoreKit.git", from: "0.16.3"),
		.package(url: "https://github.com/ReSwift/ReSwift.git", from: "6.0.0"),
		.package(url: "https://github.com/matomo-org/matomo-sdk-ios.git", from: "7.4.1"),
		.package(url: "https://github.com/onevcat/Kingfisher.git", from: "6.1.1")
	],
	targets: [
		.binaryTarget(name: "MySabaySdkFramework", path: "./Sources/MySabaySdkFramework/MySabaySdk.xcframework"),
		.target(name: "MySabaySdkDependencies", dependencies: ["keychain-swift",
															   "PhoneNumberKit",
															   "JSONValue",
															   "facebook-ios-sdk",
															   "apollo-ios",
															   "SwiftyStoreKit",
															   "ReSwift",
															   "matomo-sdk-ios",
															   "Kingfisher"], path: "./Sources/MySabaySdkDependencies")
	]
)
