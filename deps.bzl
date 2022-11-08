"""Dependencies for spm_bazel"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def spm_bazel_dependencies():
    """Defines the dependencies for spm_bazel."""
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "51efdaf85e04e51174de76ef563f255451d5a5cd24c61ad902feeadafc7046d9",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.2.0/rules_swift.1.2.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "cgrindel_bazel_starlib",
        sha256 = "c95de004f346cbcb51ba1185e8861227cd9ab248b53046f662aeda1095601bc9",
        strip_prefix = "bazel-starlib-0.7.1",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.7.1.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "cgrindel_rules_swiftformat",
        sha256 = "f496774f56e8260e277dc17366cf670b55dee3616327a13d2d04bd1b62cdcc88",
        strip_prefix = "rules_swiftformat-0.4.1",
        urls = [
            "http://github.com/cgrindel/rules_swiftformat/archive/v0.4.1.tar.gz",
        ],
    )

    # NOTE: Only using rules_cc to get swiftformat to work. Do not use in this project.

    # Load the latest rules_cc to address missing action_names.bzl error.
    # Latest on main branch as of 2022-05-07
    maybe(
        http_archive,
        name = "rules_cc",
        sha256 = "e124364f3da2b3992fc6062ddf8380f584e694999d934c9485d3abbc5e00ed45",
        strip_prefix = "rules_cc-35fb29866e9833ed918f422215155b8bafddb356",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/35fb29866e9833ed918f422215155b8bafddb356.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "apple_swift_argument_parser",
        strip_prefix = "swift-argument-parser-1.2.0",
        urls = ["https://github.com/apple/swift-argument-parser/archive/1.2.0.tar.gz"],
        sha256 = "f2c3a7f20e6dede610e7bd7e6cc9e352df54070769bc5b7f5d4bb2868e3c10ae",
        build_file_content = """
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "ArgumentParserToolInfo",
    srcs = glob(["Sources/ArgumentParserToolInfo/**/*.swift"]),
    module_name = "ArgumentParserToolInfo",
    visibility = ["//visibility:public"],
)

swift_library(
    name = "ArgumentParser",
    srcs = glob(["Sources/ArgumentParser/**/*.swift"]),
    module_name = "ArgumentParser",
    visibility = ["//visibility:public"],
    deps = [
        ":ArgumentParserToolInfo",
    ]
)
""",
    )
