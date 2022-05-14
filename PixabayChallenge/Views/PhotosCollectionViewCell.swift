//
//  PhotosCollectionViewCell.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 12/05/2022.
//

import Foundation
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell{
    
    let imageView = UIImageView(frame: CGRect(x:0, y:0, width:50, height:50))
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            ])
           
            self.contentView.backgroundColor = .lightGray
            
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(photos: Photos) {
        setImageView(imageURL: photos.previewURL)
    }
    
    private func setImageView(imageURL:String) {
        
        ImageDownloader.shared.getImage(url: imageURL) { [weak self] data in
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
                self?.imageView.contentMode = UIView.ContentMode.scaleAspectFit
                self?.addSubview(self?.imageView ?? UIImageView())
            }
        }
    }
}
