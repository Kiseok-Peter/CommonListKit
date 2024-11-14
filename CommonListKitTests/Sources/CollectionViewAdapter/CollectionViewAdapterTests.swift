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
        var dummy: UICollectionView!
        
        describe("CollectionViewAdapter 생성") {
            context("UICollectionView 전달") {
                let layout = CollectionViewLayout()
                
                beforeEach {
                    dummy = UICollectionView(layout: layout)
                    sut = CollectionViewAdapter(with: dummy, layout: layout)
                }
                
                it("UICollectionViewDataSource 설정 확인") {
                    expect(sut).to(beIdenticalTo(dummy.dataSource))
                }
                
                it("CollectionViewLayoutDataSource 설정 확인") {
                    expect(sut).to(beIdenticalTo(layout.dataSource))
                }
                
                afterEach {
                    dummy = nil
                    sut = nil
                }
            }
        }
    }
}
