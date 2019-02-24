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
        guard let photo = "photo".base64Encode() else {
            XCTFail()
            return
        }
        let photo1 = Photo(id: UUID(), createdDate: Date(), updatedDate: Date(), photo: photo)
        let json = try toJSON(photo1)
        let photo2 = try fromJSON(Photo.self, json)
        XCTAssert(photo1 == photo2)
    }
    
}
