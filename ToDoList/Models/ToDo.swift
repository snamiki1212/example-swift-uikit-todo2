//
//  ToDo.swift
//  ToDoList
//
//  Created by shunnamiki on 2021/05/15.
//

import Foundation

struct ToDo: Equatable, Codable {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func saveToDos(_ todos: [ToDo]) {
        let plistEncoder = PropertyListEncoder()
        let codedToDos = try? plistEncoder.encode(todos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func loadSmapleTodos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        return [todo1, todo2, todo3]
    }
    
    static let documentDirectosry = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentDirectosry.appendingPathComponent("todos").appendingPathExtension("plist")
    
    
//    static let dueDateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        formatter.timeStyle = .short
//        return formatter
//    }()
}
