//
//  BuGuaEntry.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-24.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public class BuGuaEntryBuilder {
    var name = ""
    var question = ""
    var date: GregorianDate!
    var time: GregorianTime!
    var notes = ""
    var guaXiang: LiuYaoGuaXiang!

    public func setName(_ value: String) -> BuGuaEntryBuilder {
        name = value
        return self
    }

    public func setQuestion(_ value: String) -> BuGuaEntryBuilder {
        question = value
        return self
    }

    public func setDate(_ value: GregorianDate) -> BuGuaEntryBuilder {
        date = value
        return self
    }

    public func setTime(_ value: GregorianTime) -> BuGuaEntryBuilder {
        time = value
        return self
    }

    public func setNotes(_ value: String) -> BuGuaEntryBuilder {
        notes = value
        return self
    }
    
    public func setGuaXiang(_ value: LiuYaoGuaXiang) -> BuGuaEntryBuilder {
        guaXiang = value
        return self
    }
    
    public func build() -> BuGuaEntry {
        return BuGuaEntry(name: name, question: question, date: date, time: time, notes: notes, guaXiang: guaXiang)
    }
}

public struct BuGuaEntry {
    let name: String
    let question: String
    let date: GregorianDate
    let time: GregorianTime
    let notes: String
    let guaXiang: LiuYaoGuaXiang
}
