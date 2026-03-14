// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "MVVMKit",
    platforms: [.iOS(.v14), .macOS(.v11), .macCatalyst(.v14), .tvOS(.v14), .watchOS(.v7)],
    products: [
        .library(
            name: "MVVMKit",
            targets: ["MVVMKit"]
        ),
    ],
    targets: [
        .target(
            name: "MVVMKit",
            path: "Sources",
            swiftSettings: [.define("DEBUG", .when(configuration: .debug))]
        )
    ],
    swiftLanguageModes: [.v6]
)
