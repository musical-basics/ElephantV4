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
            Placeholder(title: "Piano Placeholder 4", timeDone: Date(), project: "Piano", indx: 12, status: "Inact"),
            Placeholder(title: "Thirteenth Item", timeDone: Date(), project: "None", indx: 13, status: "Inact"),
            Placeholder(title: "Piano Placeholder 5", timeDone: Date(), project: "Piano", indx: 14, status: "Inact"),
            Placeholder(title: "Piano Placeholder 6", timeDone: Date(), project: "Piano", indx: 15, status: "Inact")
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
            "None" : Project(name: "None", completed: false, priority: 100000, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: []),
            "Piano" : Project(name: "Piano", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: []),
            "Cleaning" : Project(name: "Cleaning", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: []),
            "Wix": Project(name: "Wix", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: [])
        ]
        
        let wixArray =
        [
            Item(title: "Work on website", project: "Wix", objective: "Old Website", uniqueNum: 1, status: "Active"),
            Item(title: "Shopify work", project: "Wix", objective: "Old Website", uniqueNum: 2, status: "Active"),
            Item(title: "Fix billing", project: "Wix", objective: "New Website", uniqueNum: 3, status: "Active")
        ]
        
        let pianoArray =
        [
            Item(title: "Practice new dawn", project: "Piano", objective: "Record New Dawn", uniqueNum: 1, status: "Active"),
            Item(title: "Record New Dawn", project: "Piano", objective: "Record New Dawn", uniqueNum: 2, status: "Active"),
            Item(title: "Practice HSLB", project: "Piano", objective: "Record HSLB", uniqueNum: 3, status: "Active"),
            Item(title: "Record HSLB", project: "Piano", objective: "Record HSLB", uniqueNum: 4, status: "Active")
        ]
        
        let cleaningArray =
        [
            Item(title: "Clean bathroom", project: "Cleaning", objective: "House Cleaning", uniqueNum: 1, status: "Active"),
            Item(title: "Clean bedroom", project: "Cleaning", objective: "House Cleaning", uniqueNum: 2, status: "Active"),
            Item(title: "Clean closet", project: "Cleaning", objective: "House Cleaning", uniqueNum: 3, status: "Active")
        ]
        
        let noneArray =
        [
            Item(title: "Call mom", project: "None", objective: "None", uniqueNum: 1, status: "Active")
//            Item(title: "Surf internet", project: "None", objective: "None", uniqueNum: 2, status: "Active"),
//            Item(title: "Buy groceries", project: "None", objective: "None", uniqueNum: 3, status: "Active")
        ]
        
        
        projectDictionary["Wix"]?.activeItems.append(contentsOf: wixArray)
        projectDictionary["Piano"]?.activeItems.append(contentsOf: pianoArray)
        projectDictionary["Cleaning"]?.activeItems.append(contentsOf: cleaningArray)
        projectDictionary["None"]?.activeItems.append(contentsOf: noneArray)
        
        
        let pianoObjective1 = Objective(name: "Finish New Dawn", cycle: true, completed: false, items: [pianoArray[0], pianoArray[1]], project: "Piano")
        let pianoObjective2 = Objective(name: "Finish HSLB", cycle: true, completed: false, items: [pianoArray[2], pianoArray[3]], project: "Piano")
        projectDictionary["Piano"]?.objectiveList.append(contentsOf: [pianoObjective1, pianoObjective2])
        
        let noneObjective1 = Objective(name: "None", cycle: false, completed: false, items: noneArray, project: "None")
        projectDictionary["None"]?.objectiveList.append(contentsOf: [noneObjective1])
        
        let wixObjective1 = Objective(name: "Transition Website", cycle: true, completed: false, items: wixArray, project: "Wix")
        projectDictionary["Wix"]?.objectiveList.append(contentsOf: [wixObjective1])
        
    }
    
    //MARK: - PLACEHOLDER MANAGEMENT
    
    func priorityDeclaration(project: Project) {
        var placeholderCounter = 0
        for _ in 1...project.priority {
            let newPlaceholder = Placeholder(title: "\(project.name) Placeholder", project: project.name, indx: placeholderCounter, status: "Active")
            placeholderCounter += 1
            activeArray.append(newPlaceholder)
        }
    }
    
//    func priorityChange(project: Project, newPriority: Int) {
//        var placeholderCounter = 0
//        if newPriority > project.priority {
//            let priorityDiff = newPriority - project.priority
//            for _ in 1...priorityDiff {
//                let newPlaceholder = Placeholder(title: "\(project.name) Placeholder", project: project.name, indx: placeholderCounter, status: "Inactive")
//                placeholderCounter += 1
//                inactiveArray.append(newPlaceholder)
//            }
//            project.priority = newPriority
//        } else {
//            project.priority = newPriority
//        }
//    }
    
//    func inactivateItems(counter: Int) {
//        var tempArray: [Placeholder] = []
//        for index in counter...activePlaceholders.count {
//            let newItem = activePlaceholders[index]
//            tempArray.append(newItem)
//            activePlaceholders.remove(at: index)
//        }
//        inactivePlaceholders.insert(contentsOf: tempArray, at: 0)
//    }
//}
    
    
    
    
    
    
    
    
    
    
    //MARK: - COMPLETE ITEM FUNCTIONS
    
    func activateNextItem() {
        
        for (projName, proj) in projectDictionary {
            let filteredActiveArray = activeArray.filter({ $0.project == projName})
            let filteredInactiveArray = inactiveArray.filter({ $0.project == projName})
            
            var indexHighest: Float = 0
            
            if filteredActiveArray.count == 0 {
                indexHighest = 0
            } else {
                let levelCheck = activeArray.firstIndex { $0.project == projName }
                indexHighest = Float(levelCheck!)
            }
            let level = (Float(activeArray.count) / Float(proj.priority)) * Float(filteredActiveArray.count)
            let finalLevel = Float(activeArray.count) - level
            
            if filteredActiveArray.count >= proj.priority || filteredInactiveArray.count == 0 || indexHighest >= finalLevel {
                print("Nothing was added for \(projName) with priority \(proj.priority)")
            } else {
                let currentIndex = inactiveArray.firstIndex { $0.indx == filteredInactiveArray[0].indx }
                inactiveArray[currentIndex!].status = "Active"
                let itemAdded = inactiveArray[currentIndex!]
                
                activeArray.append(itemAdded)
                inactiveArray.remove(at: currentIndex!)
                print("we added item \(itemAdded.title) from project \(projName) with priority \(proj.priority)")
            }
        }
        
        
        
        for indx in projectArray {
            print("hello")
            let filteredActiveArray = activeArray.filter({ $0.project == indx.name})
            let filteredInactiveArray = inactiveArray.filter({ $0.project == indx.name})
            
            var indexHighest: Float = 0
            
            if filteredActiveArray.count == 0 {
                indexHighest = 0
            } else {
                let levelCheck = activeArray.firstIndex { $0.project == indx.name }
                indexHighest = Float(levelCheck!)
            }
            
            let level = (Float(activeArray.count) / Float(indx.priority)) * Float(filteredActiveArray.count)
            let finalLevel = Float(activeArray.count) - level
            
            if filteredActiveArray.count >= indx.priority || filteredInactiveArray.count == 0 || indexHighest >= finalLevel {
                print("Nothing was added for \(indx.name) with priority \(indx.priority)")
            } else {
                let currentIndex = inactiveArray.firstIndex { $0.indx == filteredInactiveArray[0].indx }
                inactiveArray[currentIndex!].status = "Active"
                let itemAdded = inactiveArray[currentIndex!]
                activeArray.append(itemAdded)
                inactiveArray.remove(at: currentIndex!)
                print("we added item \(itemAdded.title) from project \(indx.name) with priority \(indx.priority)")
            }
            
        }
    }
    
    
    func completeItem(index: Int) {
        let currentIndex = activeArray.firstIndex { $0.indx == index }
        
        let currentProjectOfItem = activeArray[currentIndex!].project
        
        let projectType = projectDictionary[currentProjectOfItem]!.type
        
        
        if projectType == "Cycle" {
            activeArray[currentIndex!].status = "Inactive"
            inactiveArray.append(activeArray[currentIndex!])
        } else {
            print("none")
        }
        activeArray[currentIndex!].status = "Done"
        activeArray[currentIndex!].timeDone = Date()
//        savedItems.append(activeArray[currentIndex!])
        activeArray.remove(at: currentIndex!)

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
