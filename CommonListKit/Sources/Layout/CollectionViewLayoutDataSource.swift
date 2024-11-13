//
//  CollectionViewLayoutDataSource.swift
//  CommonListKit
//
//  Created by 박기석 on 11/13/24.
//

import Foundation

/**
 CollectionViewLayoutProtocol에서 레이아웃 처리를 위한 DataSource Protocol
 */
protocol CollectionViewLayoutDataSource: AnyObject {
    /**
     Section 추출 함수
     
     Section index 값을 이용하여 Section 모델 값을 추출하는 함수
     
     - Parameter index: 추출할 Section의 Section index
     - Returns: index로 추출된 Section 모델. 존재하지 않는 index인 경우 nil 반환.
     */
    func section(at index: Int) -> Section?
}
