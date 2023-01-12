
import UIKit

class ProjectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var projectsTableView: UITableView!
//    var selectedProject: String = ""
    var keysArray = Array(model.projectDictionary.keys)
    
    var selectedProject = Project(name: "", completed: false, priority: 0, type: "", itemCounter: 0, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: [])
    var selectedProjectIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        projectsTableView.delegate = self
        projectsTableView.dataSource = self
        
        
    }
    
    
    
    
    
    @IBAction func addProjectPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        var textField2 = UITextField()
        let alert = UIAlertController(title: "Add Project", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Project", style: .default) { (action) in

            var projectName = textField.text!
            var projectPriority = textField2.text!
            var newProject = Project(name: projectName, completed: false, priority: Int(projectPriority)!, type: "Spiral", itemCounter: 0, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: [])


            
            model.projectDictionary[newProject.name] = newProject
            
//            model.priorityDeclaration(project: newProject)
            model.addProject(project: newProject)
            
            model.saveItems()
            self.projectsTableView.reloadData()
        }

        alert.addAction(action)

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Project Name"
            textField = alertTextField
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Priority"
            textField2 = alertTextField
        }


        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            print("Cancelled")
        })
        alert.addAction(cancelAction)

        present(alert, animated: true, completion: nil)


        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keysArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = projectsTableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath)
        
        if let project = keysArray[safe: indexPath.row] {
            cell.textLabel?.text = project
        } else {
            cell.textLabel?.text = ""
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let currentSelect = keysArray[safe: indexPath.row] {
            selectedProject = model.projectDictionary[currentSelect]!
            selectedProjectIndex = indexPath.row
        }
        
        performSegue(withIdentifier: "showProjectItemList", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let projSelected = selectedProject
        
        
        
        if (segue.identifier == "showProjectItemList") {
            let viewController = segue.destination as? ProjectItemsViewController
            viewController?.selectedProject = projSelected
        }
        
        
    }
    

}
