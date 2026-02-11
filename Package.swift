// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "MVVMKit",
    platforms: [.iOS(.v13), .macOS(.v10_15), .macCatalyst(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "MVVMKit",
            targets: ["MVVMKit"]
        ),
    ],
    targets: [
        .target(
            name: "MVVMKit",
            path: "Sources"
        )
    ],
    swiftLanguageModes: [.v6]
)
