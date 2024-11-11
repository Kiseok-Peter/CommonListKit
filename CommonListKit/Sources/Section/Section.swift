//
//  Section.swift
//  CommonListKit
//
//  Created by 박기석 on 11/11/24.
//

import Foundation

struct Section: Hashable {
    let identifier: String
    
    let minimumLineSpacing: CGFloat
    let minimumInteritemSpacing: CGFloat
    
    let header: (any Component)?
    let footer: (any Component)?
    
    let items: [any Component]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
        hasher.combine(minimumLineSpacing)
        hasher.combine(minimumInteritemSpacing)
        header?.hash(into: &hasher)
        footer?.hash(into: &hasher)
        items.forEach { $0.hash(into: &hasher) }
    }
    
    static func == (lhs: Section, rhs: Section) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
