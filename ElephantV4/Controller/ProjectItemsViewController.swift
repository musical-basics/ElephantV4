import UIKit

class ProjectItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var selectedProject: Project = Project(name: "", completed: false, priority: 0, type: "", itemCounter: 0, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: [], placeholderCounter: 0)
    var selectedObjective = Objective(name: "", cycle: false, completed: false, items: [], project: "")
    var selectedObjectiveIndex = 0
    
    @IBOutlet weak var projItemsTable: UITableView!
    
    
    
    @IBOutlet weak var selectedProjectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedProjectLabel.text = selectedProject.name
        
//        selectedObjective = Objective(name: "", cycle: false, completed: false, items: [], project: "")
        
        projItemsTable.delegate = self
        projItemsTable.dataSource = self
        
        projItemsTable.register(UINib(nibName: "ObjectiveCell", bundle: nil), forCellReuseIdentifier: "ObjectiveIdentifier")
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        selectedProjectLabel.text = selectedProject
//
//    }
    
    
    @IBAction func addObjectiveToProject(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Objective To Project", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Objective", style: .default) { (action) in
            
            var project = model.projectDictionary[self.selectedProject.name]
            let currentCount = project?.objectiveCounter
            
            let newObjectiveText = textField.text!
            let newObjectiveToAdd = Objective(name: newObjectiveText, cycle: true, completed: false, items: [], project: self.selectedProject.name)
            
            project?.objectiveList.append(newObjectiveToAdd)
            
            model.projectDictionary[self.selectedProject.name] = project
            model.saveItems()
            self.projItemsTable.reloadData()
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
    
    
    
    
    
    
//MARK: - TABLE VIEW METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let objectiveListCount = model.projectDictionary[selectedProject.name]?.objectiveList.count
        return objectiveListCount!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = projItemsTable.dequeueReusableCell(withIdentifier: "ObjectiveIdentifier", for: indexPath) as! ObjectiveCell
        
        
//        let newList = model.projectDictionary[selectedProject.name]?.objectiveList
        
        
//        let projLookup = model.activeArray[indexPath.row].project
//        let numIndex = model.activeArray[indexPath.row].indx - 1
//
        var objectiveShown = ""
//        if let currentItem = model.projectDictionary[projLookup]?.activeItems[safe: numIndex] {
//            itemShown = currentItem.title
//        } else {
//            itemShown = model.activeArray[indexPath.row].title
//        }

        
        cell.titleLabel.text = "Objective: \(objectiveShown)"
        
        
        if let currentObjective = model.projectDictionary[selectedProject.name]?.objectiveList[safe: indexPath.row] {
            
            objectiveShown = currentObjective.name

            if let item1 = currentObjective.items[safe: 0] {
                cell.item1Label.text = item1.title
                cell.item1Label?.numberOfLines = 0;
                cell.item1Label?.lineBreakMode = .byWordWrapping;
                cell.item1Label?.textColor = returnColor(item: item1)
            } else {
                cell.item1Label.text = ""
                cell.item1Label?.numberOfLines = 0;
                cell.item1Label?.lineBreakMode = .byWordWrapping;
                cell.item1Label?.textColor = UIColor.black
            }
            
            if let item2 = currentObjective.items[safe: 1] {
                cell.item2Label.text = item2.title
                cell.item2Label?.numberOfLines = 0;
                cell.item2Label?.lineBreakMode = .byWordWrapping;
                cell.item2Label?.textColor = returnColor(item: item2)
            } else {
                cell.item2Label.text = ""
                cell.item2Label?.numberOfLines = 0;
                cell.item2Label?.lineBreakMode = .byWordWrapping;
                cell.item2Label?.textColor = UIColor.black
            }
            
            if let item3 = currentObjective.items[safe: 2] {
                cell.item3Label.text = item3.title
                cell.item3Label?.numberOfLines = 0;
                cell.item3Label?.lineBreakMode = .byWordWrapping;
                cell.item3Label?.textColor = returnColor(item: item3)
            } else {
                cell.item3Label.text = ""
                cell.item3Label?.numberOfLines = 0;
                cell.item3Label?.lineBreakMode = .byWordWrapping;
                cell.item3Label?.textColor = UIColor.black
            }
            
            if let item4 = currentObjective.items[safe: 3] {
                cell.item4Label.text = item4.title
                cell.item4Label?.numberOfLines = 0;
                cell.item4Label?.lineBreakMode = .byWordWrapping;
                cell.item4Label?.textColor = returnColor(item: item4)
            } else {
                cell.item4Label.text = ""
                cell.item4Label?.numberOfLines = 0;
                cell.item4Label?.lineBreakMode = .byWordWrapping;
                cell.item4Label?.textColor = UIColor.black
            }
        } else {
            objectiveShown = ""
        }
            
            
            
            
//
//            var tempCounter = 0
//            for itm in currentObjective.items {
//
//            }
//            for indx in itemsToShow {
//                if let itemShown = currentObjective.items[safe: tempCounter] {
//                    itemsToShow.append(currentObjective.items[tempCounter])
//                } else {
//                    itemsToShow[tempCounter] = ""
//                }
//                tempCounter += 1
//            }
            
        

        
        
        
        
        
        return cell
    }
    
    func returnColor(item: Item) -> UIColor {
        let statusOfItem = item.status
        var colorToReturn = UIColor.black
        switch statusOfItem {
        case "Active":
            colorToReturn = UIColor.black
        case "Inact":
            colorToReturn = UIColor.red
        case "Done":
            colorToReturn = UIColor.green
        default:
            colorToReturn = UIColor.black
        }
        
        return colorToReturn
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        var selectedObjective = model.projectDictionary[self.selectedProject]?.objectiveList[safe: indexPath.row]
//
//
//
//
//
//        var textField = UITextField()
//        var textField2 = UITextField()
//        let alert = UIAlertController(title: "Edit Objective", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Edit Objective", style: .default) { (action) in
//            selectedObjective!.name = textField.text!
//            selectedObjective!.items[0].title = textField2.text!
//            model.projectDictionary[self.selectedProject]?.objectiveList[indexPath.row] = selectedObjective!
//            model.saveItems()
//            self.projItemsTable.reloadData()
//        }
//
//        alert.addAction(action)
//
//        alert.addTextField { (alertTextField) in
//            alertTextField.placeholder = model.projectDictionary[self.selectedProject]?.objectiveList[indexPath.row].name
//            alertTextField.text = model.projectDictionary[self.selectedProject]?.objectiveList[indexPath.row].name
//            textField = alertTextField
//        }
//
//
//
//        alert.addTextField { (alertTextField) in
//            if var item1 = selectedObjective!.items[safe: 0] {
//                alertTextField.text = selectedObjective!.items[0].title
//                textField2 = alertTextField
//            }
//
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {(_ action: UIAlertAction) -> Void in
//            print("Cancelled")
//        })
//        alert.addAction(cancelAction)
//
//        present(alert, animated: true, completion: nil)
//
//
//
        
        
        selectedObjective = (model.projectDictionary[self.selectedProject.name]?.objectiveList[indexPath.row])!
        selectedObjectiveIndex = indexPath.row
        
        performSegue(withIdentifier: "ShowObjectiveItems", sender: nil)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowObjectiveItems") {
            let viewController = segue.destination as? ObjectiveEditViewController
            viewController?.selectedObjName = selectedObjective.name
            viewController?.selectedObjIndex = selectedObjectiveIndex
            viewController?.selectedObj = selectedObjective
        }
    }

}
