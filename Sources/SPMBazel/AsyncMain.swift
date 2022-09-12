import ArgumentParser

@main
enum AsyncMain {
  static func main() async {
    await SPMBazel.main()
  }
}
