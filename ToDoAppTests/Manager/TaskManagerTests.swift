//
//  TaskManagerTests.swift
//  ToDoAppTests
//
//  Created by Sergey on 03/05/2019.
//  Copyright © 2019 PyrovSergey. All rights reserved.
//

import XCTest
@testable import ToDoApp

class TaskManagerTests: XCTestCase {
    
    var sut: TaskManager!

    override func setUp() {
        sut = TaskManager()
    }

    override func tearDown() {
        sut = nil
    }

    func testInitTaskManagerWithZeroTasks() {
        XCTAssertEqual(sut.taskCount, 0)
    }
    
    func testInitTaskManagerWithZeroDoneTasks() {
        XCTAssertEqual(sut.doneTaskCount, 0)
    }
    
    func testAddTaskIncrementTasksCount() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        XCTAssertEqual(sut.taskCount, 1)
    }
    
    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        let resultTask = sut.task(at: 0)
        
        XCTAssertEqual(task.title, resultTask.title)
    }
    
    func testCheckTaskAtIndexChangesCounts() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.taskCount, 0)
        XCTAssertEqual(sut.doneTaskCount, 1)
    }
    
    func testCheckedTaskRemovedFromTask() {
        let task1 = Task(title: "One")
        let task2 = Task(title: "Two")
        sut.add(task: task1)
        sut.add(task: task2)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.task(at: 0), task2)
    }
    
    func testDoneTaskAtReturnsCheckedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        let returnedTask = sut.doneTask(at: 0)
        
        XCTAssertEqual(returnedTask, task)
    }
    
    func testRemoveAllResultsCountsBeZero() {
        let task1 = Task(title: "One")
        let task2 = Task(title: "Two")
        sut.add(task: task1)
        sut.add(task: task2)
        
        sut.checkTask(at: 0)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.taskCount, 0)
        XCTAssertEqual(sut.doneTaskCount, 0)
    }
    
    func testAddingSameObjectDoesNotIncrementCount() {
        sut.add(task: Task(title: "One"))
        sut.add(task: Task(title: "One"))
        
        XCTAssertTrue(sut.taskCount == 1)
    }

}
