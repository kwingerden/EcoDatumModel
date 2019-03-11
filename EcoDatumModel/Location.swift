//
//  Location.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 3/9/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import CoreLocation

public struct Location: Codable, CustomStringConvertible, Equatable {
    
    public let coordinate: Coordinate
    public let altitude: Altitude
    
    public var description: String {
        return "Location coordinate: \(coordinate), altitude: \(altitude)"
    }

    public var isValid: Bool {
        return coordinate.isValid && altitude.isValid
    }
    
    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.coordinate == rhs.coordinate && lhs.altitude == rhs.altitude
    }
    
}
