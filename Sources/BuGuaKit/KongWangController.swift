//
//  KongWangController.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-10-01.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public struct KongWang: Equatable {
    let year: Bool
    let month: Bool
    let day: Bool
    let time: Bool

    public class Builder {
        var year: Bool!
        var month: Bool!
        var day: Bool!
        var time: Bool!

        func build() -> KongWang {
            return KongWang(year: year, month: month, day: day, time: time)
        }
    }
}

public class KongWangController {

    private let guaXiang: LiuYaoGuaXiang
    private let jiaXunKongWang: [DiZhi: [DiZhi]] = [
        .zi: [.xu, .hai],
        .yin: [.zi, .chou],
        .chen: [.yin, .mao],
        .wu: [.chen, .si],
        .shen: [.wu, .wei],
        .xu: [.shen, .you]
    ]

    init(guaXiang: LiuYaoGuaXiang) {
        self.guaXiang = guaXiang
    }

    public var kongWang: KongWang {
        let builder = KongWang.Builder()

        let allDiZhis = allKongWangDiZhi(guaXiang)

        builder.year = allDiZhis.contains(guaXiang.dateGanZhi.year.diZhi)
        builder.month = allDiZhis.contains(guaXiang.dateGanZhi.month.diZhi)
        builder.day = allDiZhis.contains(guaXiang.dateGanZhi.day.diZhi)
        builder.time = allDiZhis.contains(guaXiang.timeDiZhi)

        return builder.build()
    }
}

private extension KongWangController {
    func jiaXunDiZhi(_ ganZhi: GanZhi) -> DiZhi {
        let negativeDistanceToJia = ganZhi.tianGan.distanceTo(.jia)
        let sameXunDiZhi = ganZhi.diZhi.diZhi(after: negativeDistanceToJia)

        return sameXunDiZhi
    }

    func allKongWangDiZhi(_ guaXiang: LiuYaoGuaXiang) -> [DiZhi] {
        var kongWangDiZhis = [DiZhi]()

        let yearGanZhi = guaXiang.dateGanZhi.year
        kongWangDiZhis.append(contentsOf: jiaXunKongWang[jiaXunDiZhi(yearGanZhi)]!)

        let dayGanZhi = guaXiang.dateGanZhi.day
        kongWangDiZhis.append(contentsOf: jiaXunKongWang[jiaXunDiZhi(dayGanZhi)]!)

        return kongWangDiZhis
    }
}
