//
//  WuXing.swift
//  BuGuaKit
//
//  Created by Cheese Onhead on 2018-07-22.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public enum WuXing: CaseIterable {

    enum Relationship {
        case generates, generatedBy, same, overcomes, overcomedBy
    }

    case gold, wood, water, fire, earth

    var generates: WuXing {
        switch self {
        case .gold: return .water
        case .water: return .wood
        case .wood: return .fire
        case .fire: return .earth
        case .earth: return .gold
        }
    }

    var generatedBy: WuXing {
        return WuXing.allCases.first(where: { $0.generates == self })!
    }

    var overcomes: WuXing {
        switch self {
        case .gold: return .wood
        case .wood: return .earth
        case .earth: return .water
        case .water: return .fire
        case .fire: return .gold
        }
    }

    var overcomedBy: WuXing {
        return WuXing.allCases.first(where: { $0.overcomes == self })!
    }

    func relationShip(to wuXing: WuXing) -> Relationship {
        if generates == wuXing {
            return .generates
        } else if generatedBy == wuXing {
            return .generatedBy
        } else if wuXing == self {
            return .same
        } else if overcomes == wuXing {
            return .overcomes
        } else if overcomedBy == wuXing {
            return .overcomedBy
        }

        fatalError("\(self) and \(wuXing) don't have a defined relationship.")
    }
}
