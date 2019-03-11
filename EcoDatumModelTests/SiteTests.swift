//
//  SiteTests.swift
//  EcoDatumModelTests
//
//  Created by Kenneth Wingerden on 2/22/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import XCTest
import EcoDatumCommon
@testable import EcoDatumModel

class SiteTests: XCTestCase {
    
    var appleHQCoordinate: Coordinate!
    var appleHQAltitude: Altitude!
    var appleHQLocation: Location!
    var appleHQSite: Site!
    
    var googleplexCoordinate: Coordinate!
    var googleplexAltitude: Altitude!
    var googleplexLocation: Location!
    var googleplexSite: Site!
    
    override func setUp() {
        appleHQCoordinate = Coordinate(latitude: 37.33182, longitude: -122.03118, accuracy: 0)
        appleHQAltitude = Altitude(altitude: 100, accuracy: 0)
        appleHQLocation = Location(coordinate: appleHQCoordinate, altitude: appleHQAltitude)
        appleHQSite = Site(
            id: UUID(),
            name: "Apple Headquarters",
            createdDate: Date(),
            updatedDate: Date(),
            location: appleHQLocation)
        
        googleplexCoordinate = Coordinate(latitude: 37.422, longitude: -122.084, accuracy: 0)
        googleplexAltitude = Altitude(altitude: 100, accuracy: 0)
        googleplexLocation = Location(coordinate: googleplexCoordinate, altitude: googleplexAltitude)
        googleplexSite = Site(
            id: UUID(),
            name: "Googleplex",
            createdDate: Date(),
            updatedDate: Date(),
            location: googleplexLocation)
    }
    
    override func tearDown() {
    
    }
    
    func test1() throws {
        XCTAssert(appleHQSite.location?.isValid ?? false)
        XCTAssert(googleplexSite.location?.isValid ?? false)
    }
    
}
