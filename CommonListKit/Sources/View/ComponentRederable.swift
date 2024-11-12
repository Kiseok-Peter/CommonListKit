//
//  ComponentRederable.swift
//  CommonListKit
//
//  Created by 박기석 on 11/12/24.
//

import UIKit

/**
 Component와 View를 Render 하기 위한 Protocol
 */
protocol ComponentRenderable: AnyObject {
    /// Render할 View
    var content: UIView? { get set }
    /// content 뷰를 적용할 container 뷰
    var container: UIView { get }
    
    /// Component에 View를 Render 하는 동작 함수
    func render(component: ComponentWrapper)
}

extension ComponentRenderable where Self: UIView  {
    func render(component: ComponentWrapper) {
        if let content {
            component.render(content: content)
        } else {
            let content = component.renderContent()
            
            container.addSubview(content)
            content.translatesAutoresizingMaskIntoConstraints = false
            content.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            content.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
            content.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
            content.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
            
            self.content = content
            
            render(component: component)
        }
    }
}
