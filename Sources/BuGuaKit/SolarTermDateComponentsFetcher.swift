//
//  SolarTermDateComponent.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-16.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

class SolarTermDateComponentsFetcher {

    enum Error: LocalizedError {
        case yearOutOfRange(Int, Int, Int)

        var errorDescription: String? {
            switch self {
            case let .yearOutOfRange(year, min, max):
                return "\(year)不介於\(min)與\(max)之間"
            }
        }
    }

    let referenceTimeZone = TimeZone.taipei
    private let minYear = 2000
    private let maxYear = 2099
    private let dataLoader: SolarTermDataLoader

    init(dataLoader: SolarTermDataLoader) {
        self.dataLoader = dataLoader
    }

    func dateComponent(for term: SolarTerm, year: Int) throws -> DateComponents {
        guard year >= 2000 && year <= 2099 else {
            throw Error.yearOutOfRange(year, minYear, maxYear)
        }

        let startOfYearIndex = (year - minYear) * 24
        let termIndex = startOfYearIndex + term.index

        let dateData = try dataLoader.loadData()[termIndex]

        return DateComponents(timeZone: referenceTimeZone,
                              year: dateData[0],
                              month: dateData[1],
                              day: dateData[2],
                              hour: dateData[3],
                              minute: dateData[4],
                              second: dateData[5])
    }
}
