//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by shunnamiki on 2021/05/15.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    private let cellId = "ToDoCellIdentifier"
    var todos = [ToDo]()
    
    @objc func onInsert () {
        let vc = UpsertTableViewController()
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onInsert))
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        todos = {
            if let saveToDos = ToDo.loadToDos() {
                return saveToDos
            } else {
                return ToDo.loadSmapleTodos()
            }
        }()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
