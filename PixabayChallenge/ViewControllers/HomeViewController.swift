//
//  HomeViewController.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

import UIKit

class HomeViewController: UIViewController, PhotosViewProtocol {
    func displayError(_ message: String) {
        
    }
    
    func refreshUI() {
        
    }
    

    var viewModelObj: PhotosViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        viewModelObj = PhotosViewModel(delegate: self)
        
        viewModelObj.fetchData(text: "yellow flower")
    }

}
