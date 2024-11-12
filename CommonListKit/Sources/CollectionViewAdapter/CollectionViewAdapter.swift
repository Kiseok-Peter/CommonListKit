//
//  CollectionViewAdapter.swift
//  CommonListKit
//
//  Created by 박기석 on 11/12/24.
//

import UIKit

public final class CollectionViewAdapter {
    weak var collectionView: UICollectionView?
    
    public init(with collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
}
