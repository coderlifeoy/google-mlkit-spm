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
        .binaryTarget(name: "MLKitTranslate", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.0/MLKitTranslate.xcframework.zip", checksum: "7c2575945bb2fb728c38b2bbd1d6d6d57756a9ec5e22464c8d9cf04bce3e2cf9"),
        .binaryTarget(name: "MLKitNaturalLanguage", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.0/MLKitNaturalLanguage.xcframework.zip", checksum: "6e61009a898158df45d4ae8bbbd94148a72b145c24cdef6ea57ce92aa6418195"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.0/MLKitCommon.xcframework.zip", checksum: "997a9b902bf9202892740b022a35ff34005c1c568e9f9b23d63a02b432dcfee9"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.0/GoogleToolboxForMac.xcframework.zip", checksum: "e7c2ee710e5dbea3680f5bd37e9c0caee22253e72c2ac26935095c1630a5514c"),
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
