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
                      url: "https://github.com/nullic/UnmanagedData/releases/download/pre_2.0.0/umd.artifactbundle.zip",
                      checksum: "d9161f4ed245fed158d8ef58bb469fae0d8f0078f82cb95fb312f6f7f76b131c")
    ]
)
