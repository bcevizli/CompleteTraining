//
//  TodaysProgramViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 25.03.2023.
//

import UIKit

final class TodaysProgramPopUpViewController: UIViewController {
    
    let pop = TodaysProgramPopUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        view.addSubview(pop)
        
        
    }
    
    @objc func handleTap() {
        dismiss(animated: true, completion: nil)
    }
    
}
