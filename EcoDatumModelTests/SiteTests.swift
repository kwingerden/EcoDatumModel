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
    
    func test1() throws {
        XCTAssert(appleHQSite.location?.isValid ?? false)
        XCTAssert(googleplexSite.location?.isValid ?? false)
    }
    
}
