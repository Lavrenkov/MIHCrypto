// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MIHCrypto",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "MIHCrypto",
            targets: [
                "MIHCryptoCore", "MIHCryptoMathematics", "MIHCryptoAES", 
                "MIHCryptoDES", "MIHCryptoEC", "MIHCryptoMD5", 
                "MIHCryptoRSA", "MIHCryptoSHA"
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", from: "1.1.180")
    ],
    targets: [
        .target(
            name: "MIHCryptoCore",
            dependencies: [.product(name: "OpenSSL", package: "OpenSSL")],
            path: "MIHCrypto/Core",
            sources: ["."],
            publicHeadersPath: ".",
            cSettings: [
                .define("LIBRESSL"),
                .headerSearchPath(".")
            ],
            linkerSettings: [
                .unsafeFlags(["-L${PODS_ROOT}/OpenSSL-Universal/lib-ios"])
            ]
        ),
        .target(
            name: "MIHCryptoMathematics",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/Mathematics",
            sources: ["."]
        ),
        .target(
            name: "MIHCryptoAES",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/AES",
            sources: ["."]
        ),
        .target(
            name: "MIHCryptoDES",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/DES",
            sources: ["."]
        ),
        .target(
            name: "MIHCryptoEC",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/EC",
            sources: ["."]
        ),
        .target(
            name: "MIHCryptoMD5",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/MD5",
            sources: ["."]
        ),
        .target(
            name: "MIHCryptoRSA",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/RSA",
            sources: ["."]
        ),
        .target(
            name: "MIHCryptoSHA",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/SHA",
            sources: ["."]
        )
    ],
    swiftLanguageVersions: [.v5]
)
