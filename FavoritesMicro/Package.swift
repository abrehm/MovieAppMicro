// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoritesMicro",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FavoritesMicro",
            targets: ["FavoritesMicro"]),
    ],
    dependencies: [
        .package(path: "Navigation"),
        .package(path: "ApiService"),
        .package(path: "UserData"),
        .package(path: "CommonUI"),
        .package(path: "DataModels"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FavoritesMicro",
            dependencies: ["Navigation", "ApiService", "UserData", "CommonUI", "DataModels"]),
        .testTarget(
            name: "FavoritesMicroTests",
            dependencies: ["FavoritesMicro"]),
    ])
