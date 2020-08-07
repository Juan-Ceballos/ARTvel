//
//  TicketmasterAPIClient.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/4/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

class TicketMasterAPIClient {
    static func fetchEvents(completion: @escaping (Result<[Event], AppError>) -> ())   {
        // basic call then add querys
        let endpointURL = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=\(SecretKey.consumerKey)"
        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: urlRequest) { (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let data):
                do {
                    let eventQuery = try JSONDecoder().decode(EventWrapper.self, from: data)
                    let events = eventQuery.embedded.events
                    completion(.success(events))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
