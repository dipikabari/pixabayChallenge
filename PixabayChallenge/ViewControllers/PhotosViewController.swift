//
//  PhotosViewController.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 11/05/2022.
//
import Foundation
import UIKit

class PhotosViewController: UIViewController {
    
    var photosCollectionView: UICollectionView?
    var viewModelObj: PhotosViewModel!
    
    init(viewModel: PhotosViewModel){
        self.viewModelObj = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
      super.loadView()
        displayCollectionView()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .blue
        //viewModelObj = PhotosViewModel(delegate: self)
        DispatchQueue.main.async {
            self.photosCollectionView?.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let view = UIView()
        view.backgroundColor = .blue
        //viewModelObj = PhotosViewModel(delegate: self)
        DispatchQueue.main.async {
            self.photosCollectionView?.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    private func displayCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:20, left:10, bottom:10, right:10)
        layout.itemSize = CGSize(width:100, height:100)
        
        photosCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        photosCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        photosCollectionView?.dataSource = self
        photosCollectionView?.delegate = self
        photosCollectionView?.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        photosCollectionView?.backgroundColor = UIColor.white
        
        self.view.addSubview(photosCollectionView ?? UICollectionView())
        
       // photosCollectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    
    }
}

extension PhotosViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelObj.photosCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? PhotosCollectionViewCell else{
            return UICollectionViewCell()
        }
        myCell.backgroundColor = UIColor.blue
        
        if let photos = viewModelObj?.getPhoto(atIndex: indexPath.row) {
            myCell.configureData(photos: photos)
        }
        
        return myCell
    }
    
    
}

extension PhotosViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped item \(indexPath.row)")
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }

   
}

extension PhotosViewController: PhotosViewProtocol {
    func displayError(_ message: String) {
        
    }
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.photosCollectionView?.reloadData()
        }
        
    }
    
}
