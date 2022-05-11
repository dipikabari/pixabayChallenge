//
//  PhotoCell.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 11/05/2022.
//

import UIKit

class PhotoCell: UITableViewCell {
    var onReuse: () -> Void = {}
    
    lazy var image: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        [image].forEach { imgView in
            contentView.addSubview(imgView)
        }
        setUpConstraints()
    }
    
    func setUpConstraints(){
        //image constraint
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
