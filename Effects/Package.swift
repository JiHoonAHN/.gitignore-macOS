// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Effects",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Effects",
            targets: ["Effects"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", branch: "main")
    ],
    targets: [
        .target(
            name: "Effects",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .testTarget(
            name: "EffectsTests",
            dependencies: ["Effects"]),
    ]
)
