//
//  DueDateTableViewCell.swift
//  ToDoList
//
//  Created by shunnamiki on 2021/05/15.
//

import UIKit

class DueDateTableViewCell: UITableViewCell {
    
    var picker: UIDatePicker = {
        let picker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        picker.preferredDatePickerStyle = .compact
        return picker
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        picker.addTarget(self, action: #selector(onDidChanged), for: .editingDidEnd)
        contentView.addSubview(picker)
    }
    
    @objc func onDidChanged(){
        print("ON DID CHANGED", picker.date)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
