//
//  RequestUpload.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 30/8/22.
//

import Foundation

public struct RequestUpload: Encodable {
    var fileExtension: String?
    let mimeType: String
    var tempUrl: String?

    public init(
        fileExtension: String? = nil,
        mimeType: String,
        tempUrl: String? = nil
    ) {
        self.fileExtension = fileExtension
        self.mimeType = mimeType
        self.tempUrl = tempUrl
    }

    public init(
        fileExtension: FileExtension? = nil,
        mimeType: Media,
        tempUrl: String? = nil
    ) {
        self.init(
            fileExtension: fileExtension?.rawValue,
            mimeType: mimeType.rawValue,
            tempUrl: tempUrl)
    }

    public enum Media: String {
        case imageJPEG = "image/jpeg"
        case imagePNG = "image/png"
    }

    public enum FileExtension: String {
        case jpeg = ".jpg"
        case png = ".png"
    }
}
