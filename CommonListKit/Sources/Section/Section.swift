//
//  Section.swift
//  CommonListKit
//
//  Created by 박기석 on 11/11/24.
//

import Foundation

/**
 List 섹션  모델
 */
public struct Section: Hashable {
    /// Section 고유 ID 값
    let identifier: String
    
    /// 아이템 사이 Line 간격
    let minimumLineSpacing: CGFloat
    /// 아이템과 아이템 간격
    let minimumInteritemSpacing: CGFloat
    /// 섹션 Header Component
    let header: ComponentWrapper?
    /// 섹션 Footer Component
    let footer: ComponentWrapper?
    /// 섹션 아이템 Component 배열
    let items: [ComponentWrapper]
    
    public init(identifier: String,
         minimumLineSpacing: CGFloat = 0,
         minimumInteritemSpacing: CGFloat = 0,
         header: (any Component)? = nil,
         footer: (any Component)? = nil,
         items: [any Component]) {
        self.identifier = identifier
        
        self.minimumLineSpacing = minimumLineSpacing
        self.minimumInteritemSpacing = minimumInteritemSpacing
        
        self.header = if let header {
            ComponentWrapper(header)
        } else {
            nil
        }
        self.footer = if let footer {
            ComponentWrapper(footer)
        } else {
            nil
        }
        
        self.items = items.map { ComponentWrapper($0) }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
        hasher.combine(minimumLineSpacing)
        hasher.combine(minimumInteritemSpacing)
        header?.hash(into: &hasher)
        footer?.hash(into: &hasher)
        items.forEach { $0.hash(into: &hasher) }
    }
    
    public static func == (lhs: Section, rhs: Section) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
