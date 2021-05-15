//
//  TitleTableViewCell.swift
//  ToDoList
//
//  Created by shunnamiki on 2021/05/15.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let checkIconLabel: UILabel = {
            let label = UILabel()
            label.text = "✅"
            label.setContentHuggingPriority(.required, for: .horizontal)
            return label
        }()
        
        let field: UITextField = {
            let field = UITextField()
            return field
        }()
        
        let hStack = UIStackView(arrangedSubviews: [checkIconLabel, field])
        self.contentView.addSubview(hStack)
        
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
