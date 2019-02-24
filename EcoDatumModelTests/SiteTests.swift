//
//  SiteTests.swift
//  EcoDatumModelTests
//
//  Created by Kenneth Wingerden on 2/22/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import XCTest
import EcoDatumCommon
@testable import EcoDatumModel

class SiteTests: XCTestCase {
    
    var site1: Site!
    
    override func setUp() {
        //site1 = Site(id: UUID(), name: "Site 1", createdDate: Date(), updatedDate: Date())
    }
    
    override func tearDown() {
    
    }
    
    func testJSON() throws {
        /*
        let json = try EcoDatumCommon.toJSON(site1)
        let site2 = try EcoDatumCommon.fromJSON(Site.self, json)
        XCTAssert(site1 == site2)
 */
    }
    
    func testCustomStringConvertible() {
        /*
        XCTAssert(site1.description == "Site id: \(site1.id), name: Site 1")
 */
    }

}
