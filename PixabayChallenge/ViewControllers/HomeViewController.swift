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
    
    private lazy var searchLabel: UILabel = UILabel(frame: CGRect(x:30, y:280, width:330.00, height:50.00))
    private lazy var searchText: UITextField = UITextField(frame: CGRect(x:30, y:320, width:330.00, height:50.00))
    private lazy var searchButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "CandySpaceBackground.png")!)
        
        viewModelObj = PhotosViewModel(delegate: self)
        
        displaySearchLabel()
        displaySearchBox()
        displaySearchButton()
        
        
    }
    
    private func displaySearchLabel(){
        searchLabel.text = "Search for photos"
        searchLabel.textAlignment = .center
        searchLabel.textColor = UIColor.blue
        self.view.addSubview(searchLabel)
    }
    
    private func displaySearchBox() {
        searchText.placeholder = "Type here"
        searchText.borderStyle = UITextField.BorderStyle.line
        searchText.backgroundColor = UIColor.white
        searchText.textColor = UIColor.blue
        searchText.delegate = self
        self.view.addSubview(searchText)
    }
    
    private func displaySearchButton() {
        searchButton.frame = CGRect(x:150, y:380, width:100.00, height:30.00)
        searchButton.setTitle("Search Now", for: .normal)
        searchButton.tintColor = UIColor.green
        searchButton.layer.borderWidth = 1
        searchButton.backgroundColor = UIColor.blue
        searchButton.layer.cornerRadius = 6.0
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        self.view.addSubview(searchButton)
        
 
    }
    
    @objc func buttonClicked(){
        print("Search button")
        viewModelObj.fetchData(text: searchText.text ?? "")
        print(viewModelObj.photosCount)
        openNextView()
//        if viewModelObj.photosCount > 0 {
//            openNextView()
//            print("After openNextView")
//        }
        
    }
    
    private func openNextView() {
        print("Inside openNextView")
//        let vc = PhotosViewController(nibName: "PhotosViewController", bundle: nil)
//        self.navigationController?.pushViewController(vc, animated: true)
        
//        let obj : PhotosViewController = PhotosViewController(viewModel: viewModelObj)
//        self.navigationController?.pushViewController(obj, animated: true)
        
        
        let photosViewController = PhotosViewController(viewModel: viewModelObj)
        self.present(photosViewController, animated: true, completion: nil)

    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
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
