//
//  FuShenController.swift
//  BuGuaKit
//
//  Created by Cheese Onhead on 2018-09-12.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public class FuShenController {
    
    private let guaXiang: LiuYaoGuaXiang
    
    // MARK: - Private
    private lazy var pureLiuShiSiGua: LiuShiSiGua = LiuShiSiGua(innerGua: guaXiang.originalGua.guaGong, outerGua: guaXiang.originalGua.guaGong)
    
    public init(guaXiang: LiuYaoGuaXiang) {
        self.guaXiang = guaXiang
    }
    
    public func fuShen() -> [LiuQin?] {
        let originalLiuQin = guaXiang.originalGua.liuQin
        let pure = pureLiuQin()
        
        return pure.map { originalLiuQin.contains($0) ? nil : $0 }
    }
    
    public func hiddenTianGan() -> [TianGan?] {
        let pureTianGan = pureLiuShiSiGua.tianGan
        
        return zip(fuShen(), pureTianGan).map { shen, gan in
            return shen != nil ? gan : nil
        }
    }
    
    public func hiddenDiZhi() -> [DiZhi?] {
        let pureDiZhi = pureLiuShiSiGua.diZhi
        
        return zip(fuShen(), pureDiZhi).map { shen, zhi in
            return shen != nil ? zhi : nil
        }
    }
}

private extension FuShenController {
    
    func pureLiuQin() -> [LiuQin] {
        return pureLiuShiSiGua.liuQin
    }
}
