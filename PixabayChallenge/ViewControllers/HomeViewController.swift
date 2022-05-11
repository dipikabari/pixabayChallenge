//
//  HomeViewController.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var viewModelObj: PhotosViewModel!
    
    let searchLabel: UILabel = UILabel(frame: CGRect(x:30, y:280, width:330.00, height:50.00))
    let searchText: UITextField = UITextField(frame: CGRect(x:30, y:320, width:330.00, height:50.00))
    let searchButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        displaySearchLabel()
        displaySearchBox()
        displaySearchButton()
        
        viewModelObj = PhotosViewModel(delegate: self)
    }
    
    func displaySearchLabel(){
        searchLabel.text = "Search for photos"
        searchLabel.textAlignment = .center
        self.view.addSubview(searchLabel)
    }
    
    func displaySearchBox() {
        searchText.placeholder = "Type here"
        searchText.borderStyle = UITextField.BorderStyle.line
        searchText.backgroundColor = UIColor.white
        searchText.textColor = UIColor.blue
        searchText.delegate = self
        self.view.addSubview(searchText)
    }
    
    func displaySearchButton() {
        searchButton.frame = CGRect(x:150, y:380, width:100.00, height:30.00)
        searchButton.setTitle("Search Now", for: .normal)
        searchButton.tintColor = UIColor.green
        searchButton.backgroundColor = UIColor.blue
        searchButton.layer.cornerRadius = 6.0
        searchButton.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        self.view.addSubview(searchButton)
    }
    
    @objc func buttonClicked(_ :UIButton){
        print("Search button")
        viewModelObj.fetchData(text: searchText.text ?? "")
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

extension HomeViewController: PhotosViewProtocol {
    func displayError(_ message: String) {
//        DispatchQueue.main.async {
//
//        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
//        let doneButton = UIAlertAction(title: "Done", style: .default, handler: nil)
//        alert.addAction(doneButton)
//            self.present(alert, animated: true, completion: nil)
//        }
    }
    
    func refreshUI() {
        
    }
    
}
