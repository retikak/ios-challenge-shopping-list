//
//  Task.swift
//  ShoppingList
//
//  Created by Retika Kumar on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {
    convenience init?(name:String, isComplete:Bool, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        guard let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context) else {return nil}
        
        self.init(entity:entity, insertIntoManagedObjectContext: context)
        self.name = name
        self.isComplete = isComplete
    }


}
