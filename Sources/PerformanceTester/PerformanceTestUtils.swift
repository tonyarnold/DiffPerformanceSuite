import Foundation
import Differ

func performDiff(fromFilePath: String, toFilePath: String, repeatCount: Int = 10, diffFunc: @escaping ([Character], [Character]) -> Void) -> (created: String, deleted: String, same: String, changed: String) {
    let old = file(fromFilePath)
    let new = file(toFilePath)
    let compare: ([Character], [Character]) -> String = { a, b in
        var time: CFTimeInterval = 0
        for _ in 0 ..< repeatCount {
            time += measure({ diffFunc(a, b) })
        }
        time = time / CFTimeInterval(repeatCount)
        return (NSString(format: "%.4f", time) as String)
    }

    return (compare([], old),
            compare(old, []),
            compare(old, old),
            compare(old, new))
}

func currentDirectoryPath() -> String {
    let buffer: UnsafeMutablePointer<Int8> = UnsafeMutablePointer.allocate(capacity: Int(PATH_MAX))
    getcwd(buffer, Int(PATH_MAX))
    let string = String(cString: buffer)
    buffer.deallocate()
    return string
}

func measure(_ f: () -> Void) -> CFTimeInterval {
    let time = CFAbsoluteTimeGetCurrent()
    f()
    return CFAbsoluteTimeGetCurrent() - time
}

func file(_ path: String) -> [Character] {
    return try! Array(String(contentsOfFile: path))
}

func diffSwift(_ a: [Character], b: [Character]) {
    _ = _diffSwift(a, b: b)
}

private func _diffSwift(_ a: [Character], b: [Character]) -> Diff {
    return a.diff(b)
}

func launchPath() -> String {
    let path = CommandLine.arguments.first!
    let dotIndex = path.index(after: path.startIndex)
    var lastSlashIndex = path.index(before: path.endIndex)
    let c: Character = "/"
    while path[lastSlashIndex] != c {
        lastSlashIndex = path.index(before: lastSlashIndex)
    }
    return String(path[dotIndex ... lastSlashIndex])
}

func proccessPath() -> String {
    return currentDirectoryPath().appending(launchPath())
}
