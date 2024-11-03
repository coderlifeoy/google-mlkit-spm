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
        .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "3.30910.0")),
        .package(url: "https://github.com/ZipArchive/ZipArchive.git", from: "2.6.0")
    ],
    targets: [
        // these binaryTarget will be overriden when GitHub actions run, so do not edit
        .binaryTarget(name: "MLKitTranslate", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLKitTranslate.xcframework.zip", checksum: "7c09d37bf4893f751cce8f326d8c53518be11e4d7af0f45e51822747f2185a2c"),
        .binaryTarget(name: "MLKitNaturalLanguage", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLKitNaturalLanguage.xcframework.zip", checksum: "8ed5acba6485f9ba42cd594dc3e93b470fe4f7149578f2cac515087e20b519fa"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLKitCommon.xcframework.zip", checksum: "902ef4d7d13aee7eaf23126f6f0e48e1abd3e5c183279c731ad8565f2b18d809"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/GoogleToolboxForMac.xcframework.zip", checksum: "895fea05c555c16a4d60823a8f831e9b176b6cb7982e5c35b7e547000c31e476"),
        .target(
            name: "Common",
            dependencies: [
                "MLKitCommon",
                "GoogleToolboxForMac",
                "GoogleUtilitiesComponents",
                "Protobuf",
                .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                .product(name: "GULEnvironment", package: "GoogleUtilities"),
                .product(name: "GULISASwizzler", package: "GoogleUtilities"),
                .product(name: "GULLogger", package: "GoogleUtilities"),
                .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
                .product(name: "GULNSData", package: "GoogleUtilities"),
                .product(name: "GULNetwork", package: "GoogleUtilities"),
                .product(name: "GULReachability", package: "GoogleUtilities"),
                .product(name: "GULUserDefaults", package: "GoogleUtilities"),
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "FBLPromises", package: "promises"),
            ]),
    ]
)
