//
//  ViewController.swift
//  ToDo's
//
//  Created by Abdul Qadeer on 27/09/2019.
//  Copyright © 2019 Abdul Qadeer. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("items.plist")
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        loadItems()
    
    }
    
    

    // DataSource method
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDos", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    
    // This is Delegate Methode
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print (itemArray [indexPath.row])
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
   
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addItemPressesd(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New ToDo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
           self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            
            textField = alertTextField
           }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems() {
        
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to:dataFilePath!)
        }
        catch {
            print ("Eror encoding item array , \(error)")
            
        }
        self.tableView.reloadData()
        }
    func loadItems () {
        
        if let data = try? Data(contentsOf: dataFilePath!){
        let decoder = PropertyListDecoder()
            do {itemArray = try decoder.decode([Item].self, from: data)
            }
            catch{
                print ("Eror decoding item array , \(error)")
                
                
            }
            
        }
        
    }
    }
    


