//
//  SolarTermCalculator.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-14.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public class SolarTermMonthCalculator {

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

    // MARK: - Private Properties
    private let componentFetcher: SolarTermDateComponentsFetcher

    init(dateComponentFetcher: SolarTermDateComponentsFetcher) {
        self.componentFetcher = dateComponentFetcher
    }

    public func monthGanZhi(for dateComponents: SolarTerm.DateComponents) throws -> GanZhi {
        let term = try sameGanZhiTerm(for: dateComponents)
        let ganZhiForTerm = ganZhi(for: term)

        return ganZhiForTerm
    }

    func sameGanZhiTerm(for dateComponents: SolarTerm.DateComponents) throws -> SolarTerm.Date {
        let year = dateComponents.year

        guard year >= minYear + 1 && year <= maxYear else {
            throw Error.yearOutOfRange(year: year, minYear + 1, maxYear)
        }

        let possibleTermDates = try terms(forYears: [year - 1, year]).sorted(by: { $0.components < $1.components })

        var finalTermDate: SolarTerm.Date!
        for termDate in possibleTermDates {
            guard termDate.components <= dateComponents else { break }

            finalTermDate = termDate
        }

        return finalTermDate
    }

    func termDate(for term: SolarTerm, ofYear year: Int) throws -> SolarTerm.Date {
        let dateComponents = try componentFetcher.dateComponent(for: term, year: year)

        let termComponents = SolarTerm.DateComponents(year: dateComponents.year!, month: dateComponents.month!, day: dateComponents.day!)

        return SolarTerm.Date(components: termComponents, type: term)
    }
}

// MARK: - Gan Zhi
extension SolarTermMonthCalculator {

    private var xiaoHan2000TianGan: TianGan { return .ding }
    private var xiaoHanReferenceYear: Int { return 2000 }

    func ganZhi(for termDate: SolarTerm.Date) -> GanZhi {
        let tianGan = self.tianGan(for: termDate)
        let diZhi = SolarTermMonthCalculator.diZhi(for: termDate)

        return (tianGan, diZhi)
    }

    func tianGan(for termDate: SolarTerm.Date) -> TianGan {
        let monthOffsetFromXiaoHan = termDate.type.index / 2
        return xiaoHanTianGan(forYear: termDate.components.year)
            .tianGan(after: monthOffsetFromXiaoHan)
    }

    func xiaoHanTianGan(forYear year: Int) -> TianGan {
        let monthsPassed = (year - xiaoHanReferenceYear) * 12
        let tianGanThisYear = xiaoHan2000TianGan.tianGan(after: monthsPassed)

        return tianGanThisYear
    }
}

// MARK: - Gan Zhi Helpers
private extension SolarTermMonthCalculator {
    static func diZhi(for term: SolarTerm.Date) -> DiZhi {
        switch term.components.month {
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
private extension SolarTermMonthCalculator {

    func terms(forYears years: [Int]) throws -> [SolarTerm.Date] {
        return try years.flatMap {
            try terms(forYear: $0)
        }
    }

    func terms(forYear year: Int) throws -> [SolarTerm.Date] {
        return try SolarTerm.allCases.map {
            try termDate(for: $0, ofYear: year)
        }
    }
}
