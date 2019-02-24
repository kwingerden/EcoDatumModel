//
//  EcoFactor.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

struct EcoFactor: Codable, CustomStringConvertible, Equatable {
    
    let id: UUID
    let createdDate: Date
    let updatedDate: Date
    let type: String
    let unit: String
    let value: String
    
    var description: String {
        return "EcoFactor id: \(id), type: \(type)"
    }
    
    static func == (lhs: EcoFactor, rhs: EcoFactor) -> Bool {
        return lhs.id == rhs.id
    }
}
