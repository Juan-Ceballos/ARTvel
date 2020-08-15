//
//  AuthSession.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/14/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthSession {
    func createNewUser(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> ())    {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
                completion(.failure(error))
            } else if let authDataResult = authDataResult {
                completion(.success(authDataResult))
            }
        }
    }
    
    public func signExistingUser(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> ()) {
      Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
        if let error = error {
          completion(.failure(error))
        }
        else if let authDataResult = authDataResult {
          completion(.success(authDataResult))
        }
      }
    }
    
    public func signOutCurrentUser()    {
        do  {
            try Auth.auth().signOut()
        }
        catch   {
            print(error.localizedDescription)
        }
    }
    
}
