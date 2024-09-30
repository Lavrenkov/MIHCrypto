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
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", .revision("8cb1d641ab5ebce2cd7cf31c93baef07bed672d4"))
    ],
    targets: [
        .target(
            name: "MIHCryptoCore",
            dependencies: [.product(name: "OpenSSL", package: "OpenSSL")],
            path: "MIHCrypto/Core",
            sources: [".", "../Utils"],
            publicHeadersPath: ".",
            cSettings: [
                .define("LIBRESSL"),
                .headerSearchPath("."),
                .headerSearchPath("../Utils")
            ],
            linkerSettings: [
                .unsafeFlags(["-L${PODS_ROOT}/OpenSSL-Universal/lib-ios"])
            ]
        ),
        .target(
            name: "MIHCryptoMathematics",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/Mathematics",
            sources: ["."],
            cSettings: [
                .define("LIBRESSL"),
                .headerSearchPath("../Utils")
            ]

        ),
        .target(
            name: "MIHCryptoAES",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/AES",
            sources: ["."],
            cSettings: [
                .define("LIBRESSL"),
                .headerSearchPath("../Utils")
            ]
        ),
        .target(
            name: "MIHCryptoDES",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/DES",
            sources: ["."],
            cSettings: [
                .define("LIBRESSL"),
                .headerSearchPath("../Utils")
            ]
        ),
        .target(
            name: "MIHCryptoEC",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/EC",
            sources: ["."],
            cSettings: [
                .define("LIBRESSL"),
                .headerSearchPath("../Utils")
            ]
        ),
        .target(
            name: "MIHCryptoMD5",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/MD5",
            sources: ["."],
            cSettings: [
                .define("LIBRESSL"),
                .headerSearchPath("../Utils")
            ]
        ),
        .target(
            name: "MIHCryptoRSA",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/RSA",
            sources: ["."],
            cSettings: [
                .define("LIBRESSL"),
                .headerSearchPath("../Utils")
            ]
        ),
        .target(
            name: "MIHCryptoSHA",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/SHA",
            sources: ["."],
            cSettings: [
                .define("LIBRESSL"),
                .headerSearchPath("../Utils")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
