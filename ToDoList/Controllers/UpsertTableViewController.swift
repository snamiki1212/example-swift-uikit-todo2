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
    ]
    
    var basicInformationCell = TitleTableViewCell()
    var dueDateCell = DueDateTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            fatalError("INVALID ERROR")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return sections[0]
        case 1:
            return sections[1]
        default:
            fatalError("INVALID DATA")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath {
        case [0, 0]:
            print("OK")
            return basicInformationCell
        case [1, 0]:
            return dueDateCell
        default:
            fatalError("INVALID DATA")
        }
    }

}
