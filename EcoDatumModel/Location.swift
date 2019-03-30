//
//  Location.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 3/9/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import CoreLocation

public struct Location: Codable, CustomStringConvertible, Equatable, Validatable {
    
    public static let KIND = "EcoDatum#Location"
    
    public let kind: String
    public let coordinate: Coordinate
    public let altitude: Altitude?
    
    public init(coordinate: Coordinate, altitude: Altitude? = nil) {
        self.kind = Location.KIND
        self.coordinate = coordinate
        self.altitude = altitude
    }
    
    public var description: String {
        return "Location coordinate: \(coordinate)"
    }

    public var isValid: Bool {
        if let altitude = altitude, !altitude.isValid {
            return false
        }
        return kind == Location.KIND && coordinate.isValid
    }
    
    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.coordinate == rhs.coordinate && lhs.altitude == rhs.altitude
    }
    
}
