load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def spm_bazel_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "043897b483781cfd6cbd521569bfee339c8fbb2ad0f0bdcd1b3749523a262cf4",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.1.1/rules_swift.1.1.1.tar.gz",
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
        sha256 = "d1886f0ea5b6cfe7519b87030811f52620db31bcca7ef9964aa17af2d14f23c4",
        strip_prefix = "rules_cc-cb6d32e4d1ae29e20dd3328109d8cb7f8eccc9be",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/cb6d32e4d1ae29e20dd3328109d8cb7f8eccc9be.tar.gz",
        ],
    )