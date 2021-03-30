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
			url: "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public/raw/1.0.31/MySabaySdk.zip",
			checksum: "1616297bcf20f507dde9e2f9c02037c62346fe573e03f7b8ab026c5058b35acc"
		),
    ]
)
