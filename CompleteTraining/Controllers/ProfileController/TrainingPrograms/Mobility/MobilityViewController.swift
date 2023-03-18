//
//  MobilityViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit
import SafariServices

class MobilityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let tableView = UITableView()
    let programList: [String] = ["Spine", "Legs", "Shoulders", "Neck"]
    let programImages = [UIImage(named: "myProgram"), UIImage(named: "mobility"), UIImage(named: "lifting"), UIImage(named: "stretching"), UIImage(named: "personalInformation")]
    let cellReuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mobility"
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
          
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.rowHeight = 130.0
        tableView.separatorColor = .gray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.center = view.center
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.programList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        cell.imageView?.image = programImages[indexPath.row]
        
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        cell.imageView?.clipsToBounds = true


        let marginguide = cell.contentView.layoutMarginsGuide

            cell.imageView?.topAnchor.constraint(equalTo: marginguide.topAnchor).isActive = true
            cell.imageView?.leadingAnchor.constraint(equalTo: marginguide.leadingAnchor).isActive = true
            cell.imageView?.heightAnchor.constraint(equalToConstant: 120).isActive = true
            cell.imageView?.widthAnchor.constraint(equalToConstant: 120).isActive = true

            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.layer.cornerRadius = 5
        
        
        cell.textLabel?.text = programList[indexPath.row]
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        
        
        
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController: SFSafariViewController!
           switch indexPath.row {
           case 0:
               viewController = SFSafariViewController(url: URL(string: "https://www.instagram.com/")!)
           case 1:
               viewController = SFSafariViewController(url: URL(string: "https://www.instagram.com/")!)
           case 2:
               viewController = SFSafariViewController(url: URL(string: "https://www.instagram.com/")!)
           case 3:
               viewController = SFSafariViewController(url: URL(string: "https://www.instagram.com/")!)
           case 4:
               viewController = SFSafariViewController(url: URL(string: "https://www.instagram.com/")!)
           default:
               break
           }
           if let viewController = viewController {
               // Customize your view controller here, for example, set some properties or pass some data to it
               self.present(viewController, animated: true)
           }
    }
       
    

   

}

