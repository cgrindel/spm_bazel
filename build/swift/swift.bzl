"""Macros to combine swift_XXX rules and swiftformat."""

load(
    "@cgrindel_rules_swiftformat//swiftformat:swiftformat.bzl",
    "swiftformat_binary",
    "swiftformat_library",
    "swiftformat_test",
)

def swift_binary(name, srcs = None, **kwargs):
    if srcs == None:
        srcs = native.glob(["**/*.swift"])

    swiftformat_binary(
        name = name,
        srcs = srcs,
        **kwargs
    )

def swift_library(name, srcs = None, **kwargs):
    if srcs == None:
        srcs = native.glob(["*.swift"])

    swiftformat_library(
        name = name,
        srcs = srcs,
        **kwargs
    )

def swift_test(name, srcs = None, **kwargs):
    if srcs == None:
        srcs = native.glob(["*.swift"])

    swiftformat_test(
        name = name,
        srcs = srcs,
        **kwargs
    )
