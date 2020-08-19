//
//  ViewController.swift
//  ARTvel
//
//  Created by Juan Ceballos on 7/29/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    let auth = AuthSession()
    
    let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 51/255, green: 66/255, blue: 63/255, alpha: 1)
    }
}
