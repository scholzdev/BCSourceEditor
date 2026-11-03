// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BCSourceEditor",
    platforms: [.macOS(.v13)],
    products: [
        // A source editor with useful features for code editing.
        .library(
            name: "BCSourceEditor",
            targets: ["BCSourceEditor"]
        )
    ],
    dependencies: [
        // A fast, efficient, text view for code.
        .package(
            url: "https://github.com/scholzdev/BCTextView.git",
            revision: "e104ce792a4ceb0c947faca3775c85d06dee8708"
        ),
        // tree-sitter languages
        .package(
            url: "https://github.com/scholzdev/BCLanguages.git",
            revision: "1896740bdd6fde137e084216bd7d6f29c9f6622b"
        ),
        // SwiftLint
        .package(
            url: "https://github.com/lukepistrol/SwiftLintPlugin",
            from: "0.2.2"
        ),
        // Rules for indentation, pair completion, whitespace
        .package(
            url: "https://github.com/ChimeHQ/TextFormation",
            from: "0.8.2"
        ),
        .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "1.0.0")
    ],
    targets: [
        // A source editor with useful features for code editing.
        .target(
            name: "BCSourceEditor",
            dependencies: [
                "BCTextView",
                "BCLanguages",
                "TextFormation"
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        ),

        // Tests for the source editor
        .testTarget(
            name: "BCSourceEditorTests",
            dependencies: [
                "BCSourceEditor",
                "BCLanguages",
                .product(name: "CustomDump", package: "swift-custom-dump")
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        ),
    ]
)
