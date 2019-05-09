//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Sergey on 06/05/2019.
//  Copyright © 2019 PyrovSergey. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    func configure(withTask task: Task, done: Bool = false) {
        
        if done {
            let attributedString = NSAttributedString(string: task.title, attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
            
            titleLabel.attributedText = attributedString
            dateLabel = nil
            locationLabel = nil
        } else {
            titleLabel.text = task.title
            dateLabel.text = formatDate(date: task.date)

            locationLabel.text = task.location?.name
        }
    }
    
    private func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: date)
    }
}
