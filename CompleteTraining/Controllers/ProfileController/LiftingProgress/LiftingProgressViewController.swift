//
//  LiiftingProgressViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

class LiftingProgressViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let button = UIButton(frame: CGRect(x: 135, y: 120, width: 130, height: 50))
    
    var tableView: UITableView!
    
    var liftingRecords: [String] = ["1", "2", "3", "4", "5"]


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Lifting Progress"
        navigationController?.navigationBar.prefersLargeTitles = false
        
          button.backgroundColor = .systemBrown
          button.setTitle("Edit", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

          self.view.addSubview(button)
        
        // Set up the table view
               tableView = UITableView(frame: CGRect(x: 0, y: 200, width: view.bounds.width, height: view.bounds.height))
               tableView.dataSource = self
               tableView.delegate = self
               view.addSubview(tableView)

               // Register the cell class
               tableView.register(TwoLabelCell.self, forCellReuseIdentifier: "TwoLabelCell")

    }
    
    @objc func buttonAction(sender: UIButton!) {
        if (tableView.isEditing == true) {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    // Table view data source methods
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return liftingRecords.count // Replace with the number of rows you want
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "TwoLabelCell", for: indexPath) as! TwoLabelCell

           // Create the labels
           let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.width/2, height: cell.bounds.height))
           label1.text = "Label 1"
           cell.addSubview(label1)

           let label2 = UILabel(frame: CGRect(x: cell.bounds.width/2, y: 0, width: cell.bounds.width/2, height: cell.bounds.height))
           label2.text = liftingRecords[indexPath.row]
           cell.addSubview(label2)

           return cell
       }

       // Table view delegate methods
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 44 // Replace with the height you want for each row
       }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .insert
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            tableView.beginUpdates()
//            liftingRecords.insert("New Record", at: indexPath.row)
//            tableView.insertRows(at: [indexPath], with: .fade)
            
            let vc = UIAlertController(title: "Enter Value", message: nil, preferredStyle: .alert)
            vc.addTextField()
            
            let submitAction = UIAlertAction(title: "Submit", style: .default) { _ in
                
                let textObj = vc.textFields![0]

                self.liftingRecords.insert(textObj.text!, at: indexPath.row)
                self.tableView.insertRows(at: [indexPath], with: .fade)
                tableView.endUpdates()

            }
            vc.addAction(submitAction)
            present(vc, animated: true)
            
        }
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            liftingRecords.remove(at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .fade)
        }
    }
    
}

class TwoLabelCell: UITableViewCell {
    
    static let identifier = "TwoLabelCell"
    
    let leftLabel = UILabel()
    let rightLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Set up the left label
        contentView.addSubview(leftLabel)
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        leftLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        // Set up the right label
        contentView.addSubview(rightLabel)
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        rightLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
