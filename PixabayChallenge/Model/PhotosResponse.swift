//
//  PhotosResponse.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

import Foundation

struct PhotosResponse: Decodable {
    let hits : [Photos]
}

struct Photos: Decodable {
        let id: Int
        let pageURL: String
        let tags: String
        let previewURL: String
        let webformatURL: String
        let largeImageURL: String
}


