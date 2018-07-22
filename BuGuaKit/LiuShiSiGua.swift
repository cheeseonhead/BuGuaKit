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
        switch guaGongType {
        case 1: return 6
        case 2: return 1
        case 3: return 2
        case 4: return 3
        case 5: return 4
        case 6: return 5
        case 7: return 4
        case 8: return 3
        default:
            fatalError()
        }
    }
    var guaGong: FuXiBaGua {
        switch guaGongType {
        case 1...4: return outerGua
        case 5...7: return innerGua.opposite
        case 8: return innerGua
        default:
            fatalError()
        }
    }
}

private extension LiuShiSiGua {
    
    var guaGongType: Int {
        let positions = differentPositions(aGua: innerGua, bGua: outerGua)
        
        if positions.count == 0 {
            return 1
        } else if positions.count == 3 {
            return 4
        } else if positions.count == 2 {
            let samePosition = FuXiBaGua.Position.allCases.filter { !positions.contains($0) }.first!
            
            switch samePosition {
            case .top:
                return 3
            case .middle:
                return 7
            case .bottom:
                return 5
            }
        } else if positions.count == 1 {
            let position = positions.first!
            
            switch position {
            case .bottom:
                return 2
            case .middle:
                return 8
            case .top:
                return 6
            }
        }
        
        assertionFailure("Shouldn't get here")
        return 0
    }
    
    func differentPositions(aGua: FuXiBaGua, bGua: FuXiBaGua) -> [FuXiBaGua.Position] {
        return FuXiBaGua.Position.allCases.filter { aGua.liangYi(forPosition: $0) != bGua.liangYi(forPosition: $0) }
    }
}

