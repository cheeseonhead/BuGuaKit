//
// SolarTermCalculatorTests.swift
//  BuGuaKitTests
//
//  Created by Jeffrey Wu on 2018-09-14.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import XCTest
@testable import BuGuaKit

class SolarTermCalculatorTests: XCTestCase {

    var sut: SolarTermCalculator!

    override func setUp() {
        sut = SolarTermCalculator()
    }

    func testOutOfRange() {
        XCTAssertThrowsError(try sut.date(for: .liChun, ofYear: 1988))
        XCTAssertThrowsError(try sut.date(for: .liChun, ofYear: 2109))
    }

    func testLiChun() {
        let holiday = try! sut.date(for: .liChun, ofYear: 2058)

        assertDate(holiday.date, month: 2, day: 3)
    }

    func testLiChun2000() {
        let holiday = try! sut.date(for: .liChun, ofYear: 2000)

        assertDate(holiday.date, month: 2, day: 4)
    }

    func testYuShui() {
        let holiday = try! sut.date(for: .yuShui, ofYear: 2008)

        assertDate(holiday.date, month: 2, day: 19)
    }

    func testJingZhe() {
        let holiday = try! sut.date(for: .jingZhe, ofYear: 2088)

        assertDate(holiday.date, month: 3, day: 4)
    }

    func testJingZhe2084() {
        let holiday = try! sut.date(for: .jingZhe, ofYear: 2084)

        assertDate(holiday.date, month: 3, day: 4)
    }

    func testChunFen() {
        let holiday = try! sut.date(for: .chunFen, ofYear: 2092)

        assertDate(holiday.date, month: 3, day: 19)
    }

    func testChunFen2() {
        let holiday = try! sut.date(for: .chunFen, ofYear: 2091)

        assertDate(holiday.date, month: 3, day: 20)
    }

    func testChunFenException() {
        let holiday = try! sut.date(for: .chunFen, ofYear: 2084)

        assertDate(holiday.date, month: 3, day: 20)
    }

    func testQingMing() {
        let holiday = try! sut.date(for: .qingMing, ofYear: 2088)

        assertDate(holiday.date, month: 4, day: 4)
    }

    func testGuYu() {
        let holiday = try! sut.date(for: .guYu, ofYear: 2088)

        assertDate(holiday.date, month: 4, day: 19)
    }

    func testLiXia() {
        let holiday = try! sut.date(for: .liXia, ofYear: 2088)

        assertDate(holiday.date, month: 5, day: 4)
    }

    func testXiaoMan() {
        let holiday = try! sut.date(for: .xiaoMan, ofYear: 2088)

        assertDate(holiday.date, month: 5, day: 20)
    }

    func testXiaoManException() {
        let holiday = try! sut.date(for: .xiaoMan, ofYear: 2008)

        assertDate(holiday.date, month: 5, day: 21)
    }

    func testMangZhong() {
        let holiday = try! sut.date(for: .mangZhong, ofYear: 2088)

        assertDate(holiday.date, month: 6, day: 4)
    }

    func testXiaZhi() {
        let holiday = try! sut.date(for: .xiaZhi, ofYear: 2088)

        assertDate(holiday.date, month: 6, day: 20)
    }

    func testXiaoShu() {
        let holiday = try! sut.date(for: .xiaoShu, ofYear: 2088)

        assertDate(holiday.date, month: 7, day: 6)
    }

    func testXiaoShu2016() {
        let holiday = try! sut.date(for: .xiaoShu, ofYear: 2016)

        assertDate(holiday.date, month: 7, day: 7)
    }

    func testDaShu() {
        let holiday = try! sut.date(for: .daShu, ofYear: 2088)

        assertDate(holiday.date, month: 7, day: 22)
    }

    func testLiQiu() {
        let holiday = try! sut.date(for: .liQiu, ofYear: 2088)

        assertDate(holiday.date, month: 8, day: 6)
    }

    func testLiQiu2002() {
        let holiday = try! sut.date(for: .liQiu, ofYear: 2002)

        assertDate(holiday.date, month: 8, day: 8)
    }

    func testChuShu() {
        let holiday = try! sut.date(for: .chuShu, ofYear: 2088)

        assertDate(holiday.date, month: 8, day: 22)
    }

    func testBaiLu() {
        let holiday = try! sut.date(for: .baiLu, ofYear: 2088)

        assertDate(holiday.date, month: 9, day: 6)
    }

    func testQiuFen() {
        let holiday = try! sut.date(for: .qiuFen, ofYear: 2088)

        assertDate(holiday.date, month: 9, day: 22)
    }

    func testHanLu() {
        let holiday = try! sut.date(for: .hanLu, ofYear: 2088)

        assertDate(holiday.date, month: 10, day: 7)
    }

    func testShuangJiang() {
        let holiday = try! sut.date(for: .shuangJiang, ofYear: 2088)

        assertDate(holiday.date, month: 10, day: 22)
    }

    func testShuangJiang2089() {
        let holiday = try! sut.date(for: .shuangJiang, ofYear: 2089)

        assertDate(holiday.date, month: 10, day: 23)
    }

    func testLiDong() {
        let holiday = try! sut.date(for: .liDong, ofYear: 2088)

        assertDate(holiday.date, month: 11, day: 6)
    }

    func testXiaoXue() {
        let holiday = try! sut.date(for: .xiaoXue, ofYear: 2088)

        assertDate(holiday.date, month: 11, day: 21)
    }

    func testDaXue() {
        let holiday = try! sut.date(for: .daXue, ofYear: 2088)

        assertDate(holiday.date, month: 12, day: 6)
    }

    func testDongZhi() {
        let holiday = try! sut.date(for: .dongZhi, ofYear: 2088)

        assertDate(holiday.date, month: 12, day: 21)
    }

    func testDongZhi2021() {
        let holiday = try! sut.date(for: .dongZhi, ofYear: 2021)

        assertDate(holiday.date, month: 12, day: 21)
    }

    func testXiaoHan() {
        let holiday = try! sut.date(for: .xiaoHan, ofYear: 2088)

        assertDate(holiday.date, month: 1, day: 5)
    }

    func testXiaoHan2019() {
        let holiday = try! sut.date(for: .xiaoHan, ofYear: 2019)

        assertDate(holiday.date, month: 1, day: 5)
    }

    func testDaHan() {
        let holiday = try! sut.date(for: .daHan, ofYear: 2089)

        assertDate(holiday.date, month: 1, day: 19)
    }

    func testDaHan2082() {
        let holiday = try! sut.date(for: .daHan, ofYear: 2082)

        assertDate(holiday.date, month: 1, day: 20)
    }

    func assertDate(_ date: Date, month: Int, day: Int) {

        let compos = Calendar.current.dateComponents(in: TimeZone(identifier: "Asia/Taipei")!, from: date)

        XCTAssertEqual(compos.month, month)
        XCTAssertEqual(compos.day, day)
    }
}

// MARK: - Gan Zhi for Date
extension SolarTermCalculatorTests {
    func testGanZhi20840319Toronto() {
        let components = DateComponents(timeZone: TimeZone(identifier: "America/Toronto")!, year: 2084, month: 3, day: 19, hour: 12, minute: 00)

        let date = Calendar.current.date(from: components)!

        let result = try! sut.monthGanZhi(for: date)
        result.tianGan.equal(.ding)
        result.diZhi.equal(.mao)
    }

    func testGanZhi20840318Toronto() {
        let components = DateComponents(timeZone: TimeZone(identifier: "America/Toronto")!, year: 2084, month: 3, day: 18, hour: 12, minute: 00)

        let date = Calendar.current.date(from: components)!

        let result = try! sut.monthGanZhi(for: date)
        result.tianGan.equal(.ding)
        result.diZhi.equal(.mao)
    }

    func testGanZhi20840304Toronto() {
        let components = DateComponents(timeZone: TimeZone(identifier: "America/Toronto")!, year: 2084, month: 3, day: 4, hour: 12, minute: 00)

        let date = Calendar.current.date(from: components)!

        let result = try! sut.monthGanZhi(for: date)
        result.tianGan.equal(.ding)
        result.diZhi.equal(.mao)
    }

    func testGanZhi20840303Toronto() {
        let components = DateComponents(timeZone: TimeZone(identifier: "America/Toronto")!, year: 2084, month: 3, day: 03, hour: 0, minute: 00)

        let date = Calendar.current.date(from: components)!

        let result = try! sut.monthGanZhi(for: date)
        result.tianGan.equal(.bing)
        result.diZhi.equal(.yin)
    }
}

// MARK: - Getting the right holiday
extension SolarTermCalculatorTests {
    func testCanadaTime20840319Night() {
        let dateComponents = DateComponents(timeZone: TimeZone(identifier: "America/Toronto")!, year: 2084, month: 3, day: 19, hour: 23, minute: 00)
        let testDate = Calendar.current.date(from: dateComponents)!

        let holiday = try! sut.sameGanZhiTerm(for: testDate)

        XCTAssertEqual(holiday.type, .chunFen)
    }

    func testCanadaTime20840319Morning() {
        let dateComponents = DateComponents(timeZone: TimeZone(identifier: "America/Toronto")!, year: 2084, month: 3, day: 19, hour: 5, minute: 00)
        let testDate = Calendar.current.date(from: dateComponents)!

        let holiday = try! sut.sameGanZhiTerm(for: testDate)

        XCTAssertEqual(holiday.type, .jingZhe)
    }

    func testSameHoliday20000101() {
        let dateComponents = DateComponents(timeZone: TimeZone(identifier: "Asia/Taipei")!, year: 2000, month: 1, day: 1, hour: 5, minute: 00)
        let testDate = Calendar.current.date(from: dateComponents)!

        XCTAssertThrowsError(try sut.sameGanZhiTerm(for: testDate))
    }

    func testSameHoliday20991231() {
        let dateComponents = DateComponents(timeZone: TimeZone(identifier: "Asia/Taipei")!, year: 2099, month: 12, day: 31, hour: 23, minute: 59)
        let testDate = Calendar.current.date(from: dateComponents)!

        let holiday = try! sut.sameGanZhiTerm(for: testDate)

        XCTAssertEqual(holiday.type, .dongZhi)
    }

    func testSameHolidayCanada20991231() {
        let dateComponents = DateComponents(timeZone: TimeZone(identifier: "America/Toronto")!, year: 2099, month: 12, day: 31, hour: 23, minute: 59)
        let testDate = Calendar.current.date(from: dateComponents)!

        XCTAssertThrowsError(try sut.sameGanZhiTerm(for: testDate))
    }
}

// MARK: - Xiao Han Tian Gan
extension SolarTermCalculatorTests {
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
extension SolarTermCalculatorTests {
    func testGanZhi2084ChunFenAsia() {
        let components = DateComponents(timeZone: TimeZone(identifier: "Asia/Taipei")!, year: 2084, month: 3, day: 20, hour: 12, minute: 00)

        let date = Calendar.current.date(from: components)!
        let termDate = SolarTerm.Date(date: date, type: .chunFen)

        let result = sut.ganZhi(for: termDate)
        result.tianGan.equal(.ding)
        result.diZhi.equal(.mao)
    }

    func testGanZhi2084ChunFenToronto() {
        let components = DateComponents(timeZone: TimeZone(identifier: "America/Toronto")!, year: 2084, month: 3, day: 19, hour: 12, minute: 00)

        let date = Calendar.current.date(from: components)!
        let termDate = SolarTerm.Date(date: date, type: .chunFen)

        let result = sut.ganZhi(for: termDate)
        result.tianGan.equal(.ding)
        result.diZhi.equal(.mao)
    }

    func testGanZhi2084MangZhongAsia() {
        let components = DateComponents(timeZone: TimeZone(identifier: "Asia/Taipei")!, year: 2084, month: 6, day: 5, hour: 12, minute: 00)

        let date = Calendar.current.date(from: components)!
        let termDate = SolarTerm.Date(date: date, type: .mangZhong)

        let result = sut.ganZhi(for: termDate)
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
