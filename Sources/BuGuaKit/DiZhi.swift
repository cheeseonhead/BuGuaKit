//
//  DiZhi.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-08-25.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public enum DiZhi {
    case zi, chou, yin, mao, chen, si, wu, wei, shen, you, xu, hai

    var wuXing: WuXing {
        switch self {
        case .chou, .chen, .wei, .xu: return .earth
        case .hai, .zi: return .water
        case .yin, .mao: return .wood
        case .si, .wu: return .fire
        case .shen, .you: return .gold
        }
    }
}
