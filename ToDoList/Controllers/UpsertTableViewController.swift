//
//  UpsertTableViewController.swift
//  ToDoList
//
//  Created by shunnamiki on 2021/05/15.
//

import UIKit

class UpsertTableViewController: UITableViewController {
    let sections = [
        "BASIC INFORMATION",
        nil,
        "NOTES",
    ]
    
    var basicInformationCell = TitleTableViewCell()
    var dueDateCell = DueDateTableViewCell()
    var noteCell = NoteTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            fatalError("INVALID ERROR")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard sections.count > section else { fatalError("Invalid Data") }
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath {
        case [0, 0]:
            return basicInformationCell
        case [1, 0]:
            return dueDateCell
        case [2, 0]:
            return noteCell
        default:
            fatalError("INVALID DATA")
        }
    }

}
