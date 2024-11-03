// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "MLKitSPM",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "MLKitTranslate",
            targets: ["MLKitTranslate", "MLKitNaturalLanguage", "Common"])
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "2.4.0"),
        .package(url: "https://github.com/google/GoogleDataTransport.git", from: "10.1.0"),
        .package(url: "https://github.com/google/GoogleUtilities.git", from: "8.0.2"),
        .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "3.5.0"),
        .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "2.30910.0")),
        .package(url: "https://github.com/ZipArchive/ZipArchive.git", from: "2.6.0")
    ],
    targets: [
        // these binaryTarget will be overriden when GitHub actions run, so do not edit
        .binaryTarget(name: "MLKitTranslate", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.0/MLKitTranslate.xcframework.zip", checksum: "e68f3089ceb5ba22b4bd2b1467bf7ace91d47296ce0d594d949b56fb43b0cbad"),
        .binaryTarget(name: "MLKitNaturalLanguage", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.0/MLKitNaturalLanguage.xcframework.zip", checksum: "a95289834a1bf376c327250e7a008650a797b123ba4b120db2ad13b8c2d529e9"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.0/MLKitCommon.xcframework.zip", checksum: "0859fd54c38c12c7bc17141eb07d1fef09d5f4d6bcf29266d244d8d81685d1df"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.0/GoogleToolboxForMac.xcframework.zip", checksum: "e3e42adc27cb2f734e7126b7190d205ae6bdffca6bb44458e26ca4a1396260dd"),
        .target(
            name: "Common",
            dependencies: [
                "MLKitCommon",
                "GoogleToolboxForMac",
                .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                .product(name: "GULEnvironment", package: "GoogleUtilities"),
                .product(name: "GULLogger", package: "GoogleUtilities"),
                .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
                .product(name: "GULNetwork", package: "GoogleUtilities"),
                .product(name: "GULNSData", package: "GoogleUtilities"),
                .product(name: "GULReachability", package: "GoogleUtilities"),
                .product(name: "GULSwizzlerTestHelpers", package: "GoogleUtilities"),
                .product(name: "GULUserDefaults", package: "GoogleUtilities"),
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "FBLPromises", package: "promises"),
            ]),
    ]
)
