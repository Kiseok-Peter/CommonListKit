//
//  UICollectionView+ComponentRenderable.swift
//  CommonListKit
//
//  Created by 박기석 on 11/12/24.
//

import UIKit

extension ComponentRenderable where Self: UICollectionViewCell {
    var container: UIView { contentView }
}

extension ComponentRenderable where Self: UICollectionReusableView {
    var container: UIView { self }
}
