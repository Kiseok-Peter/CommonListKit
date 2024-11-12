// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: ["CommonFoundation": .framework,
                       "Quick": .framework,
                       "Nimble": .framework,]
    )
#endif

let package = Package(
    name: "CommonListKit",
    products: [
        .library(name: "CommonListKit",
                 targets: ["CommonListKit"])
    ],
    dependencies: [
        // Add your own dependencies here:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
        .package(url: "git@github.com:Kiseok-Peter/CommonFoundation.git", branch: "develop"),
        .package(url: "https://github.com/Quick/Quick.git", from: "7.6.2"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "13.6.0"),
    ],
    targets: [
        .target(name: "CommonListKit", path: "CommonListKit"),
        .testTarget(name: "CommonListKitTests",
                    dependencies: ["CommonListKit",
                                   .product(name: "Quick", package: "Quick"),
                                   .product(name: "Nimble", package: "Nimble"),],
                    path: "CommonListKitTests"),
    ]
)
