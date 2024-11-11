//
//  Component.swift
//  CommonListKit
//
//  Created by 박기석 on 11/11/24.
//

import UIKit

protocol Component: Hashable {
    associatedtype Content: UIView
    
    var identifier: String { get }
    
    func render(content: Content)
}
