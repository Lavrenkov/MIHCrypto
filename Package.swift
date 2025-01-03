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
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", .revision("8729614a93e6b20307db3c3359aed81f030facaa"))
    ],
    targets: [
        .target(
            name: "MIHCryptoCore",
            dependencies: [.product(name: "OpenSSL", package: "OpenSSL")],
            path: "MIHCrypto/Core",
            publicHeadersPath: "include",  // Updated
            cSettings: [
                .define("LIBRESSL"),
                .define("SWIFTPM"),
                .headerSearchPath("include/MIHCrypto"),  // Updated
                .headerSearchPath("../Utils/include/MIHCrypto")  // Updated
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
            publicHeadersPath: "include",  // Updated
            cSettings: [
                .define("LIBRESSL"),
                .define("SWIFTPM"),
                .headerSearchPath("../Utils/include/MIHCrypto"),
                .headerSearchPath("include/MIHCrypto"),
                .headerSearchPath("../Core/include/MIHCrypto")
            ]
        ),
        .target(
            name: "MIHCryptoAES",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/AES",
            sources: ["."],
            publicHeadersPath: "include",  // Updated
            cSettings: [
                .define("LIBRESSL"),
                .define("SWIFTPM"),
                .headerSearchPath("../Utils/include/MIHCrypto"),
                .headerSearchPath("include/MIHCrypto"),
                .headerSearchPath("../Core/include/MIHCrypto")
            ]
        ),
        .target(
            name: "MIHCryptoDES",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/DES",
            sources: ["."],
            publicHeadersPath: "include",  // Updated
            cSettings: [
                .define("LIBRESSL"),
                .define("SWIFTPM"),
                .headerSearchPath("../Utils/include/MIHCrypto") ,
                .headerSearchPath("include/MIHCrypto"),
                .headerSearchPath("../Core/include/MIHCrypto")
            ]
        ),
        .target(
            name: "MIHCryptoEC",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/EC",
            sources: ["."],
            publicHeadersPath: "include",  // Updated
            cSettings: [
                .define("LIBRESSL"),
                .define("SWIFTPM"),
                .headerSearchPath("../Utils/include/MIHCrypto"),
                .headerSearchPath("include/MIHCrypto"),
                .headerSearchPath("../Core/include/MIHCrypto")
            ]
        ),
        .target(
            name: "MIHCryptoMD5",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/MD5",
            sources: ["."],
            publicHeadersPath: "include",  // Updated
            cSettings: [
                .define("LIBRESSL"),
                .define("SWIFTPM"),
                .headerSearchPath("../Utils/include/MIHCrypto"),
                .headerSearchPath("include/MIHCrypto"),
                .headerSearchPath("../Core/include/MIHCrypto")
            ]
        ),
        .target(
            name: "MIHCryptoRSA",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/RSA",
            sources: ["."],
            publicHeadersPath: "include",  // Updated
            cSettings: [
                .define("LIBRESSL"),
                .define("SWIFTPM"),
                .headerSearchPath("../Utils/include/MIHCrypto") ,
                .headerSearchPath("include/MIHCrypto"),
                .headerSearchPath("../Core/include/MIHCrypto")
            ]
        ),
        .target(
            name: "MIHCryptoSHA",
            dependencies: ["MIHCryptoCore"],
            path: "MIHCrypto/SHA",
            sources: ["."],
            publicHeadersPath: "include",  // Updated
            cSettings: [
                .define("LIBRESSL"),
                .define("SWIFTPM"),
                .headerSearchPath("../Utils/include/MIHCrypto"),
                .headerSearchPath("include/MIHCrypto"),
                .headerSearchPath("../Core/include/MIHCrypto")
            ]
        )

    ],
    swiftLanguageVersions: [.v5]
)
