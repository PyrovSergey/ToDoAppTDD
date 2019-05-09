//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Sergey on 03/05/2019.
//  Copyright © 2019 PyrovSergey. All rights reserved.
//

import Foundation

class TaskManager {
    
    var taskCount: Int {
        return tasks.count
    }
    
    var doneTaskCount: Int {
        return doneTasks.count
    }
    
    private var tasks = [Task]()
    private var doneTasks = [Task]()
    
    func add(task: Task) {
        if !tasks.contains(task) {
            tasks.append(task)
        }
    }
    
    func task(at index: Int) -> Task {
        return tasks[index]
    }
    
    func checkTask(at index: Int) {
        doneTasks.append(tasks.remove(at: index))
    }
    
    func uncheckTask(at index: Int) {
        tasks.append(doneTasks.remove(at: index))
    }
    
    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }
    
    func removeAll() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
}
