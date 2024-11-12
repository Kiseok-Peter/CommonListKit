//
//  ComponentWrapper.swift
//  CommonListKit
//
//  Created by 박기석 on 11/12/24.
//

import UIKit

/**
 Component 프로토콜 any, some 처리 편리성을 위한 Wrapper
 */
struct ComponentWrapper: Component {
    private let container: any ComponentContainerProtocol
    /// 원래 Component 값
    var original: any Component { container.component }
    
    /// Component 고유 ID 값 설정
    var identifier: String { original.identifier }
    
    /** 
     ComponentWrapper 초기화
     
     - Parameters:
        - component: Wrapping 처리할 Component
     */
    init(_ component: some Component) {
        container = ComponentContainer(component: component)
    }
    
    /**
     크기 계산용 hash 처리 함수
     
     - Parameter hasher: 해시 처리를 위한 Hasher 객체
     */
    func sizeHash(into hasher: inout Hasher) {
        original.sizeHash(into: &hasher)
    }
    
    /**
     `'Contnet'` View에 데이터 적용하는 함수
     
     - Parameters:
        - content: Component에 매칭되어 데이터를 적용할 Content View
     */
    func render(content: UIView) {
        container.render(content: content)
    }
    
    /**
     렌더링할 `'Contnet'` View를 생성하여 반환해주는 함수
     
     - Returns: 렌더링할 Content 뷰
     */
    func renderContent() -> UIView {
        container.renderContent()
    }
    
    static func == (lhs: ComponentWrapper, rhs: ComponentWrapper) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}

private protocol ComponentContainerProtocol {
    associatedtype Base: Component

    var component: Base { get }
    var identifier: String { get }

    func renderContent() -> UIView
    func render(content: UIView)
}

private struct ComponentContainer<Base: Component>: ComponentContainerProtocol {
    var identifier: String { component.identifier }
    
    var component: Base
    
    init(component: Base) {
        self.component = component
    }
    
    func renderContent() -> UIView {
        component.renderContent()
    }
    
    func render(content: UIView) {
        guard let content = content as? Base.Content else { return }
        
        component.render(content: content)
    }
}
