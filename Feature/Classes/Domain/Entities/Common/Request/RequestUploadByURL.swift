//
//  RequestUploadByURL.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 30/8/22.
//

import Foundation

public struct RequestUploadByURL {
    public let image: UIImage
    public let url: String

    public init(
        image: UIImage,
        url: String
    ) {
        self.image = image
        self.url = url
    }
}
