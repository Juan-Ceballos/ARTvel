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
}
