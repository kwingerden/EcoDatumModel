//
//  Notebook.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 3/16/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

public struct Notebook: Codable, CustomStringConvertible, Equatable, Validatable {
    
    public static let DEFAULT_NAME = "Default"
    public static let KIND = "EcoDatum#Notebook"
    
    public let kind: String
    public let id: UUID
    public let name: String
    public let createdDate: Date
    public let updatedDate: Date
    public let sites: [Site]?
    
    public init(id: UUID,
                name: String,
                createdDate: Date,
                updatedDate: Date,
                sites: [Site]? = nil) {
        self.kind = Notebook.KIND
        self.id = id
        self.name = name
        self.createdDate = createdDate
        self.updatedDate = updatedDate
        self.sites = sites
    }
    
    public var description: String {
        return "Notebook id: \(String(describing: id)), name: \(name)"
    }
    
    public var isValid: Bool {
        return kind == Notebook.KIND
    }
    
    public static func == (lhs: Notebook, rhs: Notebook) -> Bool {
        return lhs.id == rhs.id
    }
    
}
