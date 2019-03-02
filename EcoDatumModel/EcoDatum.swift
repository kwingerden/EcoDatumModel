//
//  EcoData.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import EcoDatumCommon

public struct EcoDatum: Codable, CustomStringConvertible, Equatable {
    
    public let id: UUID
    public let createdDate: Date
    public let updatedDate: Date
    public let collectionDate: Date
    public let primaryType: PrimaryType
    public let secondaryType: SecondaryType
    public let dataType: DataType
    public let dataUnit: DataUnit?
    public let dataValue: Base64Encoded
    public let ecoData: [EcoDatum]?
    
    public var description: String {
        return "EcoDatum id: \(id), primaryType: \(primaryType)"
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
    
    public static func == (lhs: EcoDatum, rhs: EcoDatum) -> Bool {
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
