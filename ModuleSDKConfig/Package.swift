// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModuleSDKConfig",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ModuleSDKConfig",
            targets: ["ModuleSDKConfig"]),
    ],
    dependencies: [
        .package(url: "https://github.com/aringenbach/ModuleSDK", exact: "0.0.1"),
        .package(url: "https://github.com/aringenbach/onboardingTitleProvider", branch: "main"),
        .package(url: "https://github.com/aringenbach/rustSDKModule", branch: "main"),
    ],
    targets: [
        .target(
            name: "ModuleSDKConfig",
            dependencies: [
                "ModuleSDK",
                .product(name: "OnboardingTitleProvider", package: "onboardingTitleProvider"),
                .product(name: "RustSDKModule", package: "rustSDKModule"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "ModuleSDKConfigTests",
            dependencies: ["ModuleSDKConfig"],
            path: "Tests"
        ),
    ]
)
