//
//  FuXiBaGuaTests.swift
//  BuGuaKitTests
//
//  Created by Cheese Onhead on 2018-07-22.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import XCTest
@testable import BuGuaKit

class FuXiBaGuaTests: XCTestCase {

    var sut: FuXiBaGua!

    func testCharacter() {
        sut = .li
        
        XCTAssertEqual("離", sut.character)
    }
}
