//
//  CollectionViewAdapter.swift
//  CommonListKit
//
//  Created by 박기석 on 11/12/24.
//

import UIKit


public final class CollectionViewAdapter {
    /// 처리할 UICollectionView
    weak var collectionView: UICollectionView?
    
    /// CollectionView에 적용된 Section 모델
    var sections: [Section] = []
    /// Section 적용 전용
    var inputSections: [Section] {
        get { sections }
        set { updateSections(with: newValue) }
    }
    
    public init(with collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
}

extension CollectionViewAdapter {
    private func updateSections(with inputSections: [Section]) {
        guard let collectionView else { return }
        
        Task {
            await MainActor.run {
                sections = inputSections
                collectionView.reloadData()
            }
        }
    }
}
