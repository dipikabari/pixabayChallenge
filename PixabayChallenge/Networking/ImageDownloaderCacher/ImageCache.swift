//
//  ImageCache.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 11/05/2022.
//

import UIKit

class ImageCache {
    static let shared = ImageCache()
    
    private init() {}
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }

}

/**Image caching code **/
protocol ImageCacherType {
    func getImage(url:String)-> Data?
    func saveImage(url:String, data:Data)
}

class ImageCacher:ImageCacherType {
    static let shared = ImageCacher()
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
