//
//  Site.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/22/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import CoreLocation

public struct Site: Codable, CustomStringConvertible, Equatable, Validatable {
    
    public static let KIND = "EcoDatum#Site"
    
    public let kind: String
    public let id: UUID
    public let name: String
    public let createdDate: Date
    public let updatedDate: Date
    public let location: Location?
    public let ecoData: [EcoDatum]?
    
    public init(id: UUID,
                name: String,
                createdDate: Date,
                updatedDate: Date,
                location: Location? = nil,
                ecoData: [EcoDatum]? = nil) {
        self.kind = Site.KIND
        self.id = id
        self.name = name
        self.createdDate = createdDate
        self.updatedDate = updatedDate
        self.location = location
        self.ecoData = ecoData
    }
    
    public init(id: UUID,
                name: String,
                createdDate: Date,
                updatedDate: Date,
                coordinate: Coordinate,
                altitude: Altitude? = nil,
                ecoData: [EcoDatum]? = nil) {
        self.kind = Site.KIND
        self.id = id
        self.name = name
        self.createdDate = createdDate
        self.updatedDate = updatedDate
        self.location = Location(coordinate: coordinate, altitude: altitude)
        self.ecoData = ecoData
    }
    
    public init(id: UUID,
                name: String,
                createdDate: Date,
                updatedDate: Date,
                location: CLLocation,
                ecoData: [EcoDatum]? = nil) {
        self.kind = Site.KIND
        self.id = id
        self.name = name
        self.createdDate = createdDate
        self.updatedDate = updatedDate
        let coordinate = Coordinate(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude,
            accuracy: location.horizontalAccuracy)
        let altitude = Altitude(
            altitude: location.altitude,
            accuracy: location.verticalAccuracy)
        self.location = Location(coordinate: coordinate, altitude: altitude)
        self.ecoData = ecoData
    }
    
    public var isValid: Bool {
        if let location = location, !location.isValid {
            return false
        }
        return kind == Site.KIND
    }
    
    public var description: String {
        return "Site id: \(String(describing: id)), name: \(name)"
    }
    
    public static func == (lhs: Site, rhs: Site) -> Bool {
        return lhs.id == rhs.id
    }
}


