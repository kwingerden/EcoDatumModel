//
//  EcoData.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import EcoDatumCommon

public struct EcoData: Codable, CustomStringConvertible, Equatable {
        
    let id: UUID
    let createdDate: Date
    let updatedDate: Date
    let collectionDate: Date
    let primaryType: PrimaryType
    let secondaryType: SecondaryType
    let dataType: DataType
    let dataUnit: DataUnit?
    let dataValue: Data
    let ecoData: [EcoData]?
    
    public var description: String {
        return "EcoFactor id: \(id), primaryType: \(primaryType)"
    }
    
    public static func == (lhs: EcoData, rhs: EcoData) -> Bool {
        return lhs.id == rhs.id
    }
}
