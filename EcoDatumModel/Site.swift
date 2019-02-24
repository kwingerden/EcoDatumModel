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
    // Any EcoData in this array that have the same ID are considered to be a composite EcoData of possibly two or more values.
    // For example, a photo can have an associated note. In that case, the photo and note EcoData will have the same ID.
    let ecoData: [EcoData]?

    public var description: String {
        return "Site id: \(id), name: \(name)"
    }
    
    public static func == (lhs: Site, rhs: Site) -> Bool {
        return lhs.id == rhs.id
    }
}


