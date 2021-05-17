//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by shunnamiki on 2021/05/15.
//

import UIKit

protocol UpsertTableViewControllerDelegate {
    func upsert(_ todo: ToDo)
    func doDismiss()
}

class ToDoTableViewController: UITableViewController {

    private let cellId = "ToDoCellIdentifier"
    var todos = [ToDo]()
    
    private func createUpsretPage() -> UINavigationController {
        let vc = UpsertTableViewController()
        vc.delegation = self
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }
    
    @objc func openInsertPage () {
        present(createUpsretPage(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openInsertPage))
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(createUpsretPage(), animated: true, completion: nil)
    }
}

extension ToDoTableViewController: UpsertTableViewControllerDelegate {
    func upsert(_ todo: ToDo){
        if let indexPath = tableView.indexPathForSelectedRow {
            update(todo, indexPath)
        } else {
            insert(todo)
        }
    }
    
    func doDismiss(){
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    internal func insert(_ todo: ToDo) {
        print("ON INSERT", todo)
        todos.append(todo)
        tableView.insertRows(at: [IndexPath(row: todos.count - 1, section: 0)], with: .automatic)
    }
    
    internal func update(_ todo: ToDo, _ indexPath: IndexPath) {
        todos[indexPath.row] = todo
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
