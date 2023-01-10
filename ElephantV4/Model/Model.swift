import Foundation

class Model {
    var activeArray: [Placeholder] = []
    var inactiveArray: [Placeholder] = []
    var savedItems: [Item] = []
    var projectArray: [Project] = []
    var projectDictionary: [String: Project] = [:]
    var uniqueNumCounter: Int = 0
    
    var completeRate = 2
    var dailyRate = 0
    
    let calendar = Calendar.current
    
    let activeFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ActiveItems.plist")
    let inactiveFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("InactiveItems.plist")
    let saveFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("SavedItems.plist")
    let projectsFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Projects.plist")
    
    init() {
//        loadItems()
        
        
        

        activeArray =
        [
            Placeholder(title: "Wix Placeholder 1", timeDone: Date(), project: "Wix", indx: 1, status: "Active"),
            Placeholder(title: "Piano Placeholder 1", timeDone: Date(), project: "Piano", indx: 1, status: "Active"),
            Placeholder(title: "Wix Placeholder 2", timeDone: Date(), project: "Wix", indx: 2, status: "Active"),
            Placeholder(title: "None Placeholder 1", timeDone: Date(), project: "None", indx: 1, status: "Active"),
            Placeholder(title: "Piano Placeholder 2", timeDone: Date(), project: "Piano", indx: 2, status: "Active"),
            Placeholder(title: "Cleaning Placeholder 1", timeDone: Date(), project: "Cleaning", indx: 1, status: "Active"),
            Placeholder(title: "None Placeholder 2", timeDone: Date(), project: "None", indx: 2, status: "Active"),
            Placeholder(title: "Piano Placeholder 3", timeDone: Date(), project: "Piano", indx: 3, status: "Active"),
//            Placeholder(title: "None Placeholder 3", timeDone: Date(), project: "None", indx: 9, status: "Active")
        ]
        
        inactiveArray =
        [
            Placeholder(title: "Tenth Item", timeDone: Date(), project: "None", indx: 10, status: "Inact"),
            Placeholder(title: "Eleventh Item", timeDone: Date(), project: "None", indx: 11, status: "Inact"),
            Placeholder(title: "Twelveth Item", timeDone: Date(), project: "Piano", indx: 12, status: "Inact"),
            Placeholder(title: "Thirteenth Item", timeDone: Date(), project: "None", indx: 13, status: "Inact"),
            Placeholder(title: "Fourteenth Item", timeDone: Date(), project: "Piano", indx: 14, status: "Inact"),
            Placeholder(title: "Fifteenth Item", timeDone: Date(), project: "Piano", indx: 15, status: "Inact")
        ]
        
//        projectArray =
//        [
//
//            Project(name: "None", completed: false, priority: 100000, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: []),
//            Project(name: "Piano", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: []),
//            Project(name: "Cleaning", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: []),
//            Project(name: "Wix", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: [])
//        ]
        
        projectDictionary =
        [
            "None" : Project(name: "None", completed: false, priority: 100000, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: []),
            "Piano" : Project(name: "Piano", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: []),
            "Cleaning" : Project(name: "Cleaning", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: []),
            "Wix": Project(name: "Wix", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: [])
        ]
        
        let wixArray =
        [
            Item(title: "Work on website", project: "Wix", uniqueNum: 1, status: "Active"),
            Item(title: "Shopify work", project: "Wix", uniqueNum: 2, status: "Active"),
            Item(title: "Fix billing", project: "Wix", uniqueNum: 3, status: "Active")
        ]
        
        let pianoArray =
        [
            Item(title: "Practice Torrent", project: "Piano", uniqueNum: 1, status: "Active"),
            Item(title: "Record New Dawn", project: "Piano", uniqueNum: 2, status: "Active"),
//            Item(title: "Practice Hanon", project: "Piano", uniqueNum: 3, status: "Active")
        ]
        
        let cleaningArray =
        [
            Item(title: "Clean bathroom", project: "Cleaning", uniqueNum: 1, status: "Active"),
            Item(title: "Clean bedroom", project: "Cleaning", uniqueNum: 2, status: "Active"),
            Item(title: "Clean closet", project: "Cleaning", uniqueNum: 3, status: "Active")
        ]
        
        let noneArray =
        [
            Item(title: "Call mom", project: "None", uniqueNum: 1, status: "Active"),
            Item(title: "Surf internet", project: "None", uniqueNum: 2, status: "Active"),
            Item(title: "Buy groceries", project: "None", uniqueNum: 3, status: "Active")
        ]
        
        
        projectDictionary["Wix"]?.activeItems.append(contentsOf: wixArray)
        projectDictionary["Piano"]?.activeItems.append(contentsOf: pianoArray)
        projectDictionary["Cleaning"]?.activeItems.append(contentsOf: cleaningArray)
        projectDictionary["None"]?.activeItems.append(contentsOf: noneArray)
        
        
    }
    
    //MARK: - FILE MANAGEMENT FUNCTIONS
    
    
    func loadItems() {
        if let data = try? Data(contentsOf: activeFilePath!) {
            let decoder = PropertyListDecoder()
            do{
                activeArray = try decoder.decode([Placeholder].self, from: data)
            } catch {
                print("error decoding")
            }
        }
        
        if let data = try? Data(contentsOf: inactiveFilePath!) {
            let decoder = PropertyListDecoder()
            do{
                inactiveArray = try decoder.decode([Placeholder].self, from: data)
            } catch {
                print("error decoding")
            }
        }
        
        if let data = try? Data(contentsOf: saveFilePath!) {
            let decoder = PropertyListDecoder()
            do{
                savedItems = try decoder.decode([Item].self, from: data)
            } catch {
                print("error decoding")
            }
        }
        
        if let data = try? Data(contentsOf: projectsFilePath!) {
            let decoder = PropertyListDecoder()
            do{
                projectArray = try decoder.decode([Project].self, from: data)
            } catch {
                print("error decoding")
            }
        }
        
        if activeArray.count == 0 {
//            let newItem = Item(title: "Placeholder", timeDone: Date(), project: "None", uniqueNum: uniqueNumCounter, status: "None")
            let newItem = Placeholder(title: "Placeholder", project: "None", indx: uniqueNumCounter, status: "Active")
            uniqueNumCounter += 1
            activeArray.append(newItem)
        } else {
            saveItems()
        }
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(activeArray)
            try data.write(to: activeFilePath!)
        } catch {
            print("error encoding item array")
        }
        
        do{
            let data = try encoder.encode(inactiveArray)
            try data.write(to: inactiveFilePath!)
        } catch {
            print("error encoding item array")
        }

        do{
            let data = try encoder.encode(savedItems)
            try data.write(to: saveFilePath!)
        } catch {
            print("error encoding item array")
        }
        
        do{
            let data = try encoder.encode(projectArray)
            try data.write(to: projectsFilePath!)
        } catch {
            print("error encoding item array")
        }
        
        print("items saved")
        
    }
    
    
}
