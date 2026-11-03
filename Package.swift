// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BCSourceEditor",
    platforms: [.macOS("27.0")],
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
            revision: "a4d85a0893efa909be7e6c771b523e40f32cf0a4"
        ),
        // tree-sitter languages
        .package(
            url: "https://github.com/scholzdev/BCLanguages.git",
            revision: "6764a1d6f847993ff6477ebd05de32349cf71ba9"
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
