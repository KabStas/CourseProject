// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "courseProject",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0")
    ],

    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                ],
            resources: [
                .process("dict.json")
                ]
        ),
        .target(
            name: "Run",
            dependencies: ["App"]
        ), 
        .target(
            name: "APICore",
            dependencies: ["App",.product(name: "Vapor", package: "vapor")]
        ), 
        .target(
            name: "RunAPI",
            dependencies: ["APICore"]
        ), 
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]
        ),
    ]
)