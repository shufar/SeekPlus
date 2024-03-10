// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "SeekPlusAPI",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "SeekPlusAPI", targets: ["SeekPlusAPI"]),
    .library(name: "SeekPlusAPITestMocks", targets: ["SeekPlusAPITestMocks"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "SeekPlusAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
    .target(
      name: "SeekPlusAPITestMocks",
      dependencies: [
        .product(name: "ApolloTestSupport", package: "apollo-ios"),
        .target(name: "SeekPlusAPI"),
      ],
      path: "./SeekPlusAPITestMocks"
    ),
  ]
)
