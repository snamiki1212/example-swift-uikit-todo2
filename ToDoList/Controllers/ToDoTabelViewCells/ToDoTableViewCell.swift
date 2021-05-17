//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by shunnamiki on 2021/05/16.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    var checkIcon: UIButton = {
        var item = UIButton()
        item.setContentHuggingPriority(.required, for: .horizontal)
        return item
    }()
    var text = UILabel()
    
    var isCompleted = false
    
    func updateCheckIcon(){
        checkIcon.setTitle(isCompleted ? "✅" : "☑️", for: .normal)
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let hStack = UIStackView(arrangedSubviews: [checkIcon, text])
        self.contentView.addSubview(hStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        

        updateCheckIcon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
