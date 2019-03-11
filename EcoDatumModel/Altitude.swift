//
//  Altitude.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 3/9/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import CoreLocation

public struct Altitude: Codable, CustomStringConvertible, Equatable {
    
    public let altitude: CLLocationDistance
    public let accuracy: CLLocationAccuracy
    
    public var description: String {
        return "Altitude altitude: \(altitude), accuracy: \(accuracy)"
    }
    
    public var isValid: Bool {
        return accuracy >= 0
    }
    
    public static func == (lhs: Altitude, rhs: Altitude) -> Bool {
        return lhs.altitude == rhs.altitude && lhs.accuracy == rhs.accuracy
    }
    
}
