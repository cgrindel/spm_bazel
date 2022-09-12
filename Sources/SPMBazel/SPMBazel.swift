import ArgumentParser
import Foundation

struct SPMBazel: AsyncParsableCommand {
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
  }

  func writeOutput(closure: (_ fileHandle: FileHandle) throws -> Void) throws {
    let fileHandle = try createFileHandle()
    defer {
      try? fileHandle.close()
    }
    try closure(fileHandle)
  }
}
