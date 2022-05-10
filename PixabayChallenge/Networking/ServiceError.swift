//
//  ServiceError.swift
//  PixabayChallenge
//
//  Created by Dipika Bari on 10/05/2022.
//

import Foundation

enum ServiceError: Error {
    case requestFailed
    case dataNotFound
    case jsonParsingFailed
    case jsonConversionFailed
    case responseUnsuccessful
}
