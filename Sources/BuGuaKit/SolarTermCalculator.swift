//
//  SolarTermCalculator.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-14.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public class SolarTermCalculator {

    public typealias GanZhi = (tianGan: TianGan, diZhi: DiZhi)

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

    public func monthGanZhi(for date: Date) throws -> GanZhi {
        let term = try sameGanZhiTerm(for: date)
        let ganZhiForTerm = ganZhi(for: term)

        return ganZhiForTerm
    }

    func sameGanZhiTerm(for date: Date) throws -> SolarTerm.Date {
        let year = Calendar.current.dateComponents(in: referenceTimeZone, from: date).year!

        guard year >= minYear + 1 && year <= maxYear else {
            throw Error.yearOutOfRange(year: year, minYear + 1, maxYear)
        }

        let possibleTerms = try terms(forYears: [year - 1, year]).sorted(by: { $0.date < $1.date })

        var finalTerm: SolarTerm.Date!
        for term in possibleTerms {
            guard term.date < date else { break }

            finalTerm = term
        }

        return finalTerm
    }

    func date(for term: SolarTerm, ofYear year: Int) throws -> SolarTerm.Date {
        guard year >= minYear && year <= maxYear else {
            throw Error.yearOutOfRange(year: year, minYear, maxYear)
        }

        let month = SolarTermCalculator.gregorianMonth(for: term)
        let day = SolarTermCalculator.gregorianDay(for: term, year: year)

        let dateComponents = DateComponents(timeZone: referenceTimeZone, year: year, month: month, day: day)

        return SolarTerm.Date(date: Calendar.current.date(from: dateComponents)!, type: term)
    }
}

// MARK: - Gan Zhi
extension SolarTermCalculator {

    private var xiaoHan2000TianGan: TianGan { return .ding }
    private var xiaoHanReferenceYear: Int { return 2000 }

    func ganZhi(for termDate: SolarTerm.Date) -> GanZhi {
        let tianGan = self.tianGan(for: termDate)
        let diZhi = SolarTermCalculator.diZhi(for: termDate.type)

        return (tianGan, diZhi)
    }

    func tianGan(for termDate: SolarTerm.Date) -> TianGan {
        let monthOffsetFromXiaoHan = termDate.type.index / 2
        return xiaoHanTianGan(forYear: termDate.year(in: referenceTimeZone))
            .tianGan(after: monthOffsetFromXiaoHan)
    }

    func xiaoHanTianGan(forYear year: Int) -> TianGan {
        let monthsPassed = (year - xiaoHanReferenceYear) * 12
        let tianGanThisYear = xiaoHan2000TianGan.tianGan(after: monthsPassed)

        return tianGanThisYear
    }
}

// MARK: - Gan Zhi Helpers
private extension SolarTermCalculator {
    static func diZhi(for term: SolarTerm) -> DiZhi {
        switch gregorianMonth(for: term) {
        case 1: return .chou
        case 2: return .yin
        case 3: return .mao
        case 4: return .chen
        case 5: return .si
        case 6: return .wu
        case 7: return .wei
        case 8: return .shen
        case 9: return .you
        case 10: return .xu
        case 11: return .hai
        case 12: return .zi
        default: fatalError()
        }
    }
}

// MARK: - Term Date
private extension SolarTermCalculator {

    func terms(forYears years: [Int]) throws -> [SolarTerm.Date] {
        return try years.flatMap {
            try terms(forYear: $0)
        }
    }

    func terms(forYear year: Int) throws -> [SolarTerm.Date] {
        return try SolarTerm.allCases.map {
            try date(for: $0, ofYear: year)
        }
    }

    static func gregorianDay(for term: SolarTerm, year: Int) -> Int {
        let adjustedYearEnd = Double(adjustYearEnd(for: term, year: year))
        let d = 0.2422
        let c = constant(for: term)

        let leapCount = adjustedYearEnd / 4

        let term1 = (adjustedYearEnd * d + c)

        let result = term1.rounded(.down) - leapCount.rounded(.down)

        return Int(result) + offset(for: term, year: year)
    }

    // For leap years, we have to subtract 1 from the year count
    static func adjustYearEnd(for term: SolarTerm, year: Int) -> Int {
        let y = year % 100
        if isLeapYear(year: year) && gregorianMonth(for: term) <= 2 {
            return y - 1
        } else {
            return y
        }
    }

    static func isLeapYear(year: Int) -> Bool {
        return year % 4 == 0 && year % 100 != 0 || year % 400 == 0
    }

    static func gregorianMonth(for term: SolarTerm) -> Int {
        switch term {
        case .liChun: return 2
        case .yuShui: return 2
        case .jingZhe: return 3
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

    static func offset(for term: SolarTerm, year: Int) -> Int {
        switch term {
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
    static func constant(for term: SolarTerm) -> Double {
        switch term {
        case .liChun: return 3.87
        case .yuShui: return 18.73
        case .jingZhe: return 5.63
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
