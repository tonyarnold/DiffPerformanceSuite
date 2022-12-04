// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "DiffPerformanceSuite",
    platforms: [
        .macOS(.v10_12)
    ],
    products: [
        .executable(name: "PerformanceTester", targets: ["PerformanceTester"])
    ],
    dependencies: [
        .package(url: "https://github.com/tonyarnold/Differ.git", .branch("main")),
        .package(url: "https://github.com/jflinter/Dwifft.git", .branch("master"))
    ],
    targets: [
        .target(name: "PerformanceTester", dependencies: ["Differ", "Dwifft"], exclude: ["Samples"])
    ]
)
