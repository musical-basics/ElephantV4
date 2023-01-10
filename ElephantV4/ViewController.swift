import UIKit

let model = Model()

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var completeRateLabel: UILabel!
    @IBOutlet weak var totalTasksLabel: UILabel!
    @IBOutlet weak var dailyRateLabel: UILabel!
    
    @IBOutlet weak var itemTableView: UITableView!
    
//    var currentSelection: Item = Item(title: "Placeholder", timeDone: Date(), project: "None", uniqueNum: 0, status: "Active")
    var currentSelection: Placeholder = Placeholder(title: "Placeholder", project: "None", uniqueNum: 0)
    var currentIndx = 0
    var numItemsShown = 1
    var timer = Timer()
    var (hours, minutes, seconds) = (0, 0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        currentSelection = model.activeArray[0]
        itemTableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        timeLabel.numberOfLines = 0;
        timeLabel.lineBreakMode = .byWordWrapping;
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numItemsShown
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ItemCell
        cell.titleLabel.text = model.activeArray[indexPath.row].title
        cell.titleLabel?.numberOfLines = 0;
        cell.titleLabel?.lineBreakMode = .byWordWrapping;

        cell.projLabel.text = model.activeArray[indexPath.row].project
        cell.projLabel?.numberOfLines = 0;
        cell.projLabel?.lineBreakMode = .byWordWrapping;

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentSelection = model.activeArray[indexPath.row]
        currentIndx = indexPath.row
    }
    
    

    
//MARK: - TIMER STACK
    
    @IBAction func startTimerButton(_ sender: UIButton) {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.keepTimer), userInfo: nil, repeats: true)
        startButtonOutlet.isHidden = true
    }
    
    @IBAction func pauseTimerButton(_ sender: UIButton) {
        timer.invalidate()
        startButtonOutlet.isHidden = false
    }
    
    @objc func keepTimer() {
        seconds += 1
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        if minutes == 60 {
            hours += 1
            minutes = 0
        }
        
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        let hoursString = hours > 9 ? "\(hours)" : "0\(hours)"
        
        timeLabel.text = "Time Spent: \(hoursString):\(minutesString):\(secondsString)"
    }
    
    

}

