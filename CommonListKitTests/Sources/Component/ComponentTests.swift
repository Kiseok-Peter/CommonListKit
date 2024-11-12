//
//  ComponentTests.swift
//  CommonListKitTests
//
//  Created by 박기석 on 11/12/24.
//

import Quick
import Nimble
@testable import CommonListKit

final class ComponentTests: QuickSpec {
    override class func spec() {
        var component1: DummyComponent!
        var component2: (any Component)!
        
        describe("Component 유효성") {
            context("Component 동일성 검사 1") {
                
                beforeEach {
                    component1 = DummyComponent(identifier: "dummy_component_1")
                    component2 = DummyComponent(identifier: "dummy_component_1")
                }
                
                it("같은 경우") {
                    expect(component1.identifier).to(equal(component2?.identifier))
                }
                
                afterEach {
                    component1 = nil
                    component2 = nil
                }
            }
            
            context("Component 동일성 검사 2") {
                beforeEach {
                    component1 = DummyComponent(identifier: "dummy_component_1")
                    component2 = DummyComponent(identifier: "dummy_component_2")
                }
                
                it("같지 않은 경우") {
                    expect(component1.identifier).toNot(equal(component2.identifier))
                }
                
                afterEach {
                    component1 = nil
                    component2 = nil
                }
            }
        }
    }
}
