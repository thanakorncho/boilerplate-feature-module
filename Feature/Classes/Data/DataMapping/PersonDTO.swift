//
//  PersonDTO.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 21/4/2566 BE.
//

import Foundation

struct Person: AutoDecodable {
    let id: String
    let firstName: String
    let surName: String
    let age: Int
    let suspend: Bool
    
    enum CodingKeys: String, CodingKey {
    // sourcery:inline:auto:Person.CodingKeys.AutoCodable
            case id
            case firstName
            case surName
            case age
            case suspend
    // sourcery:end
    }
}
