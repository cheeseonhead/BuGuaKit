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
        let date = try! sut.date(for: .liChun, of: 2058)

        assertDate(date, month: 2, day: 3)
    }

    func testLiChun2000() {
        let date = try! sut.date(for: .liChun, of: 2000)

        assertDate(date, month: 2, day: 4)
    }

    func testYuShui() {
        let date = try! sut.date(for: .yuShui, of: 2008)

        assertDate(date, month: 2, day: 19)
    }

    func testJingZhi() {
        let date = try! sut.date(for: .jingZhi, of: 2088)

        assertDate(date, month: 3, day: 4)
    }

    func testJingZhi2084() {
        let date = try! sut.date(for: .jingZhi, of: 2084)

        assertDate(date, month: 3, day: 4)
    }

    func testChunFen() {
        let date = try! sut.date(for: .chunFen, of: 2092)

        assertDate(date, month: 3, day: 19)
    }

    func testChunFen2() {
        let date = try! sut.date(for: .chunFen, of: 2091)

        assertDate(date, month: 3, day: 20)
    }

    func testChunFenException() {
        let date = try! sut.date(for: .chunFen, of: 2084)

        assertDate(date, month: 3, day: 20)
    }

    func testQingMing() {
        let date = try! sut.date(for: .qingMing, of: 2088)

        assertDate(date, month: 4, day: 4)
    }

    func testGuYu() {
        let date = try! sut.date(for: .guYu, of: 2088)

        assertDate(date, month: 4, day: 19)
    }

    func testLiXia() {
        let date = try! sut.date(for: .liXia, of: 2088)

        assertDate(date, month: 5, day: 4)
    }

    func testXiaoMan() {
        let date = try! sut.date(for: .xiaoMan, of: 2088)

        assertDate(date, month: 5, day: 20)
    }

    func testXiaoManException() {
        let date = try! sut.date(for: .xiaoMan, of: 2008)

        assertDate(date, month: 5, day: 21)
    }

    func testMangZhong() {
        let date = try! sut.date(for: .mangZhong, of: 2088)

        assertDate(date, month: 6, day: 4)
    }

    func testXiaZhi() {
        let date = try! sut.date(for: .xiaZhi, of: 2088)

        assertDate(date, month: 6, day: 20)
    }

    func testXiaoShu() {
        let date = try! sut.date(for: .xiaoShu, of: 2088)

        assertDate(date, month: 7, day: 6)
    }

    func testXiaoShu2016() {
        let date = try! sut.date(for: .xiaoShu, of: 2016)

        assertDate(date, month: 7, day: 7)
    }

    func testDaShu() {
        let date = try! sut.date(for: .daShu, of: 2088)

        assertDate(date, month: 7, day: 22)
    }

    func testLiQiu() {
        let date = try! sut.date(for: .liQiu, of: 2088)

        assertDate(date, month: 8, day: 6)
    }

    func testLiQiu2002() {
        let date = try! sut.date(for: .liQiu, of: 2002)

        assertDate(date, month: 8, day: 8)
    }

    func testChuShu() {
        let date = try! sut.date(for: .chuShu, of: 2088)

        assertDate(date, month: 8, day: 22)
    }

    func testBaiLu() {
        let date = try! sut.date(for: .baiLu, of: 2088)

        assertDate(date, month: 9, day: 6)
    }

    func testQiuFen() {
        let date = try! sut.date(for: .qiuFen, of: 2088)

        assertDate(date, month: 9, day: 22)
    }

    func testHanLu() {
        let date = try! sut.date(for: .hanLu, of: 2088)

        assertDate(date, month: 10, day: 7)
    }

    func testShuangJiang() {
        let date = try! sut.date(for: .shuangJiang, of: 2088)

        assertDate(date, month: 10, day: 22)
    }

    func testShuangJiang2089() {
        let date = try! sut.date(for: .shuangJiang, of: 2089)

        assertDate(date, month: 10, day: 23)
    }

    func testLiDong() {
        let date = try! sut.date(for: .liDong, of: 2088)

        assertDate(date, month: 11, day: 6)
    }

    func testXiaoXue() {
        let date = try! sut.date(for: .xiaoXue, of: 2088)

        assertDate(date, month: 11, day: 21)
    }

    func testDaXue() {
        let date = try! sut.date(for: .daXue, of: 2088)

        assertDate(date, month: 12, day: 6)
    }

    func testDongZhi() {
        let date = try! sut.date(for: .dongZhi, of: 2088)

        assertDate(date, month: 12, day: 21)
    }

    func testDongZhi2021() {
        let date = try! sut.date(for: .dongZhi, of: 2021)

        assertDate(date, month: 12, day: 21)
    }

    func testXiaoHan() {
        let date = try! sut.date(for: .xiaoHan, of: 2088)

        assertDate(date, month: 1, day: 5)
    }

    func testXiaoHan2019() {
        let date = try! sut.date(for: .xiaoHan, of: 2019)

        assertDate(date, month: 1, day: 5)
    }

    func testDaHan() {
        let date = try! sut.date(for: .daHan, of: 2089)

        assertDate(date, month: 1, day: 19)
    }

    func testDaHan2082() {
        let date = try! sut.date(for: .daHan, of: 2082)

        assertDate(date, month: 1, day: 20)
    }

    func assertDate(_ date: Date, month: Int, day: Int) {

        let compos = Calendar.current.dateComponents(in: TimeZone(identifier: "Asia/Taipei")!, from: date)

        XCTAssertEqual(compos.month, month)
        XCTAssertEqual(compos.day, day)
    }
}
