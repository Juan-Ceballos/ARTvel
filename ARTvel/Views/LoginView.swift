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
        textField.attributedPlaceholder = NSAttributedString(string: "username",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.borderStyle = .none
        let ca = CALayer()
        ca.frame = CGRect(x: 0, y: textField.frame.height + 22, width: UIScreen.main.bounds.size.width - 44, height: 1)
        ca.backgroundColor = UIColor(red: 166/255, green: 125/255, blue: 39/255, alpha: 1).cgColor
        textField.layer.addSublayer(ca)
        return textField
    }()
    
    public var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "password",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.borderStyle = .none
        let ca = CALayer()
        ca.frame = CGRect(x: 0, y: textField.frame.height + 22, width: UIScreen.main.bounds.size.width - 44, height: 1)
        ca.backgroundColor = UIColor(red: 166/255, green: 125/255, blue: 39/255, alpha: 1).cgColor
        textField.layer.addSublayer(ca)
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
        setupPasswordTextFieldConstraints()
    }
    
    private func setupUsernameTextFieldConstraints()    {
        addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(-22)
        }
    }
    
    private func setupPasswordTextFieldConstraints()    {
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameTextField.snp.bottom).offset(22)
            make.left.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(-22)
        }
    }
    
}
