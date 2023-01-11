//
//  ObjectiveEditViewController.swift
//  ElephantV4
//
//  Created by Lionel Yu on 1/10/23.
//

import UIKit

class ObjectiveEditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var selectedObjName: String = ""
    var selectedObjIndex: Int = 0
    
    var selectedObj: Objective = Objective(name: "", cycle: false, completed: false, items: [], project: "")
        
    @IBOutlet weak var objectiveTableView: UITableView!
    
    @IBOutlet weak var objectiveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectiveTableView.delegate = self
        objectiveTableView.dataSource = self
        
//        objectiveTableView.register(UINib(nibName: "ObjectiveItemCell", bundle: nil), forCellReuseIdentifier: "ItemReusableCell")
        
        objectiveLabel.text = selectedObjName
        
        print(selectedObj.items)
        print(selectedObj.items.count)
     
        self.objectiveTableView.reloadData()
    }
    

    @IBAction func addItemToObjective(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Item To Objective", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let project = model.projectDictionary[self.selectedObj.project]
            let currentCount = project?.itemCounter
            
            let newItemText = textField.text!
            let newItemToAdd = Item(title: newItemText, project: self.selectedObj.project, objective: self.selectedObj.name, uniqueNum: currentCount!, status: "Inactive")
            
            self.selectedObj.items.append(newItemToAdd)
            
            model.projectDictionary[self.selectedObj.project]?.objectiveList[self.selectedObjIndex] = self.selectedObj
            model.saveItems()
            self.objectiveTableView.reloadData()
        }
        
        alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Text for Item"
            textField = alertTextField
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            print("Cancelled")
        })
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedObj.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = objectiveTableView.dequeueReusableCell(withIdentifier: "FUCKYOU", for: indexPath)
        
//        cell.itemLabel?.text = "HELLO"
//        cell.itemLabel?.numberOfLines = 0;
//        cell.itemLabel?.lineBreakMode = .byWordWrapping;
//
//
        
        cell.textLabel?.text = selectedObj.items[indexPath.row].title
        
//        cell.textLabel?.text = "hello"
        if selectedObj.items[indexPath.row].status == "Active" {
            cell.textLabel?.textColor = UIColor.black
        } else {
            cell.textLabel?.textColor = UIColor.red
        }
        return cell

    }

}
