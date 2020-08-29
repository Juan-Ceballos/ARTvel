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
    
    private enum Section {
        case main
    }
    
    let authSession = AuthSession()
    let searchView = SearchView()
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    // custom del
    // instance passing
    // dependency injection
}
