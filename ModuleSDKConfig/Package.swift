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
        .package(path: "../element-x-ios/Modules/ModuleSDK"),
        .package(path: "../Modules/OnboardingTitleProvider"),
        .package(path: "../Modules/RustSDKModule"),
    ],
    targets: [
        .target(
            name: "ModuleSDKConfig",
            dependencies: [
                "ModuleSDK",
                "OnboardingTitleProvider",
                "RustSDKModule",
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
