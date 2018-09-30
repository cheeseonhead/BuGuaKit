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

    public let hour: Int
    public let minute: Int

    private let calendar = Calendar(identifier: .gregorian)

    public init(timeZone: TimeZone, date: Date) {
        let dateComponents = calendar.dateComponents(in: timeZone, from: date)

        hour = dateComponents.hour!
        minute = dateComponents.minute!
    }

    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }

    public var components: DateComponents {
        return DateComponents(hour: hour, minute: minute, second: 0)
    }
}
