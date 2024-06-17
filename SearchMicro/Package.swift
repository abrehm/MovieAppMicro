// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SearchMicro",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SearchMicro",
            targets: ["SearchMicro"]
        ),
    ],
    dependencies: [
        .package(path: "Navigation"),
        .package(path: "CommonUI"),
        .package(path: "ApiService"),
        .package(path: "UserData"),
        .package(path: "DataModels"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SearchMicro",
            dependencies: ["Navigation", "CommonUI", "ApiService", "UserData", "DataModels"]
        ),
        .testTarget(
            name: "SearchMicroTests",
            dependencies: ["SearchMicro"]
        ),
    ]
)
