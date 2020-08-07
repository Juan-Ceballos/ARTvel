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
    
    func testNetworkHelperRijkCollectionsAPI()   {
        // arrange
        let searchQuery = "Rembrandt van Rijn".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let exp = XCTestExpectation(description: "Art Objects Found")
        let collectionEndpoint = "https://www.rijksmuseum.nl/api/nl/collection?key=\(SecretKey.apiKey)&involvedMaker=\(searchQuery)"
        let request = URLRequest(url: URL(string: collectionEndpoint)!)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            //exp.fulfill()
            switch result {
            case .failure(let error):
                print(error)
                XCTFail("\(error)")
            case .success(let data):
                exp.fulfill()
                XCTAssertGreaterThan(data.count, 20_000, "data should be greater than \(data.count)")
            }
        }
        wait(for: [exp], timeout: 5.0)
        // act
        // assert
    }
    
    func testFetchArtObjects()   {
        // arrange
        let searchQuery = "Rembrandt van Rijn"
        let exp = XCTestExpectation(description: "Art Objects Found")
        
        RijksAPIClient.fetchArtObjects(searchQuery: searchQuery) { (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let apiArtObjects):
                exp.fulfill()
                let numberOfArtItemsForQuery = apiArtObjects.count
                XCTAssertGreaterThan(numberOfArtItemsForQuery, 5)
            }
        }
        
        wait(for: [exp], timeout: 5.0)
        //fetchArtObject(
        // act
        // assert
    }
    
    func testFetchDetailsOfArtObject() {
        // arrange
        let exp = XCTestExpectation(description: "got details for art object")
        
        let objectNumber = "SK-C-5"
        
        RijksAPIClient.fetchDetailsOfArtObject(objectNumber: objectNumber) { (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let details):
                exp.fulfill()
                let artDate = details.dating.presentingDate
                XCTAssertEqual(artDate, "1642")
            }
        }
        
        wait(for: [exp], timeout: 5.0)
        // act
        // assert
    }
    
}
