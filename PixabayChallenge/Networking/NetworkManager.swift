//
//  NetworkManager.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

import Foundation

protocol Networkable {
    func fetchData(text:String, completion: @escaping (PhotosResponse?, Error?) -> Void)
}

class NetworkManager: Networkable {
    
    func fetchData(text:String, completion: @escaping (PhotosResponse?, Error?) -> Void){
       
        guard let url = URL(string: fetchUrlforSearch(searchText: text).absoluteString) else { return }
            
            URLSession.shared.dataTask(with: url) { data, urlResponse, error in
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    completion(nil, ServiceError.requestFailed)
                    return
                }

                if httpResponse.statusCode == 200 {
                    if let data =  data{
                        do {
                            let result: PhotosResponse = try JSONDecoder().decode(PhotosResponse.self, from: data)
                            completion(result, nil)
                        }catch let error {
                            completion(nil, ServiceError.jsonConversionFailed)
                        }
                    }else {
                        completion(nil, ServiceError.dataNotFound)
                    }
                }else{
                    completion(nil, ServiceError.responseUnsuccessful)
                }
            }
            .resume()
        }
    
    /* construct the url  */
    /* An example request might look like:
     https://pixabay.com/
     api/?key=13197033-03eec42c293d2323112b4cca6
     &q=yellow+flowers
     &image_type=photo
    */
     func fetchUrlforSearch(searchText: String) -> URL {
         var components = URLComponents()
         
         components.scheme = "https"
         components.host = "www.pixabay.com"
         components.path = "/"
             
         components.queryItems = [
            URLQueryItem(name: "api", value: API.key),
            URLQueryItem(name: "q", value: searchText),
            URLQueryItem(name: "image_type", value: "photo"),
          ]

         guard let url = components.url else {
             preconditionFailure("Invalid URL string")
         }
         print(url)
         return url
     }
    
    func getImageData(from url: String, completion: @escaping (Data?) -> Void) {
            guard let url = URL(string: url) else { completion(nil)
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                completion(data)
            }
            .resume()
    }

}
