//
//  AddStandaloneNoteViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 17.03.2023.
//

import Foundation
import UIKit

protocol AddStandAloneNoteViewControllerDelegate: AnyObject {
    func didSaveNoteWithTitle(title: String, text: String)
}

class AddStandAloneNoteViewController: UIViewController {
    
    weak var delegate: AddStandAloneNoteViewControllerDelegate?
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Note"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNote))
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(titleTextField)
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titleTextField.heightAnchor.constraint(equalToConstant: 40),
            
            textView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func saveNote() {
        guard let title = titleTextField.text, let text = textView.text else { return }
        delegate?.didSaveNoteWithTitle(title: title, text: text)
        navigationController?.popViewController(animated: true)
    }
}
