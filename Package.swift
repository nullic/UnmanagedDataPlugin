// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UnmanagedDataPlugin",
    products: [
        .plugin(name: "UnmanagedDataPlugin", targets: ["UnmanagedDataPlugin"]),
        .plugin(name: "UnmanagedDataPlugin-Generate", targets: ["UnmanagedDataPlugin-Generate"]),
    ],
    dependencies: [],
    targets: [
        .plugin(name: "UnmanagedDataPlugin",
                capability: .buildTool(),
                dependencies: ["umd"]),

        .plugin(name: "UnmanagedDataPlugin-Generate",
                capability: .command(
                    intent: .custom(
                        verb: "generate-code-from-core-data-model",
                        description: "Creates source code from Core Data model"
                    ),
                    permissions: [
                        .writeToPackageDirectory(reason: "This command generates source code")
                    ]
                ),
                dependencies: ["umd"]),
        
        .binaryTarget(name: "umd",
                      url: "https://github.com/nullic/UnmanagedData/releases/download/pre_2.0.1/umd.artifactbundle.zip",
                      checksum: "c9061e86dffb7e5c6fae2526f76c2e36fc0cd45fed2d180e749c3e6f0c2b1d59")
    ]
)
