// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "ValidationKit",
	platforms: [
		.macOS(.v13),
		.iOS(.v13),
		.watchOS(.v6),
		.tvOS(.v13),
		.macCatalyst(.v13),
		.visionOS(.v1),
	],
	products: [
		.library(
			name: "ValidationKit",
			targets: ["ValidationKit"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-testing.git", branch: "main"),
	],
	targets: [
		.target(
			name: "ValidationKit"
		),
		.testTarget(
			name: "ValidationKitTests",
			dependencies: [
				"ValidationKit",
				.product(name: "Testing", package: "swift-testing"),
			]
		),
	]
)
