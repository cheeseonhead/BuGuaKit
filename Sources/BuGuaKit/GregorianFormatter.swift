//
//  GregorianFormatter.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-30.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public struct GregorianFormatter {
    let style: DateComponentsFormatter.UnitsStyle

    public init(style: DateComponentsFormatter.UnitsStyle) {
        self.style = style
    }

    public func formatGregorianDate(_ date: GregorianDate, time: GregorianTime) -> String {
        var dateCompo = DateComponents(year: date.year, month: date.month, day: date.day)
        dateCompo.hour = time.hour
        dateCompo.minute = time.minute

        return DateComponentsFormatter.localizedString(from: dateCompo, unitsStyle: style)!
    }
}
