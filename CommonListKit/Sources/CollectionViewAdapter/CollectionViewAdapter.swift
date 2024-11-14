//
//  CollectionViewAdapter.swift
//  CommonListKit
//
//  Created by 박기석 on 11/12/24.
//

import UIKit
import CommonFoundation

/**
 UICollectionView의 처리를 위한 Adapter
 
 UICollectionView DataSource 및 Layout을 Section, Component를 이용하여 자동으로 처리 위한 Adapter
 */
public final class CollectionViewAdapter: NSObject {
    /// Adapter 처리할 UICollectionView
    weak var collectionView: UICollectionView?
    
    /// CollectionView에 적용된 Section 모델
    var sections: [Section] = []
    /// Section 적용 전용
    var inputSections: [Section] {
        get { sections }
        set { updateSections(with: newValue) }
    }
    
    /// UICollectionView에 Register한 Cell의 reuseIdentifier
    var registeredCellIdentifiers: Set<String> = []
    /// UICollectionView에 Register한 Header의 reuseIdentifier
    var registeredHeaderIdentifiers: Set<String> = []
    /// UICollectionView에 Register한 Footer의 reuseIdentifier
    var registeredFooterIdentifiers: Set<String> = []
    
    /**
     CollectionViewAdapter의 초기화
     
     - Parameter collectionView: Adapter 처리할 UICollectionView
     */
    public init(with collectionView: UICollectionView, layout: CollectionViewLayoutProtocol) {
        super.init()
        
        self.collectionView = collectionView
        collectionView.dataSource = self
        layout.dataSource = self
    }
}

// MARK: Get Handler
extension CollectionViewAdapter: CollectionViewLayoutDataSource {
    /**
     Section 추출 함수
     
     Section index 값을 이용하여 Section 모델 값을 추출하는 함수
     
     - Parameter index: 추출할 Section의 Section index
     - Returns: index로 추출된 Section 모델. 존재하지 않는 index인 경우 nil 반환.
     */
    public func section(at index: Int) -> Section? {
        sections[safe: index]
    }
}

extension CollectionViewAdapter {
    /**
     Component 아이템 추출 함수
     
     IndexPath 값을 이용하여 Component 모델 값을 추출하는 함수
     
     - Parameter indexPath: 추출할 Component의 Section index, Item index 모델인 IndexPath 값.
     - Returns: indexPath로 추출된 Component 모델. 존재하지 않는 index인 경우 nil 반환.
     */
    func item(at indexPath: IndexPath) -> ComponentWrapper? {
        section(at: indexPath.section)?.items[safe: indexPath.item]
    }
}

// MARK: Update Sections
extension CollectionViewAdapter {
    /**
     Section 업데이트 동작 함수
     
     - Parameter inputSections: 업데이트할 Section 배열
     */
    private func updateSections(with inputSections: [Section]) {
        guard let collectionView else { return }
        
        sections = inputSections
        
        Task {
            await MainActor.run {
                collectionView.reloadData()
            }
        }
    }
}
