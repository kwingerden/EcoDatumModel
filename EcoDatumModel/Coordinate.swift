//
//  Coordinate.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 3/3/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import CoreLocation

public struct Coordinate: Codable, CustomStringConvertible, Equatable {
    
    public let latitude: CLLocationDegrees
    public let longitude: CLLocationDegrees
    public let accuracy: CLLocationDistance
    
    public init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, accuracy: CLLocationDistance = 0) {
        self.latitude = latitude
        self.longitude = longitude
        self.accuracy = accuracy
    }
    
    public init(location: CLLocation) {
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        self.accuracy = location.horizontalAccuracy
    }
    
    public var description: String {
        return "Coordinate latitude: \(latitude), longitude: \(longitude), accuracy: \(accuracy))"
    }
    
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    public var isValid: Bool {
        return CLLocationCoordinate2DIsValid(coordinate) && accuracy >= 0
    }
    
    public static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude && lhs.accuracy == rhs.accuracy
    }
    
}
