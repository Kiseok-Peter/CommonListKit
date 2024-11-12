//
//  SectionTests.swift
//  CommonListKitTests
//
//  Created by 박기석 on 11/12/24.
//

import Quick
import Nimble
@testable import CommonListKit

final class SectionTests: QuickSpec {
    override class func spec() {
        let section1 = Section(identifier: "section_1", items: [DummyComponent(identifier: "dummy_component")])
        var section2: Section!
        
        describe("Section 판별") {
            context("동일성 검사") {
                beforeEach {
                    section2 = Section(identifier: "section_1", items: [DummyComponent(identifier: "dummy_component")])
                }
                
                it("같은 경우") {
                    expect(section1).to(equal(section2))
                    expect(section1.identifier).to(equal(section2.identifier))
                }
                
                afterEach {
                    section2 = nil
                }
            }
            
            context("identifier 검사") {
                beforeEach {
                    section2 = Section(identifier: "section_2", items: [DummyComponent(identifier: "dummy_component")])
                }
                
                it("다른 경우") {
                    expect(section1).toNot(equal(section2))
                    expect(section1.identifier).toNot(equal(section2.identifier))
                }
                
                afterEach {
                    section2 = nil
                }
            }
            
            context("items 검사") {
                beforeEach {
                    section2 = Section(identifier: "section_1", items: [DummyComponent(identifier: "dummy_component_1")])
                }
                
                it("다른 경우") {
                    expect(section1).toNot(equal(section2))
                }
                
                afterEach {
                    section2 = nil
                }
            }
        }
    }
}
