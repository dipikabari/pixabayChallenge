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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .white
    }
    
    override func didReceiveMemoryWarning() {
        //gives memory full warning
    }
}
