//
//  ViewController.swift
//  ToDOIt
//
//  Created by Eddie Chen on 2019-06-22.
//  Copyright © 2019 Eddie Chen. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    
    var itemArray = ["first", "second", "third"]
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let items = defaults.array(forKey: "saveArray") as? [String] {
            itemArray = items
        }
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    
    //table delegate method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    @IBAction func addItemPress(_ sender: Any) {
        var text1 = UITextField()
        let alert = UIAlertController(title: "Did you bring your towel?", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add an item", style: .default) { (UIAlertAction) in
            
            self.itemArray.append(text1.text!)
            self.defaults.set(self.itemArray, forKey: "saveArray")
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter your name"
           text1 = textField
            
        }
    
        alert.addAction(action)
        
        for i in itemArray {
            print(i)
        }
        
        self.present(alert, animated: true, completion: nil)
        

    }
    
    
    
    
    
    
    
}

