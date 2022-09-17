import ArgumentParser
import Foundation

extension SPMBazel {
  struct Generate: AsyncParsableCommand {
    @Option(
      help: "The location of the JSON file that contains the direct dependencies.",
      completion: .file(extensions: ["json"]),
      transform: URL.init(fileURLWithPath:)
    )
    var inputFile: URL?

    @Option(
      help: "The location where to write the Bazel Starlark file.",
      completion: .file(extensions: ["bzl"]),
      transform: URL.init(fileURLWithPath:)
    )
    var outputFile: URL?

    static var configuration = CommandConfiguration(
      abstract: "Generate Bazel Starlark code to load Swift package dependencies."
    )

    mutating func runAsync() async throws {
      // GH004: Implement actual implementation
      guard let output = "Hello, World!".data(using: .utf8) else {
        return
      }
      try writeOutput { fileHandle in
        try fileHandle.write(contentsOf: output)
      }
    }

    private func createFileHandle() throws -> FileHandle {
      return .standardOutput
    }

    func writeOutput(closure: (_ fileHandle: FileHandle) throws -> Void) throws {
      let fileHandle = try createFileHandle()
      defer {
        try? fileHandle.close()
      }
      try closure(fileHandle)
    }
  }
}
