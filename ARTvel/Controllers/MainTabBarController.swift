//
//  MainTabBarController.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/15/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainTabBarController: UIViewController {
    
    let auth = AuthSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}
