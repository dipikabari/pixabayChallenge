//
//  ImageCache.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 11/05/2022.
//

import UIKit

/**Image caching code **/
protocol ImageCacherType {
    func getImage(url:String)-> Data?
    func saveImage(url:String, data:Data)
}

class ImageCache:ImageCacherType {
    static let shared = ImageCache()
    var cache = NSCache<NSString, NSData>()

    private init(){
       // cache.countLimit = 100
    }
    
    func getImage(url: String) -> Data? {
        return cache.object(forKey: url as NSString) as Data?
    }
    
    func saveImage(url: String, data: Data) {
        cache.setObject(data as NSData, forKey: url as NSString)
    }
}
