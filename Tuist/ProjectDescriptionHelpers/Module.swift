//
//  Module.swift
//  ProjectDescriptionHelpers
//
//  Created by 박기석 on 10/28/24.
//

import ProjectDescription
import TuistTemplate

public enum Module: String, CaseIterable {
    case list = "CommonListKit"
    case tests = "CommonListKitTests"
}

extension Module: ModuleProtocol {
    public var product: Product {
        switch self {
        case .list: .framework
        case .tests: .unitTests
        }
    }
    public var infoPlist: InfoPlist { .file(path: .path(defaultPath + "/Info.plist")) }
    
    public var resources: ResourceFileElements? { nil }
    
    public var dependencies: [TargetDependency] {
        switch self {
        case .list: [.external(name: "CommonFoundation")]
        case .tests: [.target(name: Module.list.rawValue)]
        }
    }
}
