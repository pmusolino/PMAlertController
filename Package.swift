// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PMAlertController",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "PMAlertController",
            targets: ["PMAlertController"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PMAlertController",
            dependencies: [],
            path:"Library",
            resources: [.process("PMAlertController.xib")]
        )
    ]
)
