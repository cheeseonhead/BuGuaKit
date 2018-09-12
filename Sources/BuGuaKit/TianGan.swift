//
//  TianGan.swift
//  BuGuaKit
//
//  Created by Cheese Onhead on 2018-09-11.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public enum TianGan {
    case jia, yi, bing, ding, wu, ji, geng, xin, ren, gui
    
    public var character: String {
        return NSLocalizedString("tiangan\(self)", tableName: nil, bundle: Bundle(identifier: "com.cheeseonhead.BuGuaKit")!, value: "", comment: "")
    }
}
