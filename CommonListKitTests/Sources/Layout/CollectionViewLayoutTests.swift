//
//  CollectionViewLayoutTests.swift
//  CommonListKitTests
//
//  Created by 박기석 on 11/13/24.
//

import Quick
import Nimble
@testable import CommonListKit

final class CollectionViewLayoutTests: QuickSpec {
    override class func spec() {
        var sut: CollectionViewLayout!
        var stub: CollectionViewLayoutDataSourceStub!
        
        describe("CollectionViewLayout") {
            context("DataSource 미설정") {
                beforeEach {
                    sut = CollectionViewLayout()
                }
                
                it("sectionProvider nil 반환") {
                    expect(sut.sectionProvider(sectionIndex: 0, environment: NSCollectionLayoutEnvironmentDummy())).to(beNil())
                }
                
                afterEach {
                    sut = nil
                }
            }
            
            context("DataSource 설정 Section 미존재") {
                beforeEach {
                    stub = CollectionViewLayoutDataSourceStub()
                    sut = CollectionViewLayout()
                    sut.dataSource = stub
                }
                
                it("sectionProvider nil 반환") {
                    expect(sut.sectionProvider(sectionIndex: 0, environment: NSCollectionLayoutEnvironmentDummy())).to(beNil())
                }
                
                afterEach {
                    stub = nil
                    sut = nil
                }
            }
            
            context("DataSource 설정 Section 존재 items 미존재") {
                beforeEach {
                    stub = CollectionViewLayoutDataSourceStub()
                    stub.section = Section(identifier: "section", items: [])
                    sut = CollectionViewLayout()
                    sut.dataSource = stub
                }
                
                it("sectionProvider nil 반환") {
                    expect(sut.sectionProvider(sectionIndex: 0, environment: NSCollectionLayoutEnvironmentDummy())).to(beNil())
                }
                
                afterEach {
                    stub = nil
                    sut = nil
                }
            }
            
            context("DataSource 설정 Section 존재 items 존재") {
                beforeEach {
                    stub = CollectionViewLayoutDataSourceStub()
                    stub.section = Section(identifier: "section", items: [DummyComponent(identifier: "component")])
                    sut = CollectionViewLayout()
                    sut.dataSource = stub
                }
                
                it("sectionProvider not nil 반환") {
                    expect(sut.sectionProvider(sectionIndex: 0, environment: NSCollectionLayoutEnvironmentDummy())).toNot(beNil())
                }
                
                afterEach {
                    stub = nil
                    sut = nil
                }
            }
        }
    }
}
