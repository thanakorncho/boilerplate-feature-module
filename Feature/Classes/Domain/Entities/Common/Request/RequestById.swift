//
//  RequestById.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 15/6/22.
//

import Foundation

public struct RequestById: Encodable {
    public let id: String
    public var start: Int?
    public var length: Int?

    public init(
        id: String,
        start: Int? = nil,
        length: Int? = nil
    ) {
        self.id = id
        self.start = start
        self.length = length
    }
}
