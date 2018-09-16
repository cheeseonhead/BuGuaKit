//
//  DateGanZhi.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-16.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public struct DateGanZhi {
    let year: GanZhi
    let month: GanZhi
    let day: GanZhi

    static let `default` = DateGanZhi(year: GanZhi(.jia, .zi),
                                      month: GanZhi(.jia, .zi),
                                      day: GanZhi(.jia, .zi))
}
