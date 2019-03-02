//
//  Site.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/22/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

public struct Site: Codable, CustomStringConvertible, Equatable {
    
    public let id: UUID
    public let name: String
    public let createdDate: Date
    public let updatedDate: Date
    public let altitude: Decimal?
    public let altitudeAccuracy: Decimal?
    public let coordinateAccuracy: Decimal?
    public let latitude: Decimal?
    public let longitude: Decimal?
    public let ecoData: [EcoDatum]?
    
    public var description: String {
        return "Site id: \(id), name: \(name)"
    }
    
    public static func == (lhs: Site, rhs: Site) -> Bool {
        return lhs.id == rhs.id
    }
}


