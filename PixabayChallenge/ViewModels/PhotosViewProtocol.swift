//
//  PhotosViewProtocol.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

import Foundation

protocol PhotosViewProtocol: AnyObject {
    func displayError(_ message: String)
    func refreshUI()
}
