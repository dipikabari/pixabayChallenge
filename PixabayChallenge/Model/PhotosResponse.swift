//
//  PhotosResponse.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

import Foundation

struct PhotosResponse: Codable {
    let hits : [Photos]
}

struct Photos: Codable {
    var id: Int
    var pageUrl: String
    var type: String
    var webFormatURL: String
    var largeImageURL: String
}
