//
//  LiuShouController.swift
//  BuGuaKit
//
//  Created by Cheese Onhead on 2018-10-02.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

class LiuShouController {
    private let guaXiang: LiuYaoGuaXiang
    
    init(guaXiang: LiuYaoGuaXiang) {
        self.guaXiang = guaXiang
    }
    
    public var liuShou: [LiuShou] {
        return liuShou(for: guaXiang.dateGanZhi.day.diZhi)
    }
}

private extension LiuShouController {
    func liuShou(for dayZhi: DiZhi) -> [LiuShou] {
        let fullRounds = LiuShou.allCases + LiuShou.allCases
        
        let start = startingIndex(for: dayZhi)
        let finalRange = start...(start+6)
        
        return Array(fullRounds[finalRange])
    }
    
    func startingIndex(for dayZhi: DiZhi) -> Int {
        switch dayZhi {
        case .zi, .chou: return 0
        case .yin, .mao: return 1
        case .chen, .si: return 2
        case .wu, .wei: return 3
        case .shen, .you: return 4
        case .xu, .hai: return 5
        }
    }
}
