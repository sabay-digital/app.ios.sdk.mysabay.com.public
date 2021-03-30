// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "MySabaySdk",
	products: [
		.library(name: "MySabaySdk", targets: ["MySabaySdk"]),
	],
	dependencies: [
		.package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "19.0.0"),
		.package(url: "https://github.com/marmelroy/PhoneNumberKit", from: "3.3.1"),
		.package(url: "https://github.com/rexmas/JSONValue.git", from: "7.0.0"),
		.package(url: "https://github.com/facebook/facebook-ios-sdk", from: "8.2.0"),
		.package(url: "https://github.com/apollographql/apollo-ios.git", from: "0.37.0"),
		.package(url: "https://github.com/ralfebert/TinyHashes", .branch("master")),
		.package(url: "https://github.com/bizz84/SwiftyStoreKit.git", from: "0.16.3"),
		.package(url: "https://github.com/ReSwift/ReSwift.git", from: "6.0.0"),
		.package(url: "https://github.com/matomo-org/matomo-sdk-ios.git", from: "7.4.1"),
		.package(url: "https://github.com/onevcat/Kingfisher.git", from: "6.1.1"),
	],
	targets: [
		.target(name: "MySabaySdk", dependencies: [
					"JSONValue",
					"Kingfisher",
					"PhoneNumberKit",
					"ReSwift",
					"SwiftyStoreKit",
					"TinyHashes",
					"apollo-ios",
					"facebook-ios-sdk",
					"keychain-swift",
					"matomo-sdk-ios"], path: "./Sources/MySabaySdk.xcframework")
	]
)

warning: adding embedded git repository: .build/checkouts/JSONValue
warning: adding embedded git repository: .build/checkouts/Kingfisher
warning: adding embedded git repository: .build/checkouts/PathKit
warning: adding embedded git repository: .build/checkouts/PhoneNumberKit
warning: adding embedded git repository: .build/checkouts/ReSwift
warning: adding embedded git repository: .build/checkouts/SQLite.swift
warning: adding embedded git repository: .build/checkouts/Spectre
warning: adding embedded git repository: .build/checkouts/Starscream
warning: adding embedded git repository: .build/checkouts/Stencil
warning: adding embedded git repository: .build/checkouts/SwiftyStoreKit
warning: adding embedded git repository: .build/checkouts/TinyHashes
warning: adding embedded git repository: .build/checkouts/apollo-ios
warning: adding embedded git repository: .build/checkouts/facebook-ios-sdk
warning: adding embedded git repository: .build/checkouts/keychain-swift
warning: adding embedded git repository: .build/checkouts/matomo-sdk-ios


