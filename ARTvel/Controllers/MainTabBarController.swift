//
//  MainTabBarController.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/15/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainTabBarController: UITabBarController {
    
    let authSession = AuthSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        viewControllers = [SettingsViewController()]
        //auth.signOutCurrentUser()
    }
}
