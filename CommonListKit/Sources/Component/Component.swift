//
//  Component.swift
//  CommonListKit
//
//  Created by 박기석 on 11/11/24.
//

import UIKit

/**
 List 아이템 모델 Protocol
 
 List에 아이템 뷰에 데이터 바인딩을 하기 위한 모델 설정 및 뷰 렌더링 동작 설정
 
 사용 예제
 ```swift
 struct TestComponent: Component {
    typealias Content = TestView
 
    let identifier = "test_component"
 
    func render(content: Content) {
        // content view render
    }
 }
 ```
 */
protocol Component: Hashable {
    /// Component에 매칭되는 뷰 지정
    associatedtype Content: UIView
    
    /// Component 고유 ID 값 설정
    var identifier: String { get }
    
    /**
     `'Contnet'` View에 데이터 적용하는 함수
     
     - Parameters:
        - content: Component에 매칭되어 데이터를 적용할 Content View
     */
    func render(content: Content)
    /**
     렌더링할 `'Contnet'` View를 생성하여 반환해주는 함수
     
     - Returns: 렌더링할 Content 뷰
     */
    func renderContent() -> Content
}

extension Component {
    func renderContent() -> Content { Content() }
}
