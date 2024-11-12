//
//  ComponentWrapperTests.swift
//  CommonListKitTests
//
//  Created by 박기석 on 11/12/24.
//

import Quick
import Nimble
@testable import CommonListKit

final class ComponentWrapperTests: QuickSpec {
    override class func spec() {
        var component1: DummyComponent!
        var component2: ComponentWrapper!
        
        describe("ComponentWrapper 유효성") {
            context("original 체크") {
                beforeEach {
                    component2 = ComponentWrapper(DummyComponent(identifier: "dummy_component"))
                }
                
                it("타입 확인") {
                    expect(component2.original).to(beAKindOf((any Component).self))
                    expect(component2.original).to(beAKindOf(DummyComponent.self))
                }
                
                afterEach {
                    component2 = nil
                }
            }
            
            context("동일성 검사 1") {
                beforeEach {
                    component1 = DummyComponent(identifier: "dummy_component_1")
                    component2 = ComponentWrapper(component1)
                }
                
                it("같은 경우") {
                    expect(component1).to(equal(component2.original as! DummyComponent))
                    expect(component1.identifier).to(equal(component2.identifier))
                    expect(component1.hashValue).to(equal(component2.hashValue))
                }
                
                afterEach {
                    component1 = nil
                    component2 = nil
                }
            }
            
            context("동일성 검사 2") {
                beforeEach {
                    component1 = DummyComponent(identifier: "dummy_component_1")
                    component2 = ComponentWrapper(DummyComponent(identifier: "dummy_component_2"))
                }
                
                it("같지 않은 경우") {
                    expect(component1.identifier).toNot(equal(component2.identifier))
                    expect(component1.hashValue).toNot(equal(component2.hashValue))
                }
                
                afterEach {
                    component1 = nil
                    component2 = nil
                }
            }
        }
    }
}
