//
//  TaskController.swift
//  ListAndAlertCoreData
//
//  Created by Retika Kumar on 4/22/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedController = TaskController()
    
    var tasks: [Task] {
        guard let tasks = retrieveAllTasks() else {return []}
        return tasks
    }
    var completedTask:[Task] {
        return tasks.filter({$0.isComplete.boolValue})
    }
    var inCompletedTask:[Task] {
        return tasks.filter({!($0.isComplete.boolValue)})
    }
    
    func createTask(name:String, isComplete:Bool) {
        let _ = Task(name: name, isComplete: isComplete)
        saveTask()
        
    }
    func retrieveAllTasks() -> [Task]? {
        let request = NSFetchRequest(entityName: "Task")
        let context = Stack.sharedStack.managedObjectContext
        var tasks: [Task] = []
        do {
            tasks = try context.executeFetchRequest(request) as! [Task]
            print("success")
        }
        catch {
            print("error retrieving task")
        }
        return tasks
        
        
    }
    
    func saveTask() {
        let context = Stack.sharedStack.managedObjectContext
        do{
            let _ = try context.save()
        }
        catch {
            print("error saving")
        }
        
    }
    
    func deleteTask(task:Task) {
        task.managedObjectContext?.deleteObject(task)
        saveTask()
        
        
        
    }
    
}