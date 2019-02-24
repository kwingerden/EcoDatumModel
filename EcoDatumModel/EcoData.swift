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
    
    enum PrimaryType: String, Codable {
        case Abiotic
        case Biotic
    }
    
    enum SecondaryType: String, Codable {
        case Air
        case Note
        case OrganicCarbon
        case Photo
        case Soil
        case Water
    }
    
    enum DataType: String, Codable {
        case Carbon
        case CarbonDioxide = "Carbon Dioxide"
        case Conductivity
        case DissolvedOxygen = "Dissolved Oxygen"
        case FlowRate = "Flow Rate"
        case HTML
        case JPEG
        case Light
        case Moisture
        case Nitrate
        case Nitrogen
        case Odor
        case Ozone
        case PAR
        case pH
        case Phosphate
        case Phosphorus
        case PNG
        case Potassium
        case RelativeHumidity = "Relative Humidity"
        case RTF
        case Temperature
        case Text
        case Texture
        case Turbidity
        case UVB
        case Velocity
    }
    
    enum DataUnit: String, Codable {
        // Latex Editor: http://www.hostmath.com
        
        case DegreesCelsius = "^{\\circ}C"
        case DegreesFahrenheit = "^{\\circ}F"
        case FeetPerSecond = "\\frac{ft}{s}"
        case JacksonTurbidityUnits = "JTU \\ (Jackson \\ Turbidity \\ Units)"
        case KilogramsOfCarbon = "kg \\ C"
        case Lux = "Lux"
        case MicromolesPerMetersSquaredAndSeconds = "\\mu mol \\ m^{-2}s^{-1}"
        case MegawattsPerMeterSquared = "\\frac{mW}{m^{2}}"
        case MetersPerSecond = "\\frac{m}{s}"
        case MicrosiemensPerCentimeter = "\\frac{\\mu S}{cm}"
        case MilesPerHour = "mph"
        case MilligramsPerLiter = "\\frac{mg}{L}"
        case NephelometricTurbidityUnits = "NTU \\ (Nephelometric \\ Turbidity \\ Units)"
        case PartsPerMillion = "ppm \\ (Parts \\ Per \\ Million)"
        case Percent = "\\%"
        case PhotosyntheticPhotonFluxDensity = "PPFD \\ (Photosynthetic \\ Photon \\ Flux \\ Density)"
        case PoundsPerAcre = "\\frac{lb}{a}"
        
        case _Air_Ozone_Scale_ = "Air \\ Ozone \\ Scale \\ (\\frac{\\mu g}{m^{3}O_{3}})"
        case _Soil_Potassium_Scale_ = "Soil \\ Potassium \\ Scale"
        case _Soil_Texture_Scale_ = "Soil \\ Texture \\ Scale"
        case _Water_Odor_Scale_ = "Water \\ Odor \\ Scale"
        case _Water_pH_Scale_ = "Water \\ pH \\ Scale"
        case _Water_Turbidity_Scale_ = "Water \\ Turbidity \\ Scale"        
    }
    
    static let MAP: [PrimaryType: [SecondaryType: [DataType: [DataUnit]]]] = [
        .Abiotic: [
            .Air: [
                .CarbonDioxide: [
                    .PartsPerMillion
                ],
                .Light: [
                    .Lux
                ],
                .Ozone: [
                    ._Air_Ozone_Scale_
                ],
                .PAR: [
                    .PhotosyntheticPhotonFluxDensity,
                    .MicromolesPerMetersSquaredAndSeconds
                ],
                .RelativeHumidity: [
                    .Percent
                ],
                .Temperature: [
                    .DegreesCelsius,
                    .DegreesFahrenheit
                ],
                .UVB: [
                    .MegawattsPerMeterSquared,
                    .Percent
                ],
                .Velocity: [
                    .MetersPerSecond,
                    .MilesPerHour
                ]
            ],
            .Soil: [
                .Nitrogen: [
                    .PoundsPerAcre
                ],
                .Phosphorus: [
                    .PoundsPerAcre
                ],
                .Potassium: [
                    ._Soil_Potassium_Scale_
                ],
                .Moisture: [
                    .Percent
                ],
                .Texture: [
                    ._Soil_Texture_Scale_
                ],
                .Temperature: [
                    .DegreesCelsius,
                    .DegreesFahrenheit
                ]
            ],
            .Water: [
                .Conductivity: [
                    .MicrosiemensPerCentimeter
                ],
                .DissolvedOxygen: [
                    .PartsPerMillion,
                    .MilligramsPerLiter,
                    .Percent
                ],
                .FlowRate: [
                    .MetersPerSecond,
                    .FeetPerSecond
                ],
                .Nitrate: [
                    .PartsPerMillion,
                    .MilligramsPerLiter
                ],
                .Odor: [
                    ._Water_Odor_Scale_
                ],
                .pH: [
                    ._Water_pH_Scale_
                ],
                .Phosphate: [
                    .PartsPerMillion,
                    .MilligramsPerLiter
                ],
                .Temperature: [
                    .DegreesCelsius,
                    .DegreesFahrenheit
                ],
                .Turbidity: [
                    .NephelometricTurbidityUnits,
                    .JacksonTurbidityUnits,
                    ._Water_Turbidity_Scale_
                ]
            ]
        ],
        .Biotic: [
            .OrganicCarbon: [
                .Carbon: [
                    .KilogramsOfCarbon
                ]
            ],
            .Note: [
                .HTML: [
                ],
                .RTF: [
                ],
                .Text: [
                ]
            ],
            .Photo: [
                .JPEG: [
                ],
                .PNG: [
                ]
            ]
        ]
    ]
    
    let id: UUID
    let createdDate: Date
    let updatedDate: Date
    let collectionDate: Date
    let primaryType: PrimaryType
    let secondaryType: SecondaryType
    let dataType: DataType
    let dataUnit: DataUnit?
    let dataValue: Data
    let associations: [UUID]?
    
    public var description: String {
        return "EcoFactor id: \(id), primaryType: \(primaryType)"
    }
    
    public static func == (lhs: EcoData, rhs: EcoData) -> Bool {
        return lhs.id == rhs.id
    }
}
