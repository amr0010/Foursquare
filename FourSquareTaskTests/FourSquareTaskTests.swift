//
//  FourSquareTaskTests.swift
//  FourSquareTaskTests
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import XCTest
@testable import FourSquareTask

class FourSquareTaskTests: XCTestCase {

    private let apiClient = APIClient.sharedInstance
    override func setUp() {
    }

    override func tearDown() {
    }

    func testVenueResponse() {
        let expectations = self.expectation(description: "Venue Response Retrieved")
        apiClient.getPlaces(latitude: 10, longitude: 10).subscribe(onSuccess: { (venues) in
            expectations.fulfill()
        }) { (err) in
            XCTFail(err.localizedDescription)
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    

    func testPerformanceExample() {
        self.measure {
        }
    }

}
