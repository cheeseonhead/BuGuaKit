//
//  FuXiBaGua.swift
//  BuGuaKit
//
//  Created by Cheese Onhead on 2018-07-22.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

enum LiangYi {
    case yang, yin
}

public enum FuXiBaGua: Int {
    
    enum Position: CaseIterable {
        case top, middle, bottom
    }
    
    case qian = 1
    case dui
    case li
    case zhen
    case xun
    case kan
    case gen
    case kun
    
    public var character: String {
        return NSLocalizedString("fuxibagua\(self)", tableName: nil, bundle: Bundle(identifier: "com.cheeseonhead.BuGuaKit")!, value: "", comment: "")
    }
    
    func liangYi(forPosition position: Position) -> LiangYi {
        let denominator: Double
        
        switch position {
        case .top:
            denominator = 1
        case .middle:
            denominator = 2
        case .bottom:
            denominator = 4
        }
        
        let value: Int = Int((Double(self.rawValue) / denominator).rounded(.up))
        let liangYiValue = value % 2
        
        switch liangYiValue {
        case 0:
            return .yin
        default:
            return .yang
        }
    }
}
