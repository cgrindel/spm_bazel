import ArgumentParser
import Foundation

@main
struct SPMBazel: AsyncParsableCommand {
  // static let configuration: CommandConfiguration = {
  //     // if let directory = ProcessInfo.processInfo.environment["BUILD_WORKSPACE_DIRECTORY"] {
  //     //     FileManager.default.changeCurrentDirectoryPath(directory)
  //     // }

  //     CommandConfiguration(
  //         commandName: "spm_bazel",
  //         abstract: "A tool to manage Swift package dependencies for a Bazel workspace.",
  //         version: Version.value,
  //         // subcommands: [
  //         //     Analyze.self,
  //         //     Docs.self,
  //         //     GenerateDocs.self,
  //         //     Lint.self,
  //         //     Rules.self,
  //         //     Version.self
  //         // ],
  //         // defaultSubcommand: Lint.self
  //     )
  // }()

  mutating func runAsync() async throws {
    guard let output = "Hello, World!".data(using: .utf8) else {
      return
    }
    try writeOutput { fileHandle in
      try fileHandle.write(contentsOf: output)
    }
  }

  private func createFileHandle() throws -> FileHandle {
    return .standardOutput
    // guard let outputFile = outputFile else {
    //     return .standardOutput
    // }
    // // Create the file, then create the file handle
    // guard FileManager.default.createFile(atPath: outputFile.path, contents: nil) else {
    //     throw DumpError.failedToCreateOutputFile(outputFile.path)
    // }
    // guard let outputFileHandle = FileHandle(forWritingAtPath: outputFile.path) else {
    //     throw DumpError.failedToOpenOutputFile(outputFile.path)
    // }
    // return outputFileHandle
  }

  func writeOutput(closure: (_ fileHandle: FileHandle) throws -> Void) throws {
    let fileHandle = try createFileHandle()
    defer {
      try? fileHandle.close()
    }
    try closure(fileHandle)
  }
}
