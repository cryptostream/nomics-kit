// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NomicsKit",
    products: [
        .library(
            name: "NomicsKit",
            targets: ["NomicsKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "NomicsKit",
            dependencies: []),
        .testTarget(
            name: "NomicsKitTests",
            dependencies: ["NomicsKit"]),
    ],
    swiftLanguageVersions: [.v5]
)
