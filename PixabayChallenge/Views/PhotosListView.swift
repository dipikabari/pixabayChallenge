//
//  PhotosListView.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 11/05/2022.
//

import UIKit

protocol PhotoListItemDelegate {
    func selectedPhoto(photo: Photos)
}

class PhotosListView: UIView {
    
    let CELL_ID = "cellID"
    var delegate: PhotoListItemDelegate?
    
    var viewModel: PhotosViewModel {
        let viewModel = PhotosViewModel(delegate: self)
        return viewModel
    }
    
    var tableView: UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PhotoCell.self, forCellReuseIdentifier: CELL_ID)
        return tableView
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
        
    }
    
    func setUpView() {
        addSubview(tableView)
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
          tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
          tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
          tableView.topAnchor.constraint(equalTo: topAnchor),
          tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension PhotosListView : PhotoListItemDelegate {
    func selectedPhoto(photo: Photos) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension PhotosListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension PhotosListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.photosCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? PhotoCell
        let photo = viewModel.getPhoto(atIndex: indexPath.row)
        
        return cell ?? UITableViewCell()
    }

}

extension PhotosListView: PhotosViewProtocol {
    func displayError(_ message: String) {
        <#code#>
    }
    
    func refreshUI() {
        <#code#>
    }
    
    
    

}
