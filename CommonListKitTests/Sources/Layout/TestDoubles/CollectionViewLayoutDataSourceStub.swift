//
//  CollectionViewLayoutDataSourceStub.swift
//  CommonListKitTests
//
//  Created by 박기석 on 11/14/24.
//

@testable import CommonListKit

final class CollectionViewLayoutDataSourceStub: CollectionViewLayoutDataSource {
    var section: Section?
    
    func section(at index: Int) -> Section? {
        section
    }
}
