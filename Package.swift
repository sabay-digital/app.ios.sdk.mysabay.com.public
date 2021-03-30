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
			url: "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public/raw/2.0.0/MySabaySdk.zip",
			checksum: "82243f079d834e169c3afd88c3a15287130f1e582dbc321fde1c195d40c4f999"
		),
    ]
)
