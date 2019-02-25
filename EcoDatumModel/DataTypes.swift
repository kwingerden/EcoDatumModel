//
//  DataTypes.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/24/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

public enum PrimaryType: String, Codable {
    case Abiotic
    case Biotic
}

public enum SecondaryType: String, Codable {
    case Air
    case Note
    case OrganicCarbon
    case Photo
    case Soil
    case Water
}

public enum DataType: String, Codable {
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

public enum DataUnit: String, Codable {
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
    
    case AirOzoneScale = "Air \\ Ozone \\ Scale \\ (\\frac{\\mu g}{m^{3}O_{3}})"
    case SoilPotassiumScale = "Soil \\ Potassium \\ Scale"
    case SoilTextureScale = "Soil \\ Texture \\ Scale"
    case WaterOdorScale = "Water \\ Odor \\ Scale"
    case WaterPHScale = "Water \\ pH \\ Scale"
    case WaterTurbidityScale = "Water \\ Turbidity \\ Scale"
}

public enum AirOzoneScale: String, Codable {
    case LessThan90
    case Between90And150
    case GreaterThan150To210
    case GreaterThan210
}

public enum SoilPotassiumScale: String, Codable {
    case Low
    case Medium
    case High
}

public struct SoilTextureScale: Codable {
    let percentSand: Int
    let percentSilt: Int
    let percentClay: Int
}

public enum WaterOdorScale: String, Codable {
    case NoOdor
    case SlightOdor
    case Smelly
    case VerySmelly
    case Devastating
}

public enum WaterTurbidityScale: String, Codable {
    case CrystalClear
    case SlightlyCloudy
    case ModeratelyCloudy
    case VeryCloudy
    case BlackishOrBrownish
}

public let TYPE_MAP: [PrimaryType: [SecondaryType: [DataType: [DataUnit]]]] = [
    .Abiotic: [
        .Air: [
            .CarbonDioxide: [
                .PartsPerMillion
            ],
            .Light: [
                .Lux
            ],
            .Ozone: [
                .AirOzoneScale
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
                .SoilPotassiumScale
            ],
            .Moisture: [
                .Percent
            ],
            .Texture: [
                .SoilTextureScale
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
                .WaterOdorScale
            ],
            .pH: [
                .WaterPHScale
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
                .WaterTurbidityScale
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

