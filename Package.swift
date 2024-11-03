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
        .binaryTarget(name: "MLKitTranslate", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.1/MLKitTranslate.xcframework.zip", checksum: "e2baec2a9f53c9c84ec7ab5987effee32f734548ac79783e9a3bd11ac625b9d3"),
        .binaryTarget(name: "MLKitNaturalLanguage", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.1/MLKitNaturalLanguage.xcframework.zip", checksum: "f741469668e47928ad78f2bc8fc186b9e035ea4facd7ecb56bd3fabed81688be"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.1/MLKitCommon.xcframework.zip", checksum: "21ce75c78740139ba62e14e75656b079387f49bc87390d89fe4b7db8d82f3387"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/coderlifeoy/google-mlkit-spm/releases/download/1.0.1/GoogleToolboxForMac.xcframework.zip", checksum: "997355e391f479f59973acda1e86cf0a4a4dfe2a7cfd39ecc91b64d545849646"),
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
