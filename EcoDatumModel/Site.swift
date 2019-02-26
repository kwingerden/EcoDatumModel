//
//  Site.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/22/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

public struct Site: Codable, CustomStringConvertible, Equatable {
    
    let id: UUID
    let name: String
    let createdDate: Date
    let updatedDate: Date
    let altitude: Decimal?
    let altitudeAccuracy: Decimal?
    let coordinateAccuracy: Decimal?
    let latitude: Decimal?
    let longitude: Decimal?
    let ecoData: [EcoDatum]?
    
    public var description: String {
        return "Site id: \(id), name: \(name)"
    }
    
    public static func == (lhs: Site, rhs: Site) -> Bool {
        return lhs.id == rhs.id
    }
}


