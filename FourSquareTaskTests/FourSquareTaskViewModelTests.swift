//
//  FourSquareTaskViewModelTests.swift
//  FourSquareTaskTests
//
//  Created by Amr on 7/18/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import XCTest
import CoreLocation
@testable import FourSquareTask

class FourSquareTaskViewModelTests: XCTestCase {
    var viewModel: PlacesViewModel?
    var apiClient = APIClient.sharedInstance
    var locationManager = CLLocationManager()
    override func setUp() {
        super.setUp()
        viewModel = PlacesViewModel(apiClient: apiClient, locationManager: locationManager)
    }
    
    func testDistanceBetweenLocations() {
        let firstLocation = CLLocationCoordinate2D(latitude: 30.0444, longitude: 31.2357)
        let secondLocation = CLLocationCoordinate2D(latitude: 43.1009, longitude: 75.2327)
        if let distance = viewModel?.getDistanceBetweenCoordinates(current: firstLocation, lastRetrived: secondLocation) {
            XCTAssertGreaterThan(distance, 500)
        } else {
            XCTFail("Test Failed :: Couldn't retrive distance")
        }
    }
    
    func testVenueViewModelsMapping() {
        let venueDto = VenueDTOMock.venueDTO
        let mappedViewModels = viewModel?.mapToVenuesViewModels(venueDto)
        XCTAssertEqual(mappedViewModels?.count, 3)
    }
    
    func testFunctionPerformance() {
        self.measure {
        }
    }
}
