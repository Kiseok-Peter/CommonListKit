//
//  DummyComponent.swift
//  CommonListKitTests
//
//  Created by 박기석 on 11/12/24.
//

@testable import CommonListKit
import UIKit

struct DummyComponent: Component {
    typealias Content = UIView
    
    var identifier: String
    
    func render(content: Content) { }
    
    func sizeHash(into hasher: inout Hasher) { }
}
