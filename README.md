# Google MLKit for Swift Package Manager

> This repo is used for generate SPM support for Google MLKit lib, which currently is only available on CocoaPods.

# Instructions

### Clone repo includes submodule:

```sh
$ git clone --recurse-submodules https://git.dktsoft.com:2008/sapo-mobile/google-mlkit-spm.git
```

### Install Google MLKit pods (using bundler or global `pod`)

```sh
$ bundle install
$ bundle exec pod install
```

### Run script to build and create xcframeworks

```sh
$ ./create-xcframeworks.sh
```

> This script will:
> - Build source-based libs then create xcframeworks for them (GoogleToolboxForMac, GoogleUtilitiesComponents, Protobuf)
> - Use `xcframework-maker` to split prebuilt frameworks to xcframeworks (MLImage, MLKitCommon, MLKitBarcodeScanning,...)
> - Compress xcframeworks as zips and generate SHA256 to use in `Package.swift`

### Create a new release
- Update `Package.swift` to change `.binaryTarget` url paths and checksums
- Create new release and attach xcframework zips to the release