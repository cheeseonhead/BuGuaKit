//
//  LiuQin.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-08-27.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

enum LiuQin {
    case parent, descendant, wealth, sibling, superior

    init(from relationship: WuXing.Relationship) {
        switch relationship {
        case .generatedBy: self = .parent
        case .generates: self = .descendant
        case .overcomes: self = .wealth
        case .same: self = .sibling
        case .overcomedBy: self = .superior
        }
    }
}
