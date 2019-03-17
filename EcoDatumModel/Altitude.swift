//
//  Altitude.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 3/9/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import CoreLocation

public struct Altitude: Codable, CustomStringConvertible, Equatable, Validatable {
    
    public static let KIND = "EcoDatum#Altitude"
    
    public let kind: String
    public let altitude: CLLocationDistance
    public let accuracy: CLLocationAccuracy
    
    public init(altitude: CLLocationDistance, accuracy: CLLocationAccuracy = 0) {
        self.kind = Altitude.KIND
        self.altitude = altitude
        self.accuracy = accuracy
    }
    
    public var description: String {
        return "Altitude altitude: \(altitude), accuracy: \(accuracy)"
    }
    
    public var isValid: Bool {
        return kind == Altitude.KIND && accuracy >= 0
    }
    
    public static func == (lhs: Altitude, rhs: Altitude) -> Bool {
        return lhs.altitude == rhs.altitude && lhs.accuracy == rhs.accuracy
    }
    
}
