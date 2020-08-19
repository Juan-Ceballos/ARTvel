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
    
    //let bottomLine = CALayer()
    
    public var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.borderStyle = .none
        textField.textColor = .white
        let ca = CALayer()
        ca.frame = CGRect(x: 0, y: textField.frame.height + 22, width: UIScreen.main.bounds.size.width - 44, height: 10)
        ca.backgroundColor = UIColor(red: 166/255, green: 125/255, blue: 39/255, alpha: 0.5).cgColor
        ca.cornerRadius = ca.frame.size.width / 5
        textField.layer.addSublayer(ca)
        return textField
    }()
    
    public var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Password",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.borderStyle = .none
        textField.textColor = .white
        let ca = CALayer()
        ca.frame = CGRect(x: 0, y: textField.frame.height + 22, width: UIScreen.main.bounds.size.width - 44, height: 10)
        ca.backgroundColor = UIColor(red: 166/255, green: 125/255, blue: 39/255, alpha: 0.5).cgColor
        ca.cornerRadius = ca.frame.size.width / 5
        textField.layer.addSublayer(ca)
        return textField
    }()
    
    public var loginButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Create My Account", for: .normal)
        //button.backgroundColor = .systemGray5
        return button
    }()
    
    public var appTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ARTvel"
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 33)
        label.textColor = UIColor(red: 166/255, green: 125/255, blue: 39/255, alpha: 1)
        //label.backgroundColor = UIColor(red: 166/255, green: 125/255, blue: 39/255, alpha: 0.5)
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
        setupAppTitleLabelConstraints()
        setupUsernameTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupLoginButtonConstraints()
    }
    
    private func setupAppTitleLabelConstraints()    {
        addSubview(appTitleLabel)
        appTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(44)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    private func setupUsernameTextFieldConstraints()    {
        addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-66)
            make.left.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(-22)
        }
    }
    
    private func setupPasswordTextFieldConstraints()    {
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameTextField.snp.bottom).offset(33)
            make.left.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(-22)
        }
    }
    
    private func setupLoginButtonConstraints()  {
        addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(33)
            make.left.equalToSuperview().offset(33)
            make.right.equalToSuperview().offset(-33)
        }
    }
    
}
