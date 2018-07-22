//
//  LiuShiSiGua.swift
//  BuGuaKit
//
//  Created by Cheese Onhead on 2018-07-22.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

struct LiuShiSiGua {
    let innerGua: FuXiBaGua
    let outerGua: FuXiBaGua
    
    var ying: Int {
        return (shi + 2) % 6 + 1
    }
    var shi: Int {
        let positions = differentPositions(aGua: innerGua, bGua: outerGua)
        
        if positions.count == 0 {
            return 6
        } else if positions.count == 3 {
            return 3
        } else if positions.count == 2 {
            let samePosition = FuXiBaGua.Position.allCases.filter { !positions.contains($0) }.first!
            
            switch samePosition {
            case .top:
                return 2
            case .middle, .bottom:
                return 4
            }
        } else if positions.count == 1 {
            let position = positions.first!
            
            switch position {
            case .bottom:
                return 1
            case .middle:
                return 3
            case .top:
                return 5
            }
        }
        
        return 0
    }
    
    func differentPositions(aGua: FuXiBaGua, bGua: FuXiBaGua) -> [FuXiBaGua.Position] {
        return FuXiBaGua.Position.allCases.filter { aGua.liangYi(forPosition: $0) != bGua.liangYi(forPosition: $0) }
    }
}

