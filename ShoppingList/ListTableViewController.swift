//
//  ListTableViewController.swift
//  ListAndAlertCoreData
//
//  Created by Retika Kumar on 4/22/16.
//  Copyright © 2016 kumar.retika. All rights reserved.
//

import UIKit
//@objc(Task)

class ListTableViewController: UITableViewController {
    
    var task:Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(ListTableViewController.toAddItem))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem:.Trash, target: self, action: #selector(ListTableViewController.deleteAllTasks))
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    func toAddItem() {
        
        var field: UITextField?
        
        let alertController = UIAlertController(title: "Add a Grocery Item", message: "", preferredStyle: .Alert)
        let confirmAction = UIAlertAction(title: "Save", style: .Default) {(_)in
            //if let field = alertController.textFields![0] as? UITextField{
            
            if let  field = field,
                title = field.text{
                TaskController.sharedController.createTask(title, isComplete: false)
                
                //TaskController.sharedController.createTask(self.title!, isComplete:true)
                self.tableView.reloadData()
            }
            
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addTextFieldWithConfigurationHandler ({ (textfield) in
            textfield.placeholder = "enter grocery item here"
            textfield.background = UIImage(named: "check")
            field = textfield
        })
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    func deleteAllTasks(){
        // cant delete sections???
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    override func tableView( tableView : UITableView,  titleForHeaderInSection section: Int)->String {
        switch(section) {
        case 1:return "Less Urgent Groceries"
            
        default :return "Most Important Groceries"
            
        }
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var title = self.tableView(tableView, titleForHeaderInSection: section)
        if (title == "firstTitle") {
            return 40.0
        }
        return 20.0
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedController.tasks.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath) as! TaskCustomTableViewCell
        
        let task = TaskController.sharedController.inCompletedTask[indexPath.row]
        let taskName = task.valueForKey("name") as? String
        //cell.textLabel?.text = taskName
        cell.updateWithTask(task)
        cell.taskLabel.text = taskName
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let task = TaskController.sharedController.tasks[indexPath.row]
            TaskController.sharedController.deleteTask(task)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
}