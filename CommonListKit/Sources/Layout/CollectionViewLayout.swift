//
//  CollectionViewLayout.swift
//  CommonListKit
//
//  Created by 박기석 on 11/13/24.
//

import UIKit

/**
 UICollectionView에서 레이아웃 처리를 위한 CollectionViewLayoutProtocol의 구현체
 */
final class CollectionViewLayout: CollectionViewLayoutProtocol {
    /// 레이아웃 처리에 필요한 데이터 처리를 위한 DataSource
    weak var dataSource: CollectionViewLayoutDataSource?
    
    /**
     UICollectionView에 표시할 섹션 레이아웃 처리 함수
     
     - Parameters
        - sectionIndex: 레이아웃 처리할 Section index
        - environment: 레이아웃의 컨테이너 및 환경 특성에 대한 정보
     */
    func sectionProvider(sectionIndex: Int, environment: any NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        createSection(at: sectionIndex)
    }
}

// MARK: Vertical Layout
extension CollectionViewLayout {
    private func createSection(at sectionIndex: Int) -> NSCollectionLayoutSection? {
        guard let section = dataSource?.section(at: sectionIndex),
              !section.items.isEmpty else { return nil }

        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                        heightDimension: .fractionalHeight(1)),
                                                     subitems: createItems(with: section.items))
        group.interItemSpacing = .fixed(section.minimumLineSpacing)

        return NSCollectionLayoutSection(group: group)
    }
    
    private func createItems(with items: [ComponentWrapper]) -> [NSCollectionLayoutItem] {
        items.map { component in
            NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                      heightDimension: .estimated(1)))
        }
    }
}
