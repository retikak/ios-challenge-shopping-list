//
//  TaskCustomTableViewCell.swift
//  ShoppingList
//
//  Created by Retika Kumar on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskCustomTableViewCell: UITableViewCell {
    
    
    var delegate: TaskCustomTableViewCellDelegate?
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var taskDoneButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func taskDoneButtonTapped(sender: UIButton) {
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
        updateButton(true)
    }
    
    func updateButton(isComplete: Bool) {
        
        if isComplete {
            taskDoneButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            taskDoneButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
    func updateWithTask(task: Task) {
        
        taskLabel.text = task.name
        updateButton(task.isComplete.boolValue)
    }

}

protocol TaskCustomTableViewCellDelegate {
    
    func buttonCellButtonTapped(sender: TaskCustomTableViewCell)
}


    
    


        
        

    