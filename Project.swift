import ProjectDescription
import ProjectDescriptionHelpers
import TuistTemplate

let targets = Module.allCases.map { Target(with: $0) }

let project = Project(name: Module.list.rawValue,
                      targets: targets)
