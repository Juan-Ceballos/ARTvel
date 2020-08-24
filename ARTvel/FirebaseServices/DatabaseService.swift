//
//  DatabaseService.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/14/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class DatabaseService {
    static let usersCollection = "users"
    
    private let db = Firestore.firestore()
    
    public func createDatabaseUser(authDataResult: AuthDataResult, completion: @escaping (Result<Bool, Error>) -> ())    {
        guard let email = authDataResult.user.email else {
            return
        }
        db.collection(DatabaseService.usersCollection)
            .document(authDataResult.user.uid)
            .setData(["email" : email,
                      "createdDate": Timestamp(date: Date()),
                      "userId": authDataResult.user.uid]) { (error) in
                        
                        if let error = error {
                            completion(.failure(error))
                        } else {
                            completion(.success(true))
                        }
        }
    }
    
    func updateDatabaseUser(userExperience: String,
                            completion: @escaping (Result<Bool, Error>) -> ()) {
      guard let user = Auth.auth().currentUser else { return }
      db.collection(DatabaseService.usersCollection)
        .document(user.uid).updateData(["userExperience": userExperience]) { (error) in
              if let error = error {
                completion(.failure(error))
              } else {
                completion(.success(true))
                }
        }
    }
        
    func getUserExperienceForUser(completion: @escaping (Result<String, Error>) -> ()) {
        guard let user = Auth.auth().currentUser else {return}
        db.collection(DatabaseService.usersCollection).document(user.uid).getDocument { (snapshot, error) in
            if let error = error    {
                completion(.failure(error))
            }
            
            else if let snapshot = snapshot {
                let userExperienceStored = snapshot.get("userExperience") as? String
                completion(.success(userExperienceStored ?? ""))
            }
        }
    }
}
