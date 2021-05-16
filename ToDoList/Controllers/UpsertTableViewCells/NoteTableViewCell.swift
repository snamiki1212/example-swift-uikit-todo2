//
//  NoteTableViewCell.swift
//  ToDoList
//
//  Created by shunnamiki on 2021/05/15.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let field = UITextField()
        contentView.addSubview(field)
        field.translatesAutoresizingMaskIntoConstraints = false
        field.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        field.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        field.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        field.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        contentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
