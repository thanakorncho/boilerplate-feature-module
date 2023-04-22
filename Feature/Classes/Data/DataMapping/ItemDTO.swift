//
//  ItemDTO.swift
//  Feature-Feature-Assets
//
//  Created by Thanakorn Chongcharoenthanakul on 21/4/2566 BE.
//

import Foundation

struct ItemDTO: AutoDecodable {
    let id: Int
    let name: String
    let price: Double
    let quantity: Int

    enum CodingKeys: String, CodingKey {

    // sourcery:inline:auto:ItemDTO.CodingKeys.AutoCodable
            case id
            case name
            case price
            case quantity
    // sourcery:end
    }
}
