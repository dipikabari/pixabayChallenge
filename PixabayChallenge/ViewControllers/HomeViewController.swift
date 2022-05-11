//
//  HomeViewController.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModelObj: PhotosViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        viewModelObj = PhotosViewModel(delegate: self)
        
        viewModelObj.fetchData(text: "yellow flower")
    }

}

extension HomeViewController: PhotosViewProtocol {
    func displayError(_ message: String) {
        DispatchQueue.main.async {

        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(doneButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func refreshUI() {
        
    }
}
