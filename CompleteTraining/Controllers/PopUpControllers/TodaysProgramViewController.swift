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
        
        view.backgroundColor = .red
        view.addSubview(pop)
        
       
    }
    
    
    
}
