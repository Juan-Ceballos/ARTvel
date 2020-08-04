//
//  ARTvelTests.swift
//  ARTvelTests
//
//  Created by Juan Ceballos on 7/29/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import XCTest
@testable import ARTvel

class ARTvelTests: XCTestCase {
    // test list
    /*
     1. hitting api
     using key and secret to pull data from api
     dictionary json, key:value
     bulk is in "artObjects" : [ArtObjects]
     2. models
     3. classes
     4. firebase
     5.
     */
    
    func testRijkCollectionsAPI()   {
        // arrange
        let searchQuery = "Rembrandt+van+Rijn"
        let exp = XCTestExpectation(description: "Art Objects Found")
        let collectionEndpoint = "https://www.rijksmuseum.nl/api/nl/collection?key=9oErvwz9&involvedMaker=\(searchQuery)"
        let request = URLRequest(url: URL(string: collectionEndpoint)!)
        
        NetworkHelper.shared.performDataTask(with: request)
        
        // act
        // assert
    }
}
