//
//  GuaShenController.swift
//  BuGuaKit
//
//  Created by Cheese Onhead on 2018-10-02.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public class GuaShenController {
    private let guaXiang: LiuYaoGuaXiang
    
    init(guaXiang: LiuYaoGuaXiang) {
        self.guaXiang = guaXiang
    }
    
    public var guaShen: DiZhi {
        let shi = guaXiang.originalGua.shi
        
        return startZhi(for: guaXiang.yao(at: shi).originalYi).diZhi(after: shi - 1)
    }
}

private extension GuaShenController {
    func startZhi(for liangYi: LiangYi) -> DiZhi {
        switch liangYi {
        case .yang: return .zi
        case .yin: return .wu
        }
    }
}
