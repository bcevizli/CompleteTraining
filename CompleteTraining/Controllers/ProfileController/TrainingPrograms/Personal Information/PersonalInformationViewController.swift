//
//  PersonalInformationViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

class PersonalInformationViewController: UIViewController, UITextViewDelegate {

    // User profile properties
    var name: String?
    var age: Int?
    var height: Double?
    var weight: Double?

    // Outlets
    var nameField: UITextField!
    var ageField: UITextField!
    var heightField: UITextField!
    var weightField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create and configure name field
        nameField = UITextField(frame: CGRect(x: 20, y: 150, width: 200, height: 30))
        nameField.placeholder = "Enter your name"
        nameField.text = name
        view.addSubview(nameField)

        // Create and configure age field
        ageField = UITextField(frame: CGRect(x: 20, y: 200, width: 200, height: 30))
        ageField.placeholder = "Enter your age"
        ageField.keyboardType = .numberPad
        if let age = age {
            ageField.text = String(age)
        }
        view.addSubview(ageField)

        // Create and configure height field
        heightField = UITextField(frame: CGRect(x: 20, y: 250, width: 200, height: 30))
        heightField.placeholder = "Enter your height in cm"
        heightField.keyboardType = .decimalPad
        if let height = height {
            heightField.text = String(height)
        }
        view.addSubview(heightField)

        // Create and configure weight field
        weightField = UITextField(frame: CGRect(x: 20, y: 300, width: 200, height: 30))
        weightField.placeholder = "Enter your weight in kg"
        weightField.keyboardType = .decimalPad
        if let weight = weight {
            weightField.text = String(weight)
        }
        view.addSubview(weightField)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Update user profile properties with edited values
        name = nameField.text
        age = Int(ageField.text ?? "0")
        height = Double(heightField.text ?? "0")
        weight = Double(weightField.text ?? "0")
    }
    
}
