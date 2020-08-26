//
//  UserPreference.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/16/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

// Probably delete this added experience to user database

enum Experience: String {
    case rijks = "Rijksmuseum"
    case ticketmaster = "Ticketmaster"
}

struct UserPreferenceKey {
    static let experience = "Experience"
}

struct UserPreference {
    private init() {}
    
    static let shared = UserPreference()
    
    func updateUserPreference(with experience: Experience) {
        UserDefaults.standard.set(experience.rawValue, forKey: UserPreferenceKey.experience)
    }
    
    func getUserPreference() -> Experience?  {
        guard let experience = UserDefaults.standard.object(forKey: UserPreferenceKey.experience) as? String else {
            return nil
        }
        return Experience(rawValue: experience)
    }
}
