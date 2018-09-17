//
//  SolarTerm.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-14.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public enum SolarTerm: CaseIterable {

    public struct DateComponents: Comparable {
        public let year: Int
        public let month: Int
        public let day: Int

        func makeComponent() -> Foundation.DateComponents {
            return Foundation.DateComponents(year: year, month: month, day: day)
        }

        public static func < (lhs: SolarTerm.DateComponents, rhs: SolarTerm.DateComponents) -> Bool {
            if lhs.year != rhs.year {
                return lhs.year < rhs.year
            } else if lhs.month != rhs.month {
                return lhs.month < rhs.month
            } else if lhs.day != rhs.day {
                return lhs.day < rhs.day
            }

            return false
        }

        func days(from otherComponents: DateComponents) -> Int {
            let selfCompo = makeComponent()
            let otherCompo = otherComponents.makeComponent()

            let days = Calendar.current.dateComponents([.day], from: otherCompo, to: selfCompo).day!

            return days
        }
    }

    struct Date {
        let components: DateComponents
        let type: SolarTerm
    }

    case liChun
    case yuShui
    case jingZhe
    case chunFen
    case qingMing
    case guYu
    case liXia
    case xiaoMan
    case mangZhong
    case xiaZhi
    case xiaoShu
    case daShu
    case liQiu
    case chuShu
    case baiLu
    case qiuFen
    case hanLu
    case shuangJiang
    case liDong
    case xiaoXue
    case daXue
    case dongZhi
    case xiaoHan
    case daHan

    var index: Int {
        switch self {
        case .xiaoHan: return 0
        case .daHan: return 1
        case .liChun: return 2
        case .yuShui: return 3
        case .jingZhe: return 4
        case .chunFen: return 5
        case .qingMing: return 6
        case .guYu: return 7
        case .liXia: return 8
        case .xiaoMan: return 9
        case .mangZhong: return 10
        case .xiaZhi: return 11
        case .xiaoShu: return 12
        case .daShu: return 13
        case .liQiu: return 14
        case .chuShu: return 15
        case .baiLu: return 16
        case .qiuFen: return 17
        case .hanLu: return 18
        case .shuangJiang: return 19
        case .liDong: return 20
        case .xiaoXue: return 21
        case .daXue: return 22
        case .dongZhi: return 23
        }
    }
}
