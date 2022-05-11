//
//  UIImageView+Extension.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 11/05/2022.
//

import UIKit

extension UIImageView {
    
    func loadImageFromUrl(urlString: String) {
        guard let url =  URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
            guard let data = data else {
                print("No data found")
                return
            }
            
            DispatchQueue.main.async {
                guard let loadedImage = UIImage(data: data) else {
                    return
                }
                
                ImageCache.shared.set(forKey: urlString, image: loadedImage)
                
                self.image = loadedImage
            }
        }
        task.resume()
    }
    
    
   
}
