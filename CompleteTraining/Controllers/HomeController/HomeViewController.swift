//
//  HomeViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit
import CoreMotion

final class HomeViewController: UIViewController, HomeViewDelegate {
   
        let viewModel = HomeCollectionModel()
        
    private let homeView = HomeView()
        
    /// Provides to create an instance of the CMMotionActivityManager.
    private let activityManager = CMMotionActivityManager()
    /// Provides to create an instance of the CMPedometer.
    private let pedometer = CMPedometer()
    
    //    MARK: - Init
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(homeView)
    
        addConstraints()
        homeView.delegate = self
        
        
        startUpdates()
    }
    
    func startUpdates() {
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date()) { pedometerData, error in
                guard let pedometerData = pedometerData, error == nil else { return }
                
                DispatchQueue.main.async {
                    print("steps: \(pedometerData.numberOfSteps.intValue)")
                }
            }
        }
    }
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            homeView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    func listView() {
        print("selected hom")
    }
    
    
}



