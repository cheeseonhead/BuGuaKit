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
        XCTAssertThrowsError(try sut.date(for: .liChun, of: 1988))
        XCTAssertThrowsError(try sut.date(for: .liChun, of: 2109))
    }

    func testLiChun() {
        let holiday = try! sut.date(for: .liChun, of: 2058)

        assertDate(holiday.date, month: 2, day: 3)
    }

    func testLiChun2000() {
        let holiday = try! sut.date(for: .liChun, of: 2000)

        assertDate(holiday.date, month: 2, day: 4)
    }

    func testYuShui() {
        let holiday = try! sut.date(for: .yuShui, of: 2008)

        assertDate(holiday.date, month: 2, day: 19)
    }

    func testJingZhi() {
        let holiday = try! sut.date(for: .jingZhi, of: 2088)

        assertDate(holiday.date, month: 3, day: 4)
    }

    func testJingZhi2084() {
        let holiday = try! sut.date(for: .jingZhi, of: 2084)

        assertDate(holiday.date, month: 3, day: 4)
    }

    func testChunFen() {
        let holiday = try! sut.date(for: .chunFen, of: 2092)

        assertDate(holiday.date, month: 3, day: 19)
    }

    func testChunFen2() {
        let holiday = try! sut.date(for: .chunFen, of: 2091)

        assertDate(holiday.date, month: 3, day: 20)
    }

    func testChunFenException() {
        let holiday = try! sut.date(for: .chunFen, of: 2084)

        assertDate(holiday.date, month: 3, day: 20)
    }

    func testQingMing() {
        let holiday = try! sut.date(for: .qingMing, of: 2088)

        assertDate(holiday.date, month: 4, day: 4)
    }

    func testGuYu() {
        let holiday = try! sut.date(for: .guYu, of: 2088)

        assertDate(holiday.date, month: 4, day: 19)
    }

    func testLiXia() {
        let holiday = try! sut.date(for: .liXia, of: 2088)

        assertDate(holiday.date, month: 5, day: 4)
    }

    func testXiaoMan() {
        let holiday = try! sut.date(for: .xiaoMan, of: 2088)

        assertDate(holiday.date, month: 5, day: 20)
    }

    func testXiaoManException() {
        let holiday = try! sut.date(for: .xiaoMan, of: 2008)

        assertDate(holiday.date, month: 5, day: 21)
    }

    func testMangZhong() {
        let holiday = try! sut.date(for: .mangZhong, of: 2088)

        assertDate(holiday.date, month: 6, day: 4)
    }

    func testXiaZhi() {
        let holiday = try! sut.date(for: .xiaZhi, of: 2088)

        assertDate(holiday.date, month: 6, day: 20)
    }

    func testXiaoShu() {
        let holiday = try! sut.date(for: .xiaoShu, of: 2088)

        assertDate(holiday.date, month: 7, day: 6)
    }

    func testXiaoShu2016() {
        let holiday = try! sut.date(for: .xiaoShu, of: 2016)

        assertDate(holiday.date, month: 7, day: 7)
    }

    func testDaShu() {
        let holiday = try! sut.date(for: .daShu, of: 2088)

        assertDate(holiday.date, month: 7, day: 22)
    }

    func testLiQiu() {
        let holiday = try! sut.date(for: .liQiu, of: 2088)

        assertDate(holiday.date, month: 8, day: 6)
    }

    func testLiQiu2002() {
        let holiday = try! sut.date(for: .liQiu, of: 2002)

        assertDate(holiday.date, month: 8, day: 8)
    }

    func testChuShu() {
        let holiday = try! sut.date(for: .chuShu, of: 2088)

        assertDate(holiday.date, month: 8, day: 22)
    }

    func testBaiLu() {
        let holiday = try! sut.date(for: .baiLu, of: 2088)

        assertDate(holiday.date, month: 9, day: 6)
    }

    func testQiuFen() {
        let holiday = try! sut.date(for: .qiuFen, of: 2088)

        assertDate(holiday.date, month: 9, day: 22)
    }

    func testHanLu() {
        let holiday = try! sut.date(for: .hanLu, of: 2088)

        assertDate(holiday.date, month: 10, day: 7)
    }

    func testShuangJiang() {
        let holiday = try! sut.date(for: .shuangJiang, of: 2088)

        assertDate(holiday.date, month: 10, day: 22)
    }

    func testShuangJiang2089() {
        let holiday = try! sut.date(for: .shuangJiang, of: 2089)

        assertDate(holiday.date, month: 10, day: 23)
    }

    func testLiDong() {
        let holiday = try! sut.date(for: .liDong, of: 2088)

        assertDate(holiday.date, month: 11, day: 6)
    }

    func testXiaoXue() {
        let holiday = try! sut.date(for: .xiaoXue, of: 2088)

        assertDate(holiday.date, month: 11, day: 21)
    }

    func testDaXue() {
        let holiday = try! sut.date(for: .daXue, of: 2088)

        assertDate(holiday.date, month: 12, day: 6)
    }

    func testDongZhi() {
        let holiday = try! sut.date(for: .dongZhi, of: 2088)

        assertDate(holiday.date, month: 12, day: 21)
    }

    func testDongZhi2021() {
        let holiday = try! sut.date(for: .dongZhi, of: 2021)

        assertDate(holiday.date, month: 12, day: 21)
    }

    func testXiaoHan() {
        let holiday = try! sut.date(for: .xiaoHan, of: 2088)

        assertDate(holiday.date, month: 1, day: 5)
    }

    func testXiaoHan2019() {
        let holiday = try! sut.date(for: .xiaoHan, of: 2019)

        assertDate(holiday.date, month: 1, day: 5)
    }

    func testDaHan() {
        let holiday = try! sut.date(for: .daHan, of: 2089)

        assertDate(holiday.date, month: 1, day: 19)
    }

    func testDaHan2082() {
        let holiday = try! sut.date(for: .daHan, of: 2082)

        assertDate(holiday.date, month: 1, day: 20)
    }

    func assertDate(_ date: Date, month: Int, day: Int) {

        let compos = Calendar.current.dateComponents(in: TimeZone(identifier: "Asia/Taipei")!, from: date)

        XCTAssertEqual(compos.month, month)
        XCTAssertEqual(compos.day, day)
    }
}
