//
//  AppError.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/4/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

public enum AppError: Error {
    case badURL(String)
    case networkClientError(Error)
    case decodingError(Error)
    case noResponse
    case noData
    case badStatusCode(Int)
}
