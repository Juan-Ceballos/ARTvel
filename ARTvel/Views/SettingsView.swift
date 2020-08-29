//
//  SettingsView.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/25/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import SnapKit

class SettingsView: UIView {
     
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var currentExperienceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var signOutButton: UIButton = {
        let button = UIButton(type: .system)
        return button
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
        setupSignOutButtonConstraints()
    }
    
    private func setupSignOutButtonConstraints()    {
        addSubview(signOutButton)
        signOutButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
}
