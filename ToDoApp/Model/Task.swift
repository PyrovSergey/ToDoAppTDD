//
//  Task.swift
//  ToDoApp
//
//  Created by Ivan Akulov on 07/10/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import Foundation

struct Task {
    let title: String
    let description: String?
    let date: Date
    let location: Location?
    
    init(title: String, description: String? = nil, date: Date? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        self.date = date ?? Date()
        self.location = location
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        guard lhs.title == rhs.title &&
            lhs.description == rhs.description && lhs.location == rhs.location else { return false }
        return true
    }
}
