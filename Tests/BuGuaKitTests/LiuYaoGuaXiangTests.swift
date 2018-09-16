//
//  LiuYaoGuaXiangTests.swift
//  BuGuaKitTests
//
//  Created by Jeffrey Wu on 2018-08-25.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import XCTest
@testable import BuGuaKit

class LiuYaoGuaXiangTests: XCTestCase {

    var sut: LiuYaoGuaXiang!

    // MARK: - Creation

    func testCreationOne() {
        sut = LiuYaoGuaXiang(liuYao: [.youngYin, .oldYang, .youngYin, .youngYin, .youngYang, .youngYang])

        XCTAssertEqual(sut.originalGua.innerGua, .kan)
        XCTAssertEqual(sut.originalGua.outerGua, .xun)
        XCTAssertEqual(sut.changedGua.innerGua, .kun)
        XCTAssertEqual(sut.changedGua.outerGua, .xun)
    }

    func testCreationTwo() {
        sut = LiuYaoGuaXiang(liuYao: [.youngYang, .oldYin, .youngYin, .youngYin, .oldYang, .youngYin])

        XCTAssertEqual(sut.originalGua.innerGua, .zhen)
        XCTAssertEqual(sut.originalGua.outerGua, .kan)
        XCTAssertEqual(sut.changedGua.innerGua, .dui)
        XCTAssertEqual(sut.changedGua.outerGua, .kun)
    }

    // MARK: - 變爻爻支

    func testChangedDiZhiOne() {
        sut = LiuYaoGuaXiang(liuYao: [.youngYin, .oldYang, .youngYin, .youngYin, .youngYang, .youngYang])

        XCTAssertEqual(sut.changedDiZhi, [nil, .si, nil, nil, nil, nil])
    }

    func testChangedDiZhiTwo() {
        sut = LiuYaoGuaXiang(liuYao: [.youngYang, .oldYin, .youngYin, .youngYin, .oldYang, .youngYin])

        XCTAssertEqual(sut.changedDiZhi, [nil, .mao, nil, nil, .hai, nil])
    }
}
