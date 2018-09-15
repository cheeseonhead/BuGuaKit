//
//  ChineseHolidayControllerTests.swift
//  BuGuaKitTests
//
//  Created by Jeffrey Wu on 2018-09-14.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import XCTest
@testable import BuGuaKit

class ChineseHolidayControllerTests: XCTestCase {

    var sut: ChineseHolidayController!

    override func setUp() {
        sut = ChineseHolidayController()
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

    func testJingZhi() {
        let holiday = try! sut.date(for: .jingZhi, ofYear: 2088)

        assertDate(holiday.date, month: 3, day: 4)
    }

    func testJingZhi2084() {
        let holiday = try! sut.date(for: .jingZhi, ofYear: 2084)

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

// MARK: - Getting the right holiday
extension ChineseHolidayControllerTests {
    func testCanadaTime20840319Night() {
        let dateComponents = DateComponents(timeZone: TimeZone(identifier: "America/Toronto")!, year: 2084, month: 3, day: 19, hour: 23, minute: 00)
        let testDate = Calendar.current.date(from: dateComponents)!

        let holiday = try! sut.sameGanZhiHoliday(for: testDate)

        XCTAssertEqual(holiday.type, .chunFen)
    }

    func testCanadaTime20840319Morning() {
        let dateComponents = DateComponents(timeZone: TimeZone(identifier: "America/Toronto")!, year: 2084, month: 3, day: 19, hour: 5, minute: 00)
        let testDate = Calendar.current.date(from: dateComponents)!

        let holiday = try! sut.sameGanZhiHoliday(for: testDate)

        XCTAssertEqual(holiday.type, .jingZhi)
    }
}
