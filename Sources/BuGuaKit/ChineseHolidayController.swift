//
//  ChineseHolidayController.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-14.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public class ChineseHolidayController {

    enum Error: LocalizedError {
        case yearOutOfRange(year: Int, Int, Int)

        var errorDescription: String? {
            switch self {
            case let .yearOutOfRange(year, minYear, maxYear): return "\(year)不在\(minYear)到\(maxYear)之間"
            }
        }
    }

    // MARK: - Private Constant
    private let minYear = 2000
    private let maxYear = 2099
    private let referenceTimeZone = TimeZone(identifier: "Asia/Taipei")!
    private var referenceCalendar = Calendar(identifier: .gregorian)

    init() {
        referenceCalendar.timeZone = referenceTimeZone
    }

    func ganZhi(for date: Date) -> (gan: TianGan, zhi: DiZhi) {



        return (.jia, .zi)
    }

//    func holidays(for year: Int) throws -> [ChineseHoliday: Date] {
//
//    }

    func date(for holiday: ChineseHoliday, of year: Int) throws -> Date {
        guard year >= minYear && year <= maxYear else {
            throw Error.yearOutOfRange(year: year, minYear, maxYear)
        }

        let month = ChineseHolidayController.gregorianMonth(for: holiday)
        let day = ChineseHolidayController.gregorianDay(for: holiday, year: year)

        let dateComponents = DateComponents(timeZone: referenceTimeZone, year: year, month: month, day: day)

        return Calendar.current.date(from: dateComponents)!
    }
}

private extension ChineseHolidayController {

    static func gregorianDay(for holiday: ChineseHoliday, year: Int) -> Int {
        let adjustedYearEnd = Double(adjustYearEnd(for: holiday, year: year))
        let d = 0.2422
        let c = constant(for: holiday)

        let leapCount = adjustedYearEnd / 4

        let term1 = (adjustedYearEnd * d + c)

        let result = term1.rounded(.down) - leapCount.rounded(.down)

        return Int(result) + offset(for: holiday, year: year)
    }

    // For leap years, we have to subtract 1 from the year count
    static func adjustYearEnd(for holiday: ChineseHoliday, year: Int) -> Int {
        let y = year % 100
        if isLeapYear(year: year) && gregorianMonth(for: holiday) <= 2 {
            return y - 1
        } else {
            return y
        }
    }

    static func isLeapYear(year: Int) -> Bool {
        return year % 4 == 0 && year % 100 != 0 || year % 400 == 0
    }

    static func gregorianMonth(for holiday: ChineseHoliday) -> Int {
        switch holiday {
        case .liChun: return 2
        case .yuShui: return 2
        case .jingZhi: return 3
        case .chunFen: return 3
        case .qingMing: return 4
        case .guYu: return 4
        case .liXia: return 5
        case .xiaoMan: return 5
        case .mangZhong: return 6
        case .xiaZhi: return 6
        case .xiaoShu: return 7
        case .daShu: return 7
        case .liQiu: return 8
        case .chuShu: return 8
        case .baiLu: return 9
        case .qiuFen: return 9
        case .hanLu: return 10
        case .shuangJiang: return 10
        case .liDong: return 11
        case .xiaoXue: return 11
        case .daXue: return 12
        case .dongZhi: return 12
        case .xiaoHan: return 1
        case .daHan: return 1
        }
    }

    static func offset(for holiday: ChineseHoliday, year: Int) -> Int {
        switch holiday {
            // This is wrong for some reason
        case .chunFen: return year == 2084 ? 1 : 0
        case .xiaoMan: return year == 2008 ? 1 : 0
        case .xiaoShu: return year == 2016 ? 1 : 0
        case .liQiu: return year == 2002 ? 1 : 0
        case .shuangJiang: return year == 2089 ? 1 : 0
        case .liDong: return year == 2089 ? 1 : 0
        case .dongZhi: return year == 2021 ? -1 : 0
        case .xiaoHan: return year == 2019 ? -1 : 0
        case .daHan: return year == 2082 ? 1 : 0
        default: return 0
        }
    }

    /// This constant is only for 21 century because others make it too complicated
    static func constant(for holiday: ChineseHoliday) -> Double {
        switch holiday {
        case .liChun: return 3.87
        case .yuShui: return 18.73
        case .jingZhi: return 5.63
        case .chunFen: return 20.646
        case .qingMing: return 4.81
        case .guYu: return 20.1
        case .liXia: return 5.52
        case .xiaoMan: return 21.04
        case .mangZhong: return 5.678
        case .xiaZhi: return 21.37
        case .xiaoShu: return 7.108
        case .daShu: return 22.83
        case .liQiu: return 7.5
        case .chuShu: return 23.13
        case .baiLu: return 7.646
        case .qiuFen: return 23.042
        case .hanLu: return 8.318
        case .shuangJiang: return 23.438
        case .liDong: return 7.438
        case .xiaoXue: return 22.36
        case .daXue: return 7.18
        case .dongZhi: return 21.94
        case .xiaoHan: return 5.4055
        case .daHan: return 20.12
        }
    }
}
