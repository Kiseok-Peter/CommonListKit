//
//  UICollectionView+Init.swift
//  CommonListKit
//
//  Created by 박기석 on 11/11/24.
//

import UIKit

extension UICollectionView {
    /**
     `CollectionViewLayoutProtocol`으로 UICollectionView 초기화
     
     CollectionViewLayoutProtocol에 `sectionProvider` 함수로 `UICollectionViewCompositionalLayout`로 layout 설정하여 초기화
     */
    convenience init(layout: CollectionViewLayoutProtocol) {
        self.init(frame: .zero,
                  collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: layout.sectionProvider))
    }
}
