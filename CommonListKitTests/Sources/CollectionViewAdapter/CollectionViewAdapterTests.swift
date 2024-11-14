//
//  CollectionViewAdapterTests.swift
//  CommonListKitTests
//
//  Created by 박기석 on 11/13/24.
//

import Quick
import Nimble
@testable import CommonListKit
import UIKit

final class CollectionViewAdapterTests: QuickSpec {
    override class func spec() {
        var sut: CollectionViewAdapter!
        
        describe("CollectionViewAdapter") {
            context("초기화") {
                let layout = CollectionViewLayout()
                let collectionView = UICollectionView(layout: layout)
                
                beforeEach {
                    sut = CollectionViewAdapter(with: collectionView, layout: layout)
                }
                
                it("UICollectionViewDataSource 설정 확인") {
                    expect(sut).to(beIdenticalTo(collectionView.dataSource))
                }
                
                it("CollectionViewLayoutDataSource 설정 확인") {
                    expect(sut).to(beIdenticalTo(layout.dataSource))
                }
                
                afterEach {
                    sut = nil
                }
            }
            
            context("섹션 업데이트") {
                let layout = CollectionViewLayout()
                let collectionView = UICollectionView(layout: layout)
                
                beforeEach {
                    sut = CollectionViewAdapter(with: collectionView, layout: layout)
                    sut.inputSections = [Section(identifier: "section",
                                                 items: [DummyComponent(identifier: "component")])]
                }
                
                it("sections 확인") {
                    expect(sut.sections).to(equal([Section(identifier: "section",
                                                           items: [DummyComponent(identifier: "component")])]))
                }
                
                afterEach {
                    sut = nil
                }
            }
        }
    }
}
