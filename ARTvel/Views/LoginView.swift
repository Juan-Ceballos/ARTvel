//
//  LoginView.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/15/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    public var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "username"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    public var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.placeholder = "username"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    public var loginButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    public var appTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ARTvel"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupUsernameTextFieldConstraints()
    }
    
    private func setupUsernameTextFieldConstraints()    {
        addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
}
