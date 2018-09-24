//
//  GregorianTime.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-24.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public struct GregorianTime {
    public static let zero = GregorianTime(hour: 0, minute: 0)

    let hour: Int
    let minute: Int

    private let calendar = Calendar(identifier: .gregorian)

    public init(timeZone: TimeZone, date: Date) {
        let dateComponents = calendar.dateComponents(in: timeZone, from: date)

        hour = dateComponents.hour!
        minute = dateComponents.minute!
    }

    private init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
}
