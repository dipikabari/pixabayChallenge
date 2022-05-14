//
//  PhotosViewModel.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

import UIKit

final class PhotosViewModel {
    
    private var photoArray = [Photos]()
    private let networkManager:Networkable
    private var delegate: PhotosViewProtocol?
    
    var photosCount:Int {
        return photoArray.count
    }
    
    func getPhoto(atIndex: Int) -> Photos {
        return photoArray[atIndex]
    }
    
    init(delegate: PhotosViewProtocol, networkManager:Networkable = NetworkManager()){
        self.delegate = delegate
        self.networkManager = networkManager
    }

    /* get response from api into your defined array*/
    func fetchData(text: String) {
          
          self.networkManager.fetchData(text: text) { [weak self] response, error in
              
              guard let response = response , error == nil else {
                  self?.delegate?.displayError("Failed to Search, Pls try again!")
                  return
              }

              self?.photoArray = response.hits
              
              print(self?.photoArray.count)
              print(self?.photoArray[0].id)
              print("preview url---->  \(self?.photoArray[0].previewURL)")
              print("webformat url -----> \(self?.photoArray[0].webformatURL)")
              print("largeImage url -----> \(self?.photoArray[0].largeImageURL)")
              
              DispatchQueue.main.async {
                  self?.delegate?.refreshUI()
              }
          }
  }
    
}
