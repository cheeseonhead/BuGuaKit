//
//  SolarTermDateComponentTests.swift
//  BuGuaKitTests
//
//  Created by Jeffrey Wu on 2018-09-16.
//  Copyright © 2018 cheeseonhead. All rights reserved.
//

import XCTest
@testable import BuGuaKit

class SolarTermDateComponentTests: XCTestCase {

    var sut: SolarTermDateComponent!

    override func setUp() {
        let fakeDataLoader = MockDataLoader()
        sut = SolarTermDateComponent(dataLoader: fakeDataLoader)
    }

    func testExample() {
//        try! sut.dateComponent(for: .chunFen, year: 2084)
    }
}

private class MockDataLoader: SolarTermDataLoader {

    let data: [[Int]]

    override init() {
        data = (1...2400).map { _ in
            [1, 2, 3, 4, 5]
        }
    }

    override func loadData() throws -> [[Int]] {
        return data
    }
}
