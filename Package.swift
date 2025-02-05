// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Kamera",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "Kamera", targets: ["Kamera"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "Kamera")
    ],
    swiftLanguageModes: [.v6]
)
