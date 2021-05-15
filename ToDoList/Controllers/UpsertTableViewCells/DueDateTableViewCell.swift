//
//  DueDateTableViewCell.swift
//  ToDoList
//
//  Created by shunnamiki on 2021/05/15.
//

import UIKit

class DueDateTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        var picker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        picker.preferredDatePickerStyle = .compact
        contentView.addSubview(picker)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
