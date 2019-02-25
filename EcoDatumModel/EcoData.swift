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
    let dataValue: Base64Encoded
    let ecoData: [EcoData]?
    
    public var description: String {
        return "EcoFactor id: \(id), primaryType: \(primaryType)"
    }
    
    public func isValid() -> Bool {
        guard let secondaryTypeDict = TYPE_MAP[primaryType],
            let dataTypeDict = secondaryTypeDict[secondaryType],
            let dataUnitArray = dataTypeDict[dataType] else {
                return false
        }
    
        if secondaryType == .Photo {
            return isValidPhoto()
        } else if secondaryType == .Note {
            return isValidNote()
        } else {
            return isValidData(dataUnitArray)
        }
    }
    
    public static func == (lhs: EcoData, rhs: EcoData) -> Bool {
        return lhs.id == rhs.id
    }
    
    private func isValidPhoto() -> Bool {
        // TODO: check to see if can be converted to UIImage
        return true
    }
    
    private func isValidNote() -> Bool {
        // TODO: check to see if can be converted to NSAttributedString
        return true
    }
    
    private func isValidData(_ dataUnitArray: [DataUnit]) -> Bool {
        guard let dataUnit = dataUnit,
            let dataValueString = dataValue.base64Decode() else {
            return false
        }
        
        if !dataUnitArray.contains(dataUnit) {
            return false
        }
        
        switch dataUnit {
        case .AirOzoneScale:
            guard let _ = AirOzoneScale.init(rawValue: dataValueString) else {
                return false
            }
            
        case .SoilPotassiumScale:
            guard let _ = SoilPotassiumScale.init(rawValue: dataValueString) else {
                return false
            }
            
        case .SoilTextureScale:
            guard let _ = try? fromJSON(SoilTextureScale.self, dataValueString) else {
                return false
            }
            
        case .WaterOdorScale:
            guard let _ = WaterOdorScale.init(rawValue: dataValueString) else {
                return false
            }
            
        case .WaterTurbidityScale:
            guard let _ = WaterTurbidityScale.init(rawValue: dataValueString) else {
                return false
            }
            
        default: // Decimal Value
            guard let _ = Decimal(string: dataValueString) else {
                return false
            }
        }
        
        return true
    }
}
