// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SampleSwiftyModbus",
    dependencies: [
        .package(url: "https://github.com/DimaRU/SwiftyModbus.git", .upToNextMajor(from: "2.1.0"))
    ],
    targets: [
        .executableTarget(
            name: "SampleSwiftyModbus",
            dependencies: [
                .product(name: "SwiftyModbus", package: "SwiftyModbus"),
            ]),
        .executableTarget(
            name: "SampleSwiftyModbusPromise",
            dependencies: [
                .product(name: "SwiftyModbusPromise", package: "SwiftyModbus")
            ]),
        .executableTarget(
            name: "SampleSwiftyModbusResult",
            dependencies: [
                .product(name: "SwiftyModbus", package: "SwiftyModbus"),
            ]),
    ]
)
