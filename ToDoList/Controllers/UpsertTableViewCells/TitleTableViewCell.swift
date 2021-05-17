//
//  TitleTableViewCell.swift
//  ToDoList
//
//  Created by shunnamiki on 2021/05/15.
//

import UIKit

class TitleTableViewCell: UITableViewCell, UITextFieldDelegate {
    let checkIcon: UIButton = {
        let item = UIButton()
        item.setContentHuggingPriority(.required, for: .horizontal)
        return item
    }()
    
    private func updateCheckIcon(){
        checkIcon.setTitle(checkIcon.isSelected ? "✅" : "☑️", for: .normal)
    }
    
    @objc func onClickCheck(){
        checkIcon.isSelected.toggle()
        updateCheckIcon()
    }

    let field: UITextField = {
        let field = UITextField()
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // checkIcon
        updateCheckIcon()
        checkIcon.addTarget(self, action: #selector(onClickCheck), for: .touchUpInside)
        
        // hstack
        let hStack = UIStackView(arrangedSubviews: [checkIcon, field])
        self.contentView.addSubview(hStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        self.field.delegate = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
