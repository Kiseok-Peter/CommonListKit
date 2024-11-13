//
//  CollectionViewLayoutProtocol.swift
//  CommonListKit
//
//  Created by 박기석 on 11/13/24.
//

import UIKit

/**
 UICollectionView에서 레이아웃 처리를 위한 Protocol
 */
protocol CollectionViewLayoutProtocol {
    /// 레이아웃 처리에 필요한 데이터 처리를 위한 DataSource
    var dataSource: CollectionViewLayoutDataSource? { get set }
    
    /**
     UICollectionView에 표시할 섹션 레이아웃 처리 함수
     
     - Parameters
        - sectionIndex: 레이아웃 처리할 Section index
        - environment: 레이아웃의 컨테이너 및 환경 특성에 대한 정보
     */
    func sectionProvider(sectionIndex: Int, environment: any NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?
}
