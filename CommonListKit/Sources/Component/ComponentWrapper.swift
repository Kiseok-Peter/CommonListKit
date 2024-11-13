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
public struct ComponentWrapper: Component {
    private let container: any ComponentContainerProtocol
    /// 원래 Component 값
    var original: any Component { container.component }
    
    /// Component 고유 ID 값 설정
    public var identifier: String { original.identifier }
    /// Component의 Cell Reuse ID 값
    public var reuseIdentifier: String { original.reuseIdentifier }
    
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
    public func sizeHash(into hasher: inout Hasher) {
        original.sizeHash(into: &hasher)
    }
    
    /**
     `'Contnet'` View에 데이터 적용하는 함수
     
     - Parameters:
        - content: Component에 매칭되어 데이터를 적용할 Content View
     */
    public func render(content: UIView) {
        container.render(content: content)
    }
    
    /**
     렌더링할 `'Contnet'` View를 생성하여 반환해주는 함수
     
     - Returns: 렌더링할 Content 뷰
     */
    public func renderContent() -> UIView {
        container.renderContent()
    }
    
    public static func == (lhs: ComponentWrapper, rhs: ComponentWrapper) -> Bool {
        lhs.original.hashValue == rhs.original.hashValue
    }
    
    static func == (lhs: some Component, rhs: ComponentWrapper) -> Bool {
        lhs.hashValue == rhs.original.hashValue
    }
    
    static func == (lhs: ComponentWrapper, rhs: some Component) -> Bool {
        lhs.original.hashValue == rhs.hashValue
    }
}

private protocol ComponentContainerProtocol {
    associatedtype Base: Component

    var component: Base { get }

    func renderContent() -> UIView
    func render(content: UIView)
}

private struct ComponentContainer<Base: Component>: ComponentContainerProtocol {
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
