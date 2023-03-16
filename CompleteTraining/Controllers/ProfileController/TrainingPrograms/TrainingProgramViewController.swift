//
//  TrainingProgramViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

class TrainingProgramViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let tableView = UITableView()
    private let size: CGFloat = 400
    let programList: [String] = ["My Program", "Mobility", "Lifting", "Stretching", "Personal Information"]
    let programImages = [UIImage(named: "myProgram"), UIImage(named: "mobility"), UIImage(named: "lifting"), UIImage(named: "stretching"), UIImage(named: "personalInformation")]
    let cellReuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Training Programs"
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
          
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.rowHeight = 130.0
        tableView.separatorColor = .gray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.center = view.center
    }
    
    @objc func didTapAdd() {
        print("add tapped")
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
        var viewController: UIViewController?
           switch indexPath.row {
           case 0:
               viewController = MyProgramViewController()
           case 1:
               viewController = MobilityViewController()
           case 2:
               viewController = LiftingViewController()
           case 3:
               viewController = StretchingViewController()
           case 4:
               viewController = PersonalInformationViewController()
           default:
               break
           }
           if let viewController = viewController {
               // Customize your view controller here, for example, set some properties or pass some data to it
               self.navigationController?.pushViewController(viewController, animated: true)
           }
    }
       
    

   

}

