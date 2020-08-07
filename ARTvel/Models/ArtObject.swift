//
//  ArtObject.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/6/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

struct ArtObjectWrapper: Decodable {
    let artObjects: [ArtObject]
}

struct ArtObject: Decodable {
    let title: String
}


