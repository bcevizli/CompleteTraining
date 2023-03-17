//
//  StandaloneNotesViewController.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 17.03.2023.
//

import Foundation
import UIKit

struct Note {
    let title: String
    let text: String
}

class StandaloneNotesViewController: UITableViewController {
    
    var notes: [Note] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Stand-alone Notes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NoteCell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.title
        return cell
    }
    @objc func addNote() {
        let vc = AddStandAloneNoteViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension StandaloneNotesViewController: AddStandAloneNoteViewControllerDelegate {
    func didSaveNoteWithTitle(title: String, text: String) {
        let note = Note(title: title, text: text)
        notes.append(note)
        tableView.reloadData()

        
    }
}
