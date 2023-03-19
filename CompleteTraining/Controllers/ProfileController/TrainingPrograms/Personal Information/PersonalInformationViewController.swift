//
//  PersonalInformationViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

class PersonalInformationViewController: UIViewController, UITextFieldDelegate {
    
    let lbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 50, y: 100, width: 100, height: 30))
        lbl.text = "Label"
        return lbl
    }()
    
    let textF: UITextField = {
        let textF = UITextField(frame: CGRect(x: 50, y: 150, width: 100, height: 30))
        textF.borderStyle = .roundedRect
        textF.isHidden = true
        return textF
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Personal Information"
        
        textF.delegate = self
        
        view.addSubview(lbl)
        view.addSubview(textF)
        
        lbl.isUserInteractionEnabled = true
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(lblTapped))
        tapGesture.numberOfTapsRequired = 1
        lbl.addGestureRecognizer(tapGesture)
    }
    
    @objc func lblTapped() {
        lbl.isHidden = true
        textF.isHidden = false
        textF.text = "text here"
        
    }
    
    func textFieldShouldReturn(_ userText: UITextField) -> Bool {
        textF.resignFirstResponder()
        textF.isHidden = true
        lbl.isHidden = false
        lbl.text = textF.text

        return true
    }
    
    
}
