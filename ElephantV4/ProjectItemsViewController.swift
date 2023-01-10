import UIKit

class ProjectItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var selectedProject: String = ""
    
    @IBOutlet weak var projItemsTable: UITableView!
    
    
    
    @IBOutlet weak var selectedProjectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedProjectLabel.text = selectedProject
        
        
        projItemsTable.delegate = self
        projItemsTable.dataSource = self
        
        projItemsTable.register(UINib(nibName: "ObjectiveCell", bundle: nil), forCellReuseIdentifier: "ObjectiveIdentifier")
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        selectedProjectLabel.text = selectedProject
//
//    }
    
    
    
//MARK: - TABLE VIEW METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = projItemsTable.dequeueReusableCell(withIdentifier: "ObjectiveIdentifier", for: indexPath) as! ObjectiveCell
        
        return cell
    }
    

}
