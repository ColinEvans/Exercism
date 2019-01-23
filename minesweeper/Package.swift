// swift-tools-version:4.1

import PackageDescription

let package = Package(
    name: "Minesweeper",
    products: [
        .library(
            name: "Minesweeper",
            targets: ["Minesweeper"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Minesweeper",
            dependencies: []),
        .testTarget(
            name: "MinesweeperTests",
            dependencies: ["Minesweeper"]),
    ]
)
