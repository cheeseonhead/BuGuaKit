//
//  LiuYaoGuaXiang.swift
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

public struct LiuYaoGuaXiang {

    let innerYao: [YaoType]
    let outerYao: [YaoType]

    init(liuYao: [YaoType]) {
        assert(liuYao.count == 6, "Cannot create GuaXiang without exactly 6 yao")

        innerYao = Array(liuYao.prefix(3))
        outerYao = Array(liuYao.suffix(3))
    }

    lazy var originalGua: LiuShiSiGua = {
        let innerGua = originalBaGua(from: innerYao)
        let outerGua = originalBaGua(from: outerYao)

        return LiuShiSiGua(innerGua: innerGua, outerGua: outerGua)
    }()

    lazy var changedGua: LiuShiSiGua = {
        let innerGua = changedBaGua(from: innerYao)
        let outerGua = changedBaGua(from: outerYao)

        return LiuShiSiGua(innerGua: innerGua, outerGua: outerGua)
    }()
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
