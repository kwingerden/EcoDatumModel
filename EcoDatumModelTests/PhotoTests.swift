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

class PhotoTests: XCTestCase {

    func testJSON() throws {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "test1", ofType: "jpeg"),
            let testImage = UIImage(contentsOfFile: path),
            let base64Encoded = testImage.base64Encode() else {
                XCTFail()
                return
        }
        
        let photo1 = Photo(id: UUID(), createdDate: Date(), updatedDate: Date(), photo: base64Encoded)
        let json = try toJSON(photo1)
        let photo2 = try fromJSON(Photo.self, json)
        XCTAssert(photo1 == photo2)
        
        guard let data1 = base64Encoded.base64Decode(),
            let image1 = UIImage(data: data1),
            let data2 = photo2.photo.base64Decode(),
            let image2 = UIImage(data: data2) else {
                XCTFail()
                return
        }
        
        XCTAssert(image1.pngData() == image2.pngData())
    }
    
}
