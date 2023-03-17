//
//  NotesViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

class NotesViewController: UIViewController {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Notes"
        
        
        // Initialize table view
                tableView = UITableView(frame: self.view.bounds, style: .plain)
                tableView.delegate = self
                tableView.dataSource = self
                tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
                
                // Add table view to view hierarchy
                self.view.addSubview(tableView)
    }
    

}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            if indexPath.row == 0 {
                cell.textLabel?.text = "Training Notes"
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "Stand-alone Notes"
            }
            
            return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController: UIViewController?
           switch indexPath.row {
           case 0:
               viewController = TrainingNotesViewController()
           case 1:
               viewController = StandaloneNotesViewController()
           
           default:
               break
           }
           if let viewController = viewController {
               // Customize your view controller here, for example, set some properties or pass some data to it
               self.navigationController?.pushViewController(viewController, animated: true)
           }
    }
    
    
}
