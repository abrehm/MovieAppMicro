// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApiService",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ApiService",
            targets: ["ApiService"]
        ),
    ],
    dependencies: [
        .package(path: "DataModels"),
        // TESTING
        .package(url: "https://github.com/Quick/Quick", from: "7.4.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "13.2.0"),
        .package(url: "https://github.com/nalexn/ViewInspector", from: "0.9.10"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ApiService",
            dependencies: ["DataModels"],
            resources: [
                .copy("Resources/batman.json"),
                .copy("Resources/superman.json"),
                .copy("Resources/wonderwoman.json"),
            ]
        ),
        .testTarget(
            name: "ApiServiceTests",
            dependencies: [
                "ApiService",
                .product(name: "Quick", package: "Quick"),
                .product(name: "Nimble", package: "Nimble"),
                .product(name: "ViewInspector", package: "ViewInspector"),
            ]
        ),
    ]
)
