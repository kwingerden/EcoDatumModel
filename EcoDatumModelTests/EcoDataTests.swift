//
//  EcoDataTests.swift
//  EcoDatumModelTests
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

import XCTest
import EcoDatumCommon
@testable import EcoDatumModel

class EcoDataTests: XCTestCase {
    
    func testIsValid() throws {
        let bundle = Bundle(for: type(of: self))
        guard let bioticPhoto1JPGURL = bundle.url(forResource: "BioticPhoto1", withExtension: "jpg"),
            let bioticPhoto1JPGData = try? Data(contentsOf: bioticPhoto1JPGURL) else {
                XCTFail()
                return
        }
        
        var ecoData = EcoData(
            id: UUID(),
            createdDate: Date(),
            updatedDate: Date(),
            collectionDate: Date(),
            primaryType: .Biotic,
            secondaryType: .Photo,
            dataType: .JPEG,
            dataUnit: nil,
            dataValue: bioticPhoto1JPGData.base64EncodedString(),
            ecoData: nil)
        XCTAssert(ecoData.isValid())
        
        ecoData = EcoData(
            id: UUID(),
            createdDate: Date(),
            updatedDate: Date(),
            collectionDate: Date(),
            primaryType: .Biotic,
            secondaryType: .Air,
            dataType: .JPEG,
            dataUnit: nil,
            dataValue: bioticPhoto1JPGData.base64EncodedString(),
            ecoData: nil)
        XCTAssert(!ecoData.isValid())
        
        ecoData = EcoData(
            id: UUID(),
            createdDate: Date(),
            updatedDate: Date(),
            collectionDate: Date(),
            primaryType: .Abiotic,
            secondaryType: .Air,
            dataType: .PAR,
            dataUnit: .PhotosyntheticPhotonFluxDensity,
            dataValue: "123".data(using: .utf8)!.base64EncodedString(),
            ecoData: nil)
        XCTAssert(ecoData.isValid())
        
        ecoData = EcoData(
            id: UUID(),
            createdDate: Date(),
            updatedDate: Date(),
            collectionDate: Date(),
            primaryType: .Abiotic,
            secondaryType: .Air,
            dataType: .PAR,
            dataUnit: .Percent,
            dataValue: "123".data(using: .utf8)!.base64EncodedString(),
            ecoData: nil)
        XCTAssert(!ecoData.isValid())
        
        ecoData = EcoData(
            id: UUID(),
            createdDate: Date(),
            updatedDate: Date(),
            collectionDate: Date(),
            primaryType: .Abiotic,
            secondaryType: .Water,
            dataType: .Turbidity,
            dataUnit: .WaterTurbidityScale,
            dataValue: WaterTurbidityScale.BlackishOrBrownish.base64Encoded()!,
            ecoData: nil)
        XCTAssert(ecoData.isValid())
        
        ecoData = EcoData(
            id: UUID(),
            createdDate: Date(),
            updatedDate: Date(),
            collectionDate: Date(),
            primaryType: .Abiotic,
            secondaryType: .Soil,
            dataType: .Texture,
            dataUnit: .SoilTextureScale,
            dataValue: SoilTextureScale(percentSand: 20, percentSilt: 30, percentClay: 40).base64Encoded()!,
            ecoData: nil)
        XCTAssert(ecoData.isValid())
    }
    
    func testBioticPhoto() throws {
        let bundle = Bundle(for: type(of: self))
        guard let bioticPhoto1JPGURL = bundle.url(forResource: "BioticPhoto1", withExtension: "jpg"),
            let bioticPhoto1JPGData = try? Data(contentsOf: bioticPhoto1JPGURL),
            let bioticPhotoJSONURL = bundle.url(forResource: "BioticPhoto", withExtension: "json"),
            let bioticPhotoJSONData = try? Data(contentsOf: bioticPhotoJSONURL),
            let uuid = UUID(uuidString: "69F6C8EB-BE14-491B-BC74-BB0668AFA765"),
            let date = "2019-02-24T04:38:31Z".iso8601Date() else {
                XCTFail()
                return
        }
        
        let ecoData1 = EcoData(
            id: uuid,
            createdDate: date,
            updatedDate: date,
            collectionDate: date,
            primaryType: .Biotic,
            secondaryType: .Photo,
            dataType: .JPEG,
            dataUnit: nil,
            dataValue: bioticPhoto1JPGData.base64EncodedString(),
            ecoData: nil)
        
        let ecoDataJSON1 = try toJSON(ecoData1)
        
        let ecoData2 = try fromJSON(EcoData.self, ecoDataJSON1)
        XCTAssert(ecoData1 == ecoData2)
        
        let ecoDataJSON2 = try JSONSerialization.jsonObject(with: bioticPhotoJSONData, options: []) as! Dictionary<String, AnyObject>
        XCTAssert(ecoData1.id.uuidString == ecoDataJSON2["id"] as! String)
        XCTAssert(ecoData1.createdDate.iso8601String() == ecoDataJSON2["createdDate"] as! String)
        XCTAssert(ecoData1.updatedDate.iso8601String() == ecoDataJSON2["updatedDate"] as! String)
        XCTAssert(ecoData1.collectionDate.iso8601String() == ecoDataJSON2["collectionDate"] as! String)
        XCTAssert(ecoData1.primaryType.rawValue == ecoDataJSON2["primaryType"] as! String)
        XCTAssert(ecoData1.secondaryType.rawValue == ecoDataJSON2["secondaryType"] as! String)
        XCTAssert(ecoData1.dataType.rawValue == ecoDataJSON2["dataType"] as! String)
        XCTAssert(ecoData1.dataUnit == nil)
        XCTAssert(ecoData1.dataValue == (ecoDataJSON2["dataValue"] as! String))
    }
    
    func testBioticNote() throws {
        let bundle = Bundle(for: type(of: self))
        guard let bioticNote1HTMLURL = bundle.url(forResource: "BioticNote", withExtension: "html"),
            let bioticNote1HTMLData = try? Data(contentsOf: bioticNote1HTMLURL),
            let bioticNoteURL = bundle.url(forResource: "BioticNote", withExtension: "json"),
            let bioticNoteData = try? Data(contentsOf: bioticNoteURL),
            let uuid = UUID(uuidString: "B0F1A04E-69FD-4838-AE69-D9DCC4A46B70"),
            let date = "2019-02-24T22:33:30Z".iso8601Date() else {
                XCTFail()
                return
        }
        
        let ecoData1 = EcoData(
            id: uuid,
            createdDate: date,
            updatedDate: date,
            collectionDate: date,
            primaryType: .Biotic,
            secondaryType: .Note,
            dataType: .HTML,
            dataUnit: nil,
            dataValue: bioticNote1HTMLData.base64EncodedString(),
            ecoData: nil)
        
        let json1 = try toJSON(ecoData1)
        
        let ecoData2 = try fromJSON(EcoData.self, json1)
        XCTAssert(ecoData1 == ecoData2)
        
        let json2 = try JSONSerialization.jsonObject(with: bioticNoteData, options: []) as! Dictionary<String, AnyObject>
        XCTAssert(ecoData1.id.uuidString == json2["id"] as! String)
        XCTAssert(ecoData1.createdDate.iso8601String() == json2["createdDate"] as! String)
        XCTAssert(ecoData1.updatedDate.iso8601String() == json2["updatedDate"] as! String)
        XCTAssert(ecoData1.collectionDate.iso8601String() == json2["collectionDate"] as! String)
        XCTAssert(ecoData1.primaryType.rawValue == json2["primaryType"] as! String)
        XCTAssert(ecoData1.secondaryType.rawValue == json2["secondaryType"] as! String)
        XCTAssert(ecoData1.dataType.rawValue == json2["dataType"] as! String)
        XCTAssert(ecoData1.dataUnit == nil)
        XCTAssert(ecoData1.dataValue == (json2["dataValue"] as! String))
    }
    
    func testBioticPhotoAndNote() throws {
        let bundle = Bundle(for: type(of: self))
        guard let bioticPhoto1JPGURL = bundle.url(forResource: "BioticPhoto1", withExtension: "jpg"),
            let bioticPhoto1JPGData = try? Data(contentsOf: bioticPhoto1JPGURL),
            let bioticNote1HTMLURL = bundle.url(forResource: "BioticNote", withExtension: "html"),
            let bioticNote1HTMLData = try? Data(contentsOf: bioticNote1HTMLURL),
            let bioticPhotoAndNoteURL = bundle.url(forResource: "BioticPhotoAndNote", withExtension: "json"),
            let bioticPhotoAndNoteData = try? Data(contentsOf: bioticPhotoAndNoteURL),
            let photoUUID = UUID(uuidString: "EC1F0E6F-5AFC-4866-8000-8A1DBA647278"),
            let noteUUID = UUID(uuidString: "B74B79CC-2F5E-4D23-9539-C56DC84BA354"),
            let date = "2019-02-24T22:52:11Z".iso8601Date() else {
                XCTFail()
                return
        }
        
        let ecoDataNote1 = EcoData(
            id: photoUUID,
            createdDate: date,
            updatedDate: date,
            collectionDate: date,
            primaryType: .Biotic,
            secondaryType: .Note,
            dataType: .HTML,
            dataUnit: nil,
            dataValue: bioticNote1HTMLData.base64EncodedString(),
            ecoData: nil)
        let ecoDataPhotoAndNote1 = EcoData(
            id: noteUUID,
            createdDate: date,
            updatedDate: date,
            collectionDate: date,
            primaryType: .Biotic,
            secondaryType: .Photo,
            dataType: .JPEG,
            dataUnit: nil,
            dataValue: bioticPhoto1JPGData.base64EncodedString(),
            ecoData: [ecoDataNote1])
        
        let json1 = try toJSON(ecoDataPhotoAndNote1)
        
        let ecoDataPhotoAndNote2 = try fromJSON(EcoData.self, json1)
        XCTAssert(ecoDataPhotoAndNote1 == ecoDataPhotoAndNote2)
        
        let json2 = try JSONSerialization.jsonObject(with: bioticPhotoAndNoteData, options: []) as! Dictionary<String, AnyObject>
        XCTAssert(ecoDataPhotoAndNote1.id.uuidString == json2["id"] as! String)
        XCTAssert(ecoDataPhotoAndNote1.createdDate.iso8601String() == json2["createdDate"] as! String)
        XCTAssert(ecoDataPhotoAndNote1.updatedDate.iso8601String() == json2["updatedDate"] as! String)
        XCTAssert(ecoDataPhotoAndNote1.collectionDate.iso8601String() == json2["collectionDate"] as! String)
        XCTAssert(ecoDataPhotoAndNote1.primaryType.rawValue == json2["primaryType"] as! String)
        XCTAssert(ecoDataPhotoAndNote1.secondaryType.rawValue == json2["secondaryType"] as! String)
        XCTAssert(ecoDataPhotoAndNote1.dataType.rawValue == json2["dataType"] as! String)
        XCTAssert(ecoDataPhotoAndNote1.dataUnit == nil)
        XCTAssert(ecoDataPhotoAndNote1.dataValue == (json2["dataValue"] as! String))
        
        let ecoDataArray = json2["ecoData"] as! [Dictionary<String, AnyObject>]
        XCTAssert(ecoDataArray.count == 1)
        let json3 = ecoDataArray[0]
        XCTAssert(ecoDataNote1.id.uuidString == json3["id"] as! String)
        XCTAssert(ecoDataNote1.createdDate.iso8601String() == json3["createdDate"] as! String)
        XCTAssert(ecoDataNote1.updatedDate.iso8601String() == json3["updatedDate"] as! String)
        XCTAssert(ecoDataNote1.collectionDate.iso8601String() == json3["collectionDate"] as! String)
        XCTAssert(ecoDataNote1.primaryType.rawValue == json3["primaryType"] as! String)
        XCTAssert(ecoDataNote1.secondaryType.rawValue == json3["secondaryType"] as! String)
        XCTAssert(ecoDataNote1.dataType.rawValue == json3["dataType"] as! String)
        XCTAssert(ecoDataNote1.dataUnit == nil)
        XCTAssert(ecoDataNote1.dataValue == (json3["dataValue"] as! String))
    }
    
    func testAbioticData1() throws {
        let bundle = Bundle(for: type(of: self))
        guard let abioticAirCarbonDioxideJSONURL = bundle.url(forResource: "AbioticAirCarbonDioxide", withExtension: "json"),
            let abioticAirCarbonDioxideData = try? Data(contentsOf: abioticAirCarbonDioxideJSONURL),
            let dataValueData = "344".data(using: .utf8),
            let uuid = UUID(uuidString: "1CA3CAF0-B073-489A-AE18-837C4D193D08"),
            let date = "2019-02-24T23:07:48Z".iso8601Date() else {
                XCTFail()
                return
        }
        let ecoData1 = EcoData(
            id: uuid,
            createdDate: date,
            updatedDate: date,
            collectionDate: date,
            primaryType: .Abiotic,
            secondaryType: .Air,
            dataType: .CarbonDioxide,
            dataUnit: .PartsPerMillion,
            dataValue: dataValueData.base64EncodedString(),
            ecoData: nil)
        
        let json1 = try toJSON(ecoData1)
        
        let ecoData2 = try fromJSON(EcoData.self, json1)
        XCTAssert(ecoData1 == ecoData2)
        
        let json2 = try JSONSerialization.jsonObject(with: abioticAirCarbonDioxideData, options: []) as! Dictionary<String, AnyObject>
        XCTAssert(ecoData1.id.uuidString == json2["id"] as! String)
        XCTAssert(ecoData1.createdDate.iso8601String() == json2["createdDate"] as! String)
        XCTAssert(ecoData1.updatedDate.iso8601String() == json2["updatedDate"] as! String)
        XCTAssert(ecoData1.collectionDate.iso8601String() == json2["collectionDate"] as! String)
        XCTAssert(ecoData1.primaryType.rawValue == json2["primaryType"] as! String)
        XCTAssert(ecoData1.secondaryType.rawValue == json2["secondaryType"] as! String)
        XCTAssert(ecoData1.dataType.rawValue == json2["dataType"] as! String)
        XCTAssert(ecoData1.dataUnit!.rawValue == json2["dataUnit"] as! String)
        XCTAssert(ecoData1.dataValue == (json2["dataValue"] as! String))
    }
}
