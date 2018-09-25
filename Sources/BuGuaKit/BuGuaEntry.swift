//
//  BuGuaEntry.swift
//  BuGuaKit
//
//  Created by Jeffrey Wu on 2018-09-24.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import Foundation

public class BuGuaEntryBuilder {
    var name: String!
    var question: String!
    var date: GregorianDate!
    var time: GregorianTime!
    var notes: String!

    func name(_ value: String) {

    }

    func question(_ value: String) {

    }

    func date(_ value: GregorianDate) {

    }

    func time(_ value: GregorianTime) {

    }

    func notes(_ value: String) {

    }
}

public struct BuGuaEntry {
    let name: String
    let question: String
    let date: GregorianDate
    let time: GregorianTime
    let notes: String
}
