//
//  EcoData.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

struct EcoData: Codable, CustomStringConvertible, Equatable {
    
    let id: UUID
    let createdDate: Date
    let updatedDate: Date
    let collectionDate: Date
    let ecoFactor: EcoFactor
    let notes: [Note]
    let photos: [Photo]
    
    var description: String {
        return "EcoData id: \(id), collection date: \(collectionDate)"
    }
    
    static func == (lhs: EcoData, rhs: EcoData) -> Bool {
        return lhs.id == rhs.id
    }
}
