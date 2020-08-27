//
//  SettingsViewController.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/24/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    let authSession = AuthSession()
    let settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        settingsView.signOutButton.addTarget(self, action: #selector(signOutButtonPressed), for: .touchUpInside)
    }
    
    @objc private func signOutButtonPressed() {
        authSession.signOutCurrentUser()
        UIViewController.showVC(viewcontroller: LoginViewController())
    }
}
