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

    let authSession = AuthSession()
    let db = DatabaseService()
    let mainTabVC = MainTabBarController()
    let userExperienceVC = UserExperienceViewController()
    
    let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 51/255, green: 66/255, blue: 63/255, alpha: 1)
        loginView.passwordTextField.delegate = self
        loginView.usernameTextField.delegate = self
        loginView.loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        loginView.signedUpUserButton.addTarget(self, action: #selector(signedUpUserButtonPressed), for: .touchUpInside)
    }
    
    
    
    private func loginExistingUser(email: String, password: String) {
        authSession.signExistingUser(email: email, password: password) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success:
              DispatchQueue.main.async {
                self?.navigateToMainView()
              }
            }
          }
    }
    
    private func navigateToMainView()   {
        UIViewController.showVC(viewcontroller: mainTabVC)
    }
    
    private func navigateToUserExperience() {
        UIViewController.showVC(viewcontroller: userExperienceVC)
    }
    
    @objc func loginButtonPressed() {
        guard let email = loginView.usernameTextField.text,
            !email.isEmpty,
            let password = loginView.passwordTextField.text,
            !password.isEmpty
        else    {
            print("missing fields")
            return
        }
        
        loginExistingUser(email: email, password: password)
    }
    
    @objc func signedUpUserButtonPressed()  {
        
    }
    
    // sign in and create user
    // navigate to one of 2 views depending on already user or new
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {
            return false
        }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if textField == loginView.passwordTextField {
            return updatedText.count <= 18
        }
        else {
            return updatedText.count <= 36
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
