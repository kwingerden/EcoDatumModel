//
//  Site.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/22/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import CoreLocation

public struct Site: Codable, CustomStringConvertible, Equatable {
    
    public let id: UUID
    public let name: String
    public let createdDate: Date
    public let updatedDate: Date
    public let altitude: Double?
    public let altitudeAccuracy: Double?
    public let coordinateAccuracy: Double?
    public let latitude: Double?
    public let longitude: Double?
    public let ecoData: [EcoDatum]?
    
    public init(id: UUID,
                name: String,
                createdDate: Date,
                updatedDate: Date,
                altitude: Double? = nil,
                altitudeAccuracy: Double? = nil,
                coordinateAccuracy: Double? = nil,
                latitude: Double? = nil,
                longitude: Double? = nil,
                ecoData: [EcoDatum]? = nil) {
        self.id = id
        self.name = name
        self.createdDate = createdDate
        self.updatedDate = updatedDate
        self.altitude = altitude
        self.altitudeAccuracy = altitudeAccuracy
        self.coordinateAccuracy = coordinateAccuracy
        self.latitude = latitude
        self.longitude = longitude
        self.ecoData = ecoData
    }
    
    public init(id: UUID,
                name: String,
                createdDate: Date,
                updatedDate: Date,
                location: CLLocation,
                ecoData: [EcoDatum]? = nil) {
        self.id = id
        self.name = name
        self.createdDate = createdDate
        self.updatedDate = updatedDate
        self.altitude = location.altitude
        self.altitudeAccuracy = location.verticalAccuracy
        self.coordinateAccuracy = location.horizontalAccuracy
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        self.ecoData = ecoData
    }
    
    public var description: String {
        return "Site id: \(id), name: \(name)"
    }
    
    public var location: CLLocation? {
        guard let latitude = latitude, let longitude = longitude else {
            return nil
        }
        return CLLocation(
            coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            altitude: altitude ?? 0,
            horizontalAccuracy: coordinateAccuracy ?? 0,
            verticalAccuracy: altitudeAccuracy ?? -1,
            timestamp: Date())
    }

    public static func == (lhs: Site, rhs: Site) -> Bool {
        return lhs.id == rhs.id
    }
}


