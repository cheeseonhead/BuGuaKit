//
//  TianGan.swift
//  BuGuaKit
//
//  Created by Cheese Onhead on 2018-09-11.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public enum TianGan: CaseIterable {
    case jia, yi, bing, ding, wu, ji, geng, xin, ren, gui
    
    public var character: String {
        return NSLocalizedString("tiangan\(self)", tableName: nil, bundle: Bundle(identifier: "com.cheeseonhead.BuGuaKit")!, value: "", comment: "")
    }

    func tianGan(after count: Int) -> TianGan {
        let selfIndex = index()
        let addedModded = (selfIndex + count) % TianGan.allCases.count

        return TianGan.allCases[addedModded]
    }
}

private extension TianGan {
    func index() -> Int {
        return TianGan.allCases.firstIndex(of: self)!
    }
}
