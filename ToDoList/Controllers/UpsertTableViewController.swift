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
    var saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(onSave))
    var cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onCancel))
    
    func updateSaveButtonState(){
        // TODO: should delegate
        let shouldEnableSaveButton = basicInformationCell.field.text?.isEmpty == false
        saveBarButton.isEnabled = shouldEnableSaveButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = saveBarButton
        navigationItem.leftBarButtonItem = cancelBarButton
        updateSaveButtonState()
        
        // TODO: should degelate
//        updateDueDate(date: dueDateCell.picker)
        
        // TODO: should delegate
        basicInformationCell.field.addTarget(self, action: #selector(onTitleEditingChanged(_:)), for: .editingChanged)
    }
    
//    func updateDueDate(date: UIDatePicker){
//        print("updateDueDate")
//    }
    
    @objc private func onTitleEditingChanged(_ sender: UITextField){
        updateSaveButtonState()
    }
    
    @objc private func onSave(){
        print("ON SAVE")
    }
    
    @objc private func onCancel(){
        print("ON CANCEL")
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
