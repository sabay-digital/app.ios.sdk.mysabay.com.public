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
			checksum: "179e3c4129c1350b66892f6e914563922afb862a45869c843c8290df6faaf565"
		),
    ]
)
