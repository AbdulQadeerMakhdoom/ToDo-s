//
//  ViewController.swift
//  ToDo's
//
//  Created by Abdul Qadeer on 27/09/2019.
//  Copyright © 2019 Abdul Qadeer. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    let itemArray = ["Bat", "Ball", "Tape"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // DataSource method
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDos", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    
    // This is Delegate Methode
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print (itemArray [indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
           
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            }
            
        else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
   
}

