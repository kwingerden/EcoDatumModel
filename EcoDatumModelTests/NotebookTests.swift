//
//  NotebookTests.swift
//  EcoDatumModelTests
//
//  Created by Kenneth Wingerden on 3/16/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import XCTest
import EcoDatumCommon
@testable import EcoDatumModel

class NotebookTests: XCTestCase {

    func test() throws {
        let defaultNotebookJSON = try toJSON(defaultNotebook)
        print(defaultNotebookJSON)
    }
    
}
