//
//  SearchViewController.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/25/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import FirebaseAuth
class SearchViewController: UIViewController {
    
    let authSession = AuthSession()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        authSession.signOutCurrentUser()
    }
    
}
