import ArgumentParser
import Foundation

// struct SPMBazel: AsyncParsableCommand {
struct SPMBazel: ParsableCommand {
  static var configuration = CommandConfiguration(
    abstract: "Generate and manage Swift dependencies for Bazel.",
    subcommands: [Generate.self],
    defaultSubcommand: Generate.self
  )
}
