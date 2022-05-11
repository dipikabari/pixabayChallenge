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
    
    init(delegate: PhotosViewProtocol, networkManager:Networkable = NetworkManager()){
        self.delegate = delegate
        self.networkManager = networkManager
    }

    /* get response from api into your defined array*/
    func fetchData(text: String){
          
          self.networkManager.fetchData(text: text) { [weak self] response, error in
              
              guard let response = response , error == nil else {
                  self?.delegate?.displayError("Failed to Search, Pls try again!")
                  return
              }

              self?.photoArray = response.hits
              
              DispatchQueue.main.async {
                  self?.delegate?.refreshUI()
              }
          }
  }
    
}
