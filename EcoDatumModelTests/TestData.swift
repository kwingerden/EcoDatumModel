//
//  TestHelper.swift
//  EcoDatumModelTests
//
//  Created by Kenneth Wingerden on 3/16/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import EcoDatumCommon
@testable import EcoDatumModel


let appleHQCoordinate: Coordinate = Coordinate(latitude: 37.33182, longitude: -122.03118, accuracy: 0)
let appleHQAltitude: Altitude = Altitude(altitude: 100, accuracy: 0)
let appleHQLocation: Location = Location(coordinate: appleHQCoordinate, altitude: appleHQAltitude)
let appleHQSite: Site = Site(
    id: UUID(),
    name: "Apple Headquarters",
    createdDate: Date(),
    updatedDate: Date(),
    location: appleHQLocation)

let googleplexCoordinate: Coordinate = Coordinate(latitude: 37.422, longitude: -122.084, accuracy: 0)
let googleplexAltitude: Altitude = Altitude(altitude: 100, accuracy: 0)
let googleplexLocation: Location = Location(coordinate: googleplexCoordinate, altitude: googleplexAltitude)
let googleplexSite: Site = Site(
    id: UUID(),
    name: "Googleplex",
    createdDate: Date(),
    updatedDate: Date(),
    location: googleplexLocation)

let defaultNotebook = Notebook(
    id: UUID(),
    name: Notebook.DEFAULT_NAME,
    createdDate: Date(), updatedDate: Date(), sites: [appleHQSite, googleplexSite])
