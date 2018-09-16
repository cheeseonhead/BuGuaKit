//
//  GanZhi.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-16.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public struct GanZhi {
    let tianGan: TianGan
    let diZhi: DiZhi

    init(_ gan: TianGan, _ zhi: DiZhi) {
        tianGan = gan
        diZhi = zhi
    }
}
