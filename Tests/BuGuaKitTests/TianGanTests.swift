//
//  TianGanTests.swift
//  BuGuaKitTests
//
//  Created by Jeffrey Wu on 2018-09-15.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import XCTest
@testable import BuGuaKit

class TianGanTests: XCTestCase {

    func testAfterWithinBounds() {
        let sut = TianGan.bing

        XCTAssertEqual(sut.tianGan(after: 4), .geng)
    }
}
