// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "MySabaySdk",
	products: [
		.library(
			name: "MySabaySdk",
			targets: ["MySabaySdk"]),
	],
	dependencies: [
		// .package(url: /* package url */, from: "1.0.0"),
	],
	targets: [
		.binaryTarget(
			name: "MySabaySdk",
			path: "./Sources/MySabaySdk.xcframework")
	]
)
