//
//  LiuShiSiGua.swift
//  BuGuaKit
//
//  Created by Cheese Onhead on 2018-07-22.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public struct LiuShiSiGua {

    enum Position {
        case inner, outer
    }

    public let innerGua: FuXiBaGua
    public let outerGua: FuXiBaGua

    init(innerGua: FuXiBaGua, outerGua: FuXiBaGua) {
        self.innerGua = innerGua
        self.outerGua = outerGua
    }

    public lazy var ying: Int = (shi + 2) % 6 + 1
    
    public lazy var shi: Int = {
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
    }()

    public lazy var guaGong: FuXiBaGua = {
        switch guaGongType {
        case 1...4: return outerGua
        case 5...7: return innerGua.opposite
        case 8: return innerGua
        default:
            fatalError()
        }
    }()

    public lazy var yaoZhi: [DiZhi] = {
        let innerZhi = innerGua.diZhi(forPosition: .inner)
        let outerZhi = outerGua.diZhi(forPosition: .outer)

        return innerZhi + outerZhi
    }()

    public lazy var myXing: WuXing = guaGong.wuXing

    public lazy var liuQin: [LiuQin] = yaoZhi.map { (diZhi) -> LiuQin in
        LiuQin(from: myXing.relationShip(to: diZhi.wuXing))
    }
}

private extension LiuShiSiGua {

    /// 回傳值是1-8，是按照一本書看來的，並沒有特別的意義
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
        return FuXiBaGua.Position.allCases.filter { aGua.yao(at: $0) != bGua.yao(at: $0) }
    }
}

