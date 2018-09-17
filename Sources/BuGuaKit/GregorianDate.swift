//
//  GregorianDate.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-16.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public struct GregorianDate: Comparable {
    public let year: Int
    public let month: Int
    public let day: Int

    public init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }

    func makeComponent() -> Foundation.DateComponents {
        return Foundation.DateComponents(year: year, month: month, day: day)
    }

    public static func < (lhs: GregorianDate, rhs: GregorianDate) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        } else if lhs.month != rhs.month {
            return lhs.month < rhs.month
        } else if lhs.day != rhs.day {
            return lhs.day < rhs.day
        }

        return false
    }

    func days(from otherComponents: GregorianDate) -> Int {
        let selfCompo = makeComponent()
        let otherCompo = otherComponents.makeComponent()

        let days = Calendar.current.dateComponents([.day], from: otherCompo, to: selfCompo).day!

        return days
    }
}
