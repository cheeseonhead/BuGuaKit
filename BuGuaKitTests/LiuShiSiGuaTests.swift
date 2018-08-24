//
//  LiuShiSiGuaTests.swift
//  BuGuaKitTests
//
//  Created by Cheese Onhead on 2018-07-22.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import XCTest
@testable import BuGuaKit

class LiuShiSiGuaTests: XCTestCase {

    var sut: LiuShiSiGua!

    // MARK: - 世應

    func testShiYingForAllSame() {
        sut = LiuShiSiGua(innerGua: .li, outerGua: .li)
        
        XCTAssertEqual(sut.shi, 6)
        XCTAssertEqual(sut.ying, 3)
    }
    
    func testShiYingForBottomDifferent() {
        sut = LiuShiSiGua(innerGua: .qian, outerGua: .xun)
        
        XCTAssertEqual(sut.shi, 1)
        XCTAssertEqual(sut.ying, 4)
    }
    
    func testShiYingForTopSame() {
        sut = LiuShiSiGua(innerGua: .li, outerGua: .xun)
        
        XCTAssertEqual(sut.shi, 2)
        XCTAssertEqual(sut.ying, 5)
    }
    
    func testShiYingForAllDifferent() {
        sut = LiuShiSiGua(innerGua: .qian, outerGua: .kun)
        
        XCTAssertEqual(sut.shi, 3)
        XCTAssertEqual(sut.ying, 6)
    }
    
    func testShiYingForBottomSame() {
        sut = LiuShiSiGua(innerGua: .qian, outerGua: .zhen)
        
        XCTAssertEqual(sut.shi, 4)
        XCTAssertEqual(sut.ying, 1)
    }
    
    func testShiYingTopDifferent() {
        sut = LiuShiSiGua(innerGua: .kan, outerGua: .xun)
        
        XCTAssertEqual(sut.shi, 5)
        XCTAssertEqual(sut.ying, 2)
    }
    
    func testShiYingMiddleSame() {
        sut = LiuShiSiGua(innerGua: .li, outerGua: .kun)
        
        XCTAssertEqual(sut.shi, 4)
        XCTAssertEqual(sut.ying, 1)
    }
    
    func testShiYingMiddleDifferent() {
        sut = LiuShiSiGua(innerGua: .zhen, outerGua: .dui)
        
        XCTAssertEqual(sut.shi, 3)
        XCTAssertEqual(sut.ying, 6)
    }

    // MARK: - 卦宮

    func testGuaGongShiAtOne() {
        sut = LiuShiSiGua(innerGua: .qian, outerGua: .xun)

        XCTAssertEqual(sut.guaGong, .xun)
    }

    func testGuaGongShiAtTwo() {
        sut = LiuShiSiGua(innerGua: .li, outerGua: .xun)

        XCTAssertEqual(sut.guaGong, .xun)
    }

    func testGuaGongAllDifferent() {
        sut = LiuShiSiGua(innerGua: .qian, outerGua: .kun)

        XCTAssertEqual(sut.guaGong, .kun)
    }

    func testGuaGongMiddleDifferent() {
        sut = LiuShiSiGua(innerGua: .zhen, outerGua: .dui)

        XCTAssertEqual(sut.guaGong, .zhen)
    }

    func testGuaGongShiAtFour() {
        sut = LiuShiSiGua(innerGua: .li, outerGua: .kun)

        XCTAssertEqual(sut.guaGong, FuXiBaGua.li.opposite)
    }

    func testGuaGongShiAtFive() {
        sut = LiuShiSiGua(innerGua: .kan, outerGua: .xun)

        XCTAssertEqual(sut.guaGong, FuXiBaGua.kan.opposite)
    }

    func testGuaGongShiAtSix() {
        sut = LiuShiSiGua(innerGua: .li, outerGua: .li)

        XCTAssertEqual(sut.guaGong, .li)
    }
}
