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
    let objectNumber: String
    let title: String
    let webImage: WebImage
}

struct WebImage: Decodable {
    let url: String
}

struct DetailArtObjectWrapper: Decodable {
    let artObject: ArtObjectDetails
}

struct ArtObjectDetails: Decodable {
    let plaqueDescriptionEnglish: String
    let dating: DateWrapper
    let productionPlaces: [String]
}

struct DateWrapper: Decodable {
    let presentingDate: String
}

