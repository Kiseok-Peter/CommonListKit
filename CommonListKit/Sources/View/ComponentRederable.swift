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
    
    /// Component에 View를 Render 하는 동작 함수
    func render(component: some Component)
}
