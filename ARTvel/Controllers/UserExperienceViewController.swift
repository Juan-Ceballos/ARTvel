//
//  UserExperienceViewController.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/15/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit


class UserExperienceViewController: UIViewController {
    
    let userExperienceView = UserExperienceView()
    let db = DatabaseService()
    
    override func loadView() {
        view = userExperienceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        userExperienceView.experiencePickerView.dataSource = self
        userExperienceView.experiencePickerView.delegate = self
        userExperienceView.confirmButton.addTarget(self, action: #selector(experienceConfirmed), for: .touchUpInside)
        userExperienceView.cancelButton.addTarget(self, action: #selector(experienceCanceled), for: .touchUpInside)
    }
    
    @objc private func experienceConfirmed()  {
        print("experience confirmed")
        if userExperienceView.experiencePickerView.selectedRow(inComponent: 0) == 0 {
            //
            print("rijks")
        } else {
            //
            print("ticketmaster")
        }
        // put in function, instance of mainTab?
        UIViewController.showVC(viewcontroller: MainTabBarController())
    }
    
    @objc private func experienceCanceled() {
        // put in function, instance of loginview?
        UIViewController.showVC(viewcontroller: LoginViewController())
    }
}

extension UserExperienceViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
}

extension UserExperienceViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return "Rijksmuseum"
        } else {
            return "Ticketmaster"
        }
    }
}
