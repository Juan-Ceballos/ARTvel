//
//  Event.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/7/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

struct EventWrapper: Decodable {
    let embedded: EventQuery
    
    private enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}

struct EventQuery: Decodable {
    let events: [Event]
}

struct Event: Decodable    {
    let name: String
}
