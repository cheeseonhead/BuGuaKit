//
//  LiuYaoGuaXiang.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-08-25.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public struct LiuYaoGuaXiang {

    let liuYao: [YaoType]
    let innerYao: [YaoType]
    let outerYao: [YaoType]

    public init(liuYao: [YaoType]) {
        assert(liuYao.count == 6, "Cannot create GuaXiang without exactly 6 yao")

        self.liuYao = liuYao
        innerYao = Array(liuYao.prefix(3))
        outerYao = Array(liuYao.suffix(3))
    }

    public var originalGua: LiuShiSiGua {
        let innerGua = originalBaGua(from: innerYao)
        let outerGua = originalBaGua(from: outerYao)

        return LiuShiSiGua(innerGua: innerGua, outerGua: outerGua)
    }

    public var changedGua: LiuShiSiGua {
        let innerGua = changedBaGua(from: innerYao)
        let outerGua = changedBaGua(from: outerYao)

        return LiuShiSiGua(innerGua: innerGua, outerGua: outerGua)
    }

    public var changedYaoZhi: [DiZhi?] {
        return zip(liuYao, changedGua.yaoZhi).map({ (yaoType, zhi) in
            if !yaoType.isStable {
                return zhi
            } else {
                return nil
            }
        })
    }

    public func yao(at position: Int) -> YaoType {
        assert(position >= 1 && position <= 6, "position out of range")

        return liuYao[position - 1]
    }
}

private extension LiuYaoGuaXiang {
    func originalBaGua(from yao: [YaoType]) -> FuXiBaGua {
        assert(yao.count == 3, "Can only create it from 3 liangYi")

        return FuXiBaGua(top: yao[2].originalYi, middle: yao[1].originalYi, bottom: yao[0].originalYi)
    }

    func changedBaGua(from yao: [YaoType]) -> FuXiBaGua {
        assert(yao.count == 3, "Can only create it from 3 liangYi")

        return FuXiBaGua(top: yao[2].changedYi, middle: yao[1].changedYi, bottom: yao[0].changedYi)
    }
}
