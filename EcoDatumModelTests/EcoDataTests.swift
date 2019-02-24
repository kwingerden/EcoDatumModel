//
//  PhotoTests.swift
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

    func testBioticPhoto() throws {
        let bundle = Bundle(for: type(of: self))
        guard let photo1URL = bundle.url(forResource: "photo1", withExtension: "jpg"),
            let photo1Data = try? Data(contentsOf: photo1URL),
            let ecoDataBioticPhotoURL = bundle.url(forResource: "EcoDataBioticPhoto", withExtension: "json"),
            let ecoDataBioticPhotoData = try? Data(contentsOf: ecoDataBioticPhotoURL),
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
            dataValue: photo1Data,
            associations: nil)
        
        let json1 = try toJSON(ecoData1)
        
        let ecoData2 = try fromJSON(EcoData.self, json1)
        XCTAssert(ecoData1 == ecoData2)
        
        let json2 = try JSONSerialization.jsonObject(with: ecoDataBioticPhotoData, options: []) as! Dictionary<String, AnyObject>
        XCTAssert(ecoData1.id.uuidString == json2["id"] as! String)
        XCTAssert(ecoData1.createdDate.iso8601String() == json2["createdDate"] as! String)
        XCTAssert(ecoData1.updatedDate.iso8601String() == json2["updatedDate"] as! String)
        XCTAssert(ecoData1.collectionDate.iso8601String() == json2["collectionDate"] as! String)
        XCTAssert(ecoData1.primaryType.rawValue == json2["primaryType"] as! String)
        XCTAssert(ecoData1.secondaryType.rawValue == json2["secondaryType"] as! String)
        XCTAssert(ecoData1.dataType.rawValue == json2["dataType"] as! String)
        XCTAssert(ecoData1.dataUnit == nil)
        XCTAssert(String(data: ecoData1.dataValue.base64EncodedData() , encoding: .utf8) == (json2["dataValue"] as! String))
    }
    
}
