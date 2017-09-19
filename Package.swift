// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "DiffPerformanceSuite",
    products: [
        .executable(name: "PerformanceTester", targets: ["PerformanceTester"])
    ],
    dependencies: [
        .package(url: "https://github.com/tonyarnold/Differ.git", .branch("master")),
        .package(url: "https://github.com/jflinter/Dwifft.git", .branch("master"))
    ],
    targets: [
        .target(name: "PerformanceTester", dependencies: ["Differ", "Dwifft"], exclude: ["Samples"])
    ],
    swiftLanguageVersions: [4]
)
