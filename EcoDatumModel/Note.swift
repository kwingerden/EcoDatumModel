//
//  Note.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import EcoDatumCommon

struct Note: Codable, CustomStringConvertible, Equatable {
    
    let id: UUID
    let createdDate: Date
    let updatedDate: Date
    let note: Base64Encoded
    
    var description: String {
        return "Note id: \(id)"
    }
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }
}
