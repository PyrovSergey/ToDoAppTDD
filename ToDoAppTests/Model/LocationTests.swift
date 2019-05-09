//
//  LocationTests.swift
//  ToDoAppTests
//
//  Created by Sergey on 02/05/2019.
//  Copyright © 2019 PyrovSergey. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ToDoApp

class LocationTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testInitSetsCoordinates() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "Foo", coordinate: coordinate)
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }

    func testInitLocation() {
        let location = Location(name: "Foo")
        XCTAssertNotNil(location)
    }
    
    func testWhenGivenLocationNameSetsLocationName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }

}
