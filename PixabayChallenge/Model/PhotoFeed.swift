//
//  PhotoFeed.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

import Foundation

enum PhotoFeed {
    case searchByCategory(category: String, perPage: Int)
    case curated(currentPage: Int, perPage: Int)
}

    
    
