//
// SolarTermCalculatorTests.swift
//  BuGuaKitTests
//
//  Created by Jeffrey Wu on 2018-09-14.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import XCTest
@testable import BuGuaKit

class SolarTermMonthCalculatorTests: XCTestCase {

    static let componentsFetcher = SolarTermDateComponentsFetcher(dataLoader: MockDataLoader())

    var sut: SolarTermMonthCalculator!

    override func setUp() {
        sut = SolarTermMonthCalculator(dateComponentFetcher: SolarTermMonthCalculatorTests.componentsFetcher)
    }

    func testOutOfRange() {
        XCTAssertThrowsError(try sut.termDate(for: .liChun, ofYear: 1988))
        XCTAssertThrowsError(try sut.termDate(for: .liChun, ofYear: 2109))
    }

    func testLiChun() {
        let holiday = try! sut.termDate(for: .liChun, ofYear: 2058)

        assertDate(holiday.components, month: 2, day: 3)
    }

    func testLiChun2000() {
        let holiday = try! sut.termDate(for: .liChun, ofYear: 2000)

        assertDate(holiday.components, month: 2, day: 4)
    }

    func testYuShui() {
        let holiday = try! sut.termDate(for: .yuShui, ofYear: 2008)

        assertDate(holiday.components, month: 2, day: 19)
    }

    func testJingZhe() {
        let holiday = try! sut.termDate(for: .jingZhe, ofYear: 2088)

        assertDate(holiday.components, month: 3, day: 4)
    }

    func testJingZhe2084() {
        let holiday = try! sut.termDate(for: .jingZhe, ofYear: 2084)

        assertDate(holiday.components, month: 3, day: 4)
    }

    func testChunFen() {
        let holiday = try! sut.termDate(for: .chunFen, ofYear: 2092)

        assertDate(holiday.components, month: 3, day: 19)
    }

    func testChunFen2() {
        let holiday = try! sut.termDate(for: .chunFen, ofYear: 2091)

        assertDate(holiday.components, month: 3, day: 20)
    }

    func testChunFenException() {
        let holiday = try! sut.termDate(for: .chunFen, ofYear: 2084)

        assertDate(holiday.components, month: 3, day: 19)
    }

    func testQingMing() {
        let holiday = try! sut.termDate(for: .qingMing, ofYear: 2088)

        assertDate(holiday.components, month: 4, day: 4)
    }

    func testGuYu() {
        let holiday = try! sut.termDate(for: .guYu, ofYear: 2088)

        assertDate(holiday.components, month: 4, day: 19)
    }

    func testLiXia() {
        let holiday = try! sut.termDate(for: .liXia, ofYear: 2088)

        assertDate(holiday.components, month: 5, day: 4)
    }

    func testXiaoMan() {
        let holiday = try! sut.termDate(for: .xiaoMan, ofYear: 2088)

        assertDate(holiday.components, month: 5, day: 20)
    }

    func testXiaoManException() {
        let holiday = try! sut.termDate(for: .xiaoMan, ofYear: 2008)

        assertDate(holiday.components, month: 5, day: 21)
    }

    func testMangZhong() {
        let holiday = try! sut.termDate(for: .mangZhong, ofYear: 2088)

        assertDate(holiday.components, month: 6, day: 4)
    }

    func testXiaZhi() {
        let holiday = try! sut.termDate(for: .xiaZhi, ofYear: 2088)

        assertDate(holiday.components, month: 6, day: 20)
    }

    func testXiaoShu() {
        let holiday = try! sut.termDate(for: .xiaoShu, ofYear: 2088)

        assertDate(holiday.components, month: 7, day: 6)
    }

    func testXiaoShu2016() {
        let holiday = try! sut.termDate(for: .xiaoShu, ofYear: 2016)

        assertDate(holiday.components, month: 7, day: 7)
    }

    func testDaShu() {
        let holiday = try! sut.termDate(for: .daShu, ofYear: 2088)

        assertDate(holiday.components, month: 7, day: 22)
    }

    func testLiQiu() {
        let holiday = try! sut.termDate(for: .liQiu, ofYear: 2088)

        assertDate(holiday.components, month: 8, day: 6)
    }

    func testLiQiu2002() {
        let holiday = try! sut.termDate(for: .liQiu, ofYear: 2002)

        assertDate(holiday.components, month: 8, day: 8)
    }

    func testChuShu() {
        let holiday = try! sut.termDate(for: .chuShu, ofYear: 2088)

        assertDate(holiday.components, month: 8, day: 22)
    }

    func testBaiLu() {
        let holiday = try! sut.termDate(for: .baiLu, ofYear: 2088)

        assertDate(holiday.components, month: 9, day: 6)
    }

    func testQiuFen() {
        let holiday = try! sut.termDate(for: .qiuFen, ofYear: 2088)

        assertDate(holiday.components, month: 9, day: 22)
    }

    func testHanLu() {
        let holiday = try! sut.termDate(for: .hanLu, ofYear: 2088)

        assertDate(holiday.components, month: 10, day: 7)
    }

    func testShuangJiang() {
        let holiday = try! sut.termDate(for: .shuangJiang, ofYear: 2088)

        assertDate(holiday.components, month: 10, day: 22)
    }

    func testShuangJiang2089() {
        let holiday = try! sut.termDate(for: .shuangJiang, ofYear: 2089)

        assertDate(holiday.components, month: 10, day: 23)
    }

    func testLiDong() {
        let holiday = try! sut.termDate(for: .liDong, ofYear: 2088)

        assertDate(holiday.components, month: 11, day: 6)
    }

    func testXiaoXue() {
        let holiday = try! sut.termDate(for: .xiaoXue, ofYear: 2088)

        assertDate(holiday.components, month: 11, day: 21)
    }

    func testDaXue() {
        let holiday = try! sut.termDate(for: .daXue, ofYear: 2088)

        assertDate(holiday.components, month: 12, day: 6)
    }

    func testDongZhi() {
        let holiday = try! sut.termDate(for: .dongZhi, ofYear: 2088)

        assertDate(holiday.components, month: 12, day: 21)
    }

    func testDongZhi2021() {
        let holiday = try! sut.termDate(for: .dongZhi, ofYear: 2021)

        assertDate(holiday.components, month: 12, day: 21)
    }

    func testXiaoHan() {
        let holiday = try! sut.termDate(for: .xiaoHan, ofYear: 2088)

        assertDate(holiday.components, month: 1, day: 5)
    }

    func testXiaoHan2019() {
        let holiday = try! sut.termDate(for: .xiaoHan, ofYear: 2019)

        assertDate(holiday.components, month: 1, day: 5)
    }

    func testDaHan() {
        let holiday = try! sut.termDate(for: .daHan, ofYear: 2089)

        assertDate(holiday.components, month: 1, day: 19)
    }

    func testDaHan2082() {
        let holiday = try! sut.termDate(for: .daHan, ofYear: 2082)

        assertDate(holiday.components, month: 1, day: 20)
    }

    func assertDate(_ dateCompo: SolarTerm.DateComponents, month: Int, day: Int) {
        XCTAssertEqual(dateCompo.month, month)
        XCTAssertEqual(dateCompo.day, day)
    }
}

// MARK: - Gan Zhi for Date
extension SolarTermMonthCalculatorTests {
    func testGanZhi20840319Toronto() {
        let components = SolarTerm.DateComponents(year: 2084, month: 3, day: 19)

        let result = try! sut.monthGanZhi(for: components)
        result.tianGan.equal(.ding)
        result.diZhi.equal(.mao)
    }

    func testGanZhi20840318Toronto() {
        let components = SolarTerm.DateComponents(year: 2084, month: 3, day: 18)

        let result = try! sut.monthGanZhi(for: components)
        result.tianGan.equal(.ding)
        result.diZhi.equal(.mao)
    }

    func testGanZhi20840304Toronto() {
        let components = SolarTerm.DateComponents(year: 2084, month: 3, day: 4)

        let result = try! sut.monthGanZhi(for: components)
        result.tianGan.equal(.ding)
        result.diZhi.equal(.mao)
    }

    func testGanZhi20840303Toronto() {
        let components = SolarTerm.DateComponents(year: 2084, month: 3, day: 3)

        let result = try! sut.monthGanZhi(for: components)
        result.tianGan.equal(.bing)
        result.diZhi.equal(.yin)
    }
}

// MARK: - Getting the right term
extension SolarTermMonthCalculatorTests {
    func testCanadaTime20840319Night() {
        let dateComponents = SolarTerm.DateComponents(year: 2084, month: 3, day: 19)

        let holiday = try! sut.sameGanZhiTerm(for: dateComponents)

        XCTAssertEqual(holiday.type, .chunFen)
    }

    func testCanadaTime20840319Noon() {
        let dateComponents = SolarTerm.DateComponents(year: 2084, month: 3, day: 19)

        let holiday = try! sut.sameGanZhiTerm(for: dateComponents)

        XCTAssertEqual(holiday.components, SolarTerm.DateComponents(year: 2084, month: 3, day: 19))
        XCTAssertEqual(holiday.type, .chunFen)
    }

    func testCanadaTime20840319Morning() {
        let dateComponents = SolarTerm.DateComponents(year: 2084, month: 3, day: 19)

        let holiday = try! sut.sameGanZhiTerm(for: dateComponents)

        XCTAssertEqual(holiday.type, .chunFen)
    }

    func testSameHoliday20000101() {
        let dateComponents = SolarTerm.DateComponents(year: 2000, month: 1, day: 1)

        XCTAssertThrowsError(try sut.sameGanZhiTerm(for: dateComponents))
    }

    func testSameHoliday20991231() {
        let dateComponents = SolarTerm.DateComponents(year: 2099, month: 12, day: 31)

        XCTAssertEqual(try! sut.sameGanZhiTerm(for: dateComponents).type, .dongZhi)
    }
}

// MARK: - Xiao Han Tian Gan
extension SolarTermMonthCalculatorTests {
    func testTianGanXiaoHan2000() {
        let tianGan = sut.xiaoHanTianGan(forYear: 2000)

        tianGan.equal(.ding)
    }

    func testTianGanXiaoHan2084() {
        sut.xiaoHanTianGan(forYear: 2084).equal(.yi)
    }

    func testTianGanXiaoHan1985() {
        sut.xiaoHanTianGan(forYear: 1985).equal(.ding)
    }
}

// MARK: - Gan Zhi For Term Date
extension SolarTermMonthCalculatorTests {
    func testGanZhi2084ChunFenAsia() {
        let components = SolarTerm.DateComponents(year: 2084, month: 3, day: 20)

        let result = sut.ganZhi(for: SolarTerm.Date(components: components, type: .chunFen))
        result.tianGan.equal(.ding)
        result.diZhi.equal(.mao)
    }

    func testGanZhi2084ChunFenToronto() {
        let components = SolarTerm.DateComponents(year: 2084, month: 3, day: 19)

        let result = sut.ganZhi(for: SolarTerm.Date(components: components, type: .chunFen))
        result.tianGan.equal(.ding)
        result.diZhi.equal(.mao)
    }

    func testGanZhi2084MangZhongAsia() {
        let components = SolarTerm.DateComponents(year: 2084, month: 6, day: 5)

        let result = sut.ganZhi(for: SolarTerm.Date(components: components, type: .mangZhong))
        result.tianGan.equal(.geng)
        result.diZhi.equal(.wu)
    }
}

private extension TianGan {
    func equal(_ other: TianGan, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(self, other, file: file, line: line)
    }
}

private extension DiZhi {
    func equal(_ other: DiZhi, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(self, other, file: file, line: line)
    }
}

private class MockDataLoader: SolarTermDataLoader {

    var data: [[Int]]!

    override init() {
        super.init()
        data = try! super.loadData()
    }

    override func loadData() throws -> [[Int]] {
        return data
    }
}
