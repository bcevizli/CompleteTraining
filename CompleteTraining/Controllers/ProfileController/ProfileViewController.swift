//
//  ProfileViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

final class ProfileViewController: UIViewController, ProfileListViewDelegate {
    
    private let profileListView = ProfileListView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Profile"
        setUpView()
        addSearchButton()
        
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc
    private func didTapSearch() {
        print("search")
    }
    
    private func setUpView() {
        profileListView.delegate = self
        view.addSubview(profileListView)
        NSLayoutConstraint.activate([profileListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     profileListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                                     profileListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                                     profileListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
        
    }
    // MARK: - RMCharacterListViewDelegate
    func listView() {
        
        let controller = TrainingProgramViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    func listView1() {
        let controller = TransformationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func listView2() {
        let controller = LiftingProgressViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func listView3() {
        let controller = ChallengeViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func listView4() {
        let controller = NotesViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    func listView5() {
        let controller = SettingsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
