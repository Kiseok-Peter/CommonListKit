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
        
        describe("CollectionViewAdapter") {
            context("생성 및 UICollectionView 전달") {
                beforeEach {
                    let layout = CollectionViewLayout()
                    dummy = UICollectionView(layout: layout)
                    sut = CollectionViewAdapter(with: dummy, layout: layout)
                }
                
                it("UICollectionViewDataSource 설정 확인") {
                    expect(sut).to(beIdenticalTo(dummy.dataSource))
                }
                
                afterEach {
                    dummy = nil
                    sut = nil
                }
            }
        }
    }
}
