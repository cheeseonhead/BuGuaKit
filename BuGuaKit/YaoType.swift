//
//  YaoType.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-08-25.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

enum YaoType {
    case oldYang, oldYin, youngYang, youngYin

    var originalYi: LiangYi {
        switch self {
        case .oldYang, .youngYang: return .yang
        case .oldYin, .youngYin: return .yin
        }
    }

    var changedYi: LiangYi {
        switch self {
        case .oldYin, .youngYang: return .yang
        case .oldYang, .youngYin: return .yin
        }
    }

    var isStable: Bool {
        switch self {
        case .oldYin, .oldYang: return false
        case .youngYin, .youngYang: return true
        }
    }
}
