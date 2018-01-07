import ArcheryKit
import ArrowKit
import Unbox

struct ArcheryArrow: ArrowKit.Arrow {
    let run: [String]
    let scripts: [String: AnyArrow]?

    func fire(archerfile arrowFile: ArrowKit.Archerfile, arguments: [String]) throws {
        let archeryFile: ArcheryKit.Archerfile = try unbox(dictionary: arrowFile.metadata)
        let archery = Archery()
        for scriptName in run {
            print("🏹  run \(scriptName)")
            if let arrow = (scripts ?? [:])[scriptName] {
                try archery.executeScript(
                    try script(from: arrow),
                    using: archeryFile,
                    with: arguments
                )
            } else {
                try archery.executeScript(
                    named: scriptName,
                    using: archeryFile,
                    with: arguments
                )
            }
        }
    }

    func script(from arrow: AnyArrow) throws -> Script {
        return try unbox(dictionary: arrow.metadata)
    }
}

ArcheryArrow.fire()
