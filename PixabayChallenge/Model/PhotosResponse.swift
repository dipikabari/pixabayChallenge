//
//  PhotosResponse.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

import Foundation

struct PhotosResponse: Decodable {
    let total, totalHits: Int
    let hits : [Photos]
}

struct Photos: Decodable {
        let id: Int
        let pageURL: String
        let type: TypeEnum
        let tags: String
        let previewURL: String
        let previewWidth, previewHeight: Int
        let webformatURL: String
        let webformatWidth, webformatHeight: Int
        let largeImageURL: String
        let imageWidth, imageHeight, imageSize, views: Int
        let downloads, collections, likes, comments: Int
        let userID: Int
        let user: String
        let userImageURL: String
}

enum TypeEnum: Decodable {
    case illustration
    case photo
}
