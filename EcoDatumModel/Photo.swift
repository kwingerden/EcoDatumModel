//
//  Photo.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import EcoDatumCommon

struct Photo: Codable, CustomStringConvertible, Equatable {
    
    let id: UUID
    let createdDate: Date
    let updatedDate: Date
    let photo: Base64Encoded
    
    var description: String {
        return "Photo id: \(id)"
    }
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}
