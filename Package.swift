// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "MVVMKit",
    platforms: [.iOS(.v17), .macOS(.v14), .macCatalyst(.v17), .tvOS(.v17), .watchOS(.v10)],
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
