//
//  Endpoint.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

/* An example request might look like:
 https://pixabay.com/
 api/?key=13197033-03eec42c293d2323112b4cca6
 &q=yellow+flowers
 &image_type=photo
*/
import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var query: String { get }
}

extension Endpoint {
    var authHeader: String {
        return API.key
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base) ?? URLComponents()
        components.path = path
        components.query = query
        return components
    }
    
    var request: URLRequest {
        var url = urlComponents.url ?? URL(string: "https://pixabay.com")!
        var request = URLRequest(url: url)
        request.setValue(authHeader, forHTTPHeaderField: "Authorization")
        return request
    }
}
