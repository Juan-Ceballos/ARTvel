//
//  UserExperienceViewController.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/15/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

// save user experience
// firebase, user defaults, core data
// save a string experience 1/2
// access it to get experience

let userExperienceView = UserExperienceView()

class UserExperienceViewController: UIViewController {
    
    override func loadView() {
        view = userExperienceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        userExperienceView.experiencePickerView.dataSource = self
        userExperienceView.experiencePickerView.delegate = self
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
// picker to select experience
// button to lock it in
