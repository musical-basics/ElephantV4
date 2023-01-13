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
//            Placeholder(title: "Piano Placeholder 1", timeDone: Date(), project: "Piano", indx: 0, status: "Active"),
//            Placeholder(title: "Wix Placeholder 1", timeDone: Date(), project: "Wix", indx: 1, status: "Active"),
//            Placeholder(title: "Piano Placeholder 2", timeDone: Date(), project: "Piano", indx: 1, status: "Active"),
//            Placeholder(title: "Wix Placeholder 2", timeDone: Date(), project: "Wix", indx: 2, status: "Active"),
//            Placeholder(title: "Piano Placeholder 3", timeDone: Date(), project: "Piano", indx: 2, status: "Active"),
//            Placeholder(title: "Cleaning Placeholder 1", timeDone: Date(), project: "Cleaning", indx: 1, status: "Active"),
//            Placeholder(title: "None Placeholder 2", timeDone: Date(), project: "None", indx: 2, status: "Active"),
//            Placeholder(title: "Piano Placeholder 4", timeDone: Date(), project: "Piano", indx: 3, status: "Active"),
//            Placeholder(title: "None Placeholder 3", timeDone: Date(), project: "None", indx: 9, status: "Active"),
//            Placeholder(title: "Cleaning Placeholder 2", timeDone: Date(), project: "Cleaning", indx: 2, status: "Active"),
//            Placeholder(title: "Cleaning Placeholder 3", timeDone: Date(), project: "Cleaning", indx: 3, status: "Active")
        ]
        
        inactiveArray =
        [
//            Placeholder(title: "None Placeholder 3", timeDone: Date(), project: "None", indx: 3, status: "Inact"),
//            Placeholder(title: "None Placeholder 4", timeDone: Date(), project: "None", indx: 4, status: "Inact"),
//            Placeholder(title: "Piano Placeholder 4", timeDone: Date(), project: "Piano", indx: 4, status: "Inact"),
//            Placeholder(title: "None Placeholder 5", timeDone: Date(), project: "None", indx: 5, status: "Inact"),
//            Placeholder(title: "Piano Placeholder 5", timeDone: Date(), project: "Piano", indx: 5, status: "Inact"),
//            Placeholder(title: "Piano Placeholder 6", timeDone: Date(), project: "Piano", indx: 6, status: "Inact")
        ]
        
//        projectArray =
//        [
//
//            Project(name: "None", completed: false, priority: 100000, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: []),
//            Project(name: "Piano", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: []),
//            Project(name: "Cleaning", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], placeholderCounter: 0, activePlaceholders: [], inactivePlaceholders: []),
//            Project(name: "Wix", completed: false, priority: 3, type: "Project", itemCounter: 0, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: [])
//        ]
        
        var tempProjectDictionary =
        [
            "None" : Project(name: "None", completed: false, priority: 3, type: "Project", itemCounter: 3, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: [], placeholderCounter: 0),
            "Piano" : Project(name: "Piano", completed: false, priority: 3, type: "Project", itemCounter: 4, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: [], placeholderCounter: 0),
            "Cleaning" : Project(name: "Cleaning", completed: false, priority: 3, type: "Project", itemCounter: 3, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: [], placeholderCounter: 0),
            "Wix": Project(name: "Wix", completed: false, priority: 3, type: "Project", itemCounter: 3, activeItems: [], inactiveItems: [], objectiveCounter: 0, objectiveList: [], placeholderCounter: 0)
        ]
        
        let wixArray =
        [
            Item(title: "Work on website", project: "Wix", objective: "Old Website", uniqueNum: 0, status: "Active"),
            Item(title: "Shopify work", project: "Wix", objective: "Old Website", uniqueNum: 1, status: "Active"),
            Item(title: "Fix billing", project: "Wix", objective: "New Website", uniqueNum: 2, status: "Active")
        ]
        
        let pianoArray =
        [
            Item(title: "Practice new dawn", project: "Piano", objective: "Finish New Dawn", uniqueNum: 0, status: "Active"),
            Item(title: "Record New Dawn", project: "Piano", objective: "Finish New Dawn", uniqueNum: 1, status: "Active"),
            Item(title: "Practice HSLB", project: "Piano", objective: "Finish HSLB", uniqueNum: 2, status: "Active"),
            Item(title: "Record HSLB", project: "Piano", objective: "Finish HSLB", uniqueNum: 3, status: "Active")
        ]
        
        let cleaningArray =
        [
            Item(title: "Clean bathroom", project: "Cleaning", objective: "House Cleaning", uniqueNum: 0, status: "Active"),
            Item(title: "Clean bedroom", project: "Cleaning", objective: "House Cleaning", uniqueNum: 1, status: "Active"),
            Item(title: "Clean closet", project: "Cleaning", objective: "House Cleaning", uniqueNum: 2, status: "Active")
        ]
        
        let noneArray =
        [
            Item(title: "Call mom", project: "None", objective: "None", uniqueNum: 0, status: "Active"),
            Item(title: "Surf internet", project: "None", objective: "None", uniqueNum: 1, status: "Active"),
            Item(title: "Buy groceries", project: "None", objective: "None", uniqueNum: 2, status: "Active")
        ]
        
        
        tempProjectDictionary["Wix"]?.activeItems.append(contentsOf: wixArray)
        tempProjectDictionary["Piano"]?.activeItems.append(contentsOf: pianoArray)
        tempProjectDictionary["Cleaning"]?.activeItems.append(contentsOf: cleaningArray)
        tempProjectDictionary["None"]?.activeItems.append(contentsOf: noneArray)
        
        
        let pianoObjective1 = Objective(name: "Finish New Dawn", cycle: true, completed: false, items: [pianoArray[0], pianoArray[1]], project: "Piano")
        let pianoObjective2 = Objective(name: "Finish HSLB", cycle: true, completed: false, items: [pianoArray[2], pianoArray[3]], project: "Piano")
        tempProjectDictionary["Piano"]?.objectiveList.append(contentsOf: [pianoObjective1, pianoObjective2])
        
        let noneObjective1 = Objective(name: "None", cycle: true, completed: false, items: noneArray, project: "None")
        tempProjectDictionary["None"]?.objectiveList.append(contentsOf: [noneObjective1])
        
        let wixObjective1 = Objective(name: "Old Website", cycle: true, completed: false, items: [wixArray[0], wixArray[1]], project: "Wix")
        let wixObjective2 = Objective(name: "New Website", cycle: true, completed: false, items: [wixArray[2]], project: "Wix")
        tempProjectDictionary["Wix"]?.objectiveList.append(contentsOf: [wixObjective1, wixObjective2])
        
        let cleanObjective1 = Objective(name: "House Cleaning", cycle: true, completed: false, items: cleaningArray, project: "Cleaning")
        tempProjectDictionary["Cleaning"]?.objectiveList.append(contentsOf: [cleanObjective1])
        
        addProject(project: tempProjectDictionary["None"]!)
        addProject(project: tempProjectDictionary["Piano"]!)
        addProject(project: tempProjectDictionary["Wix"]!)
        
        
    }
    
    //MARK: - PLACEHOLDER MANAGEMENT
    
//    func priorityDeclaration(project: Project) {
//        var placeholderCounter = 0
//        for _ in 1...project.priority {
//            let newPlaceholder = Placeholder(title: "\(project.name) Placeholder", project: project.name, indx: placeholderCounter, status: "Active")
//            placeholderCounter += 1
//            activeArray.append(newPlaceholder)
//        }
//    }
//
    
    func addProject(project: Project) {
        
        projectDictionary[project.name] = project
//        projectArray.append(project)
        var placeholderCounter = 0
        var placeholderInsertArray: [Placeholder] = []
        
        
        for _ in 0...(project.priority-1) {
            let newPlaceholder = Placeholder(title: "\(project.name) Placeholder", project: project.name, indx: placeholderCounter, status: "Active")
            placeholderCounter += 1
            placeholderInsertArray.append(newPlaceholder)
        }
        
//        print(placeholderInsertArray)
        print(placeholderCounter)
        projectDictionary[project.name]?.placeholderCounter = placeholderCounter
        let inactiveItems = insertItems(itemsToInsert: placeholderInsertArray, priority: project.priority)
        
        inactiveArray.append(contentsOf: inactiveItems)
        
//        return inactiveItems
    }
    
    func insertItems(itemsToInsert: [Placeholder], priority: Int) -> [Placeholder] {
        var inactivatedItems: [Placeholder] = []
        if activeArray.count == 0 {
            for itm in itemsToInsert {
                activeArray.append(itm)
            }
        } else {
            var counter = 1
            let speed = Float(activeArray.count) / Float(priority) + 1
            print(speed)
            for itm in itemsToInsert {
                let insertLevel = Int(speed.rounded(.up))*counter - 1
                if insertLevel < activeArray.count {
                    
                    activeArray.insert(itm, at: insertLevel)
                    counter += 1
//                    print(activeArray)
                } else {
                    print("Item List needs more items")
//                    let itemDiff = itemsToInsert.count - counter
                    inactivatedItems.append(itm)
                    
                    counter += 1
                }
                
            }
            
        }
        
//        print(inactivatedItems)
        return inactivatedItems
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
//                print("Nothing was added for \(projName) with priority \(proj.priority)")
            } else {
                let currentIndex = inactiveArray.firstIndex { $0.indx == filteredInactiveArray[0].indx }
                inactiveArray[currentIndex!].status = "Active"
                let itemAdded = inactiveArray[currentIndex!]
                
                activeArray.append(itemAdded)
                inactiveArray.remove(at: currentIndex!)
//                print("we added item \(itemAdded.title) from project \(projName) with priority \(proj.priority)")
                
                
            }
        }
    }
        
        
//        for indx in projectArray {
//            print("hello")
//            let filteredActiveArray = activeArray.filter({ $0.project == indx.name})
//            let filteredInactiveArray = inactiveArray.filter({ $0.project == indx.name})
//
//            var indexHighest: Float = 0
//
//            if filteredActiveArray.count == 0 {
//                indexHighest = 0
//            } else {
//                let levelCheck = activeArray.firstIndex { $0.project == indx.name }
//                indexHighest = Float(levelCheck!)
//            }
//
//            let level = (Float(activeArray.count) / Float(indx.priority)) * Float(filteredActiveArray.count)
//            let finalLevel = Float(activeArray.count) - level
//
//            if filteredActiveArray.count >= indx.priority || filteredInactiveArray.count == 0 || indexHighest >= finalLevel {
//                print("Nothing was added for \(indx.name) with priority \(indx.priority)")
//            } else {
//                let currentIndex = inactiveArray.firstIndex { $0.indx == filteredInactiveArray[0].indx }
//                inactiveArray[currentIndex!].status = "Active"
//                let itemAdded = inactiveArray[currentIndex!]
//                activeArray.append(itemAdded)
//                inactiveArray.remove(at: currentIndex!)
//                print("we added item \(itemAdded.title) from project \(indx.name) with priority \(indx.priority)")
//            }
//
//        }
//    }
    
    func completeObjective(objective: Objective) {
        let currentObjective = objective
        let currentProjectName = objective.project
        var currentProject = projectDictionary[currentProjectName]
        
        let indexOfObjective = currentProject?.objectiveList.firstIndex {$0.name == currentObjective.name}
        
        currentProject?.objectiveList.remove(at: indexOfObjective!)
        
        let activeItemsWithoutObjective = currentProject?.activeItems.filter({$0.objective != currentObjective.name})
        
        currentProject?.activeItems = activeItemsWithoutObjective!
       
        
//        let filteredObjectiveItems = currentProject.objectiveList[indexOfObjective!].items.filter({$0.status == "Active"})
        
        //send it back to the main project dictionary
        projectDictionary[currentProjectName] = currentProject
        
        
        
        
        
        //UPDATE all placeholders of this project
        let newPlaceholderArray = activeArray.filter({$0.project != currentProjectName})
        let currentLowestIndx = newPlaceholderArray[0].indx
        
        //replace active array
        var tempActiveArray: [Placeholder] = []
        for placeholder in activeArray {
            if placeholder.project == currentProjectName {
                var tempPlaceholder = placeholder
                let currentIndxValue = tempPlaceholder.indx
                let newIndxValue = currentIndxValue - currentLowestIndx + 1
                tempPlaceholder.indx = newIndxValue
                tempActiveArray.append(tempPlaceholder)
            } else {
                tempActiveArray.append(placeholder)
            }
        }
        activeArray = tempActiveArray
            
        
        //replace inactive array
        var tempInactiveArray: [Placeholder] = []
        for placeholder in inactiveArray {
            if placeholder.project == currentProjectName {
                var tempPlaceholder = placeholder
                let currentIndxValue = tempPlaceholder.indx
                let newIndxValue = currentIndxValue - currentLowestIndx + 1
                tempPlaceholder.indx = newIndxValue
                tempInactiveArray.append(tempPlaceholder)
            } else {
                tempInactiveArray.append(placeholder)
            }
        }
        inactiveArray = tempInactiveArray
        
        
        //update the placeholder counter
        let newPlaceholderCounter = projectDictionary[currentProjectName]!.placeholderCounter - currentLowestIndx + 1
        projectDictionary[currentProjectName]?.placeholderCounter = newPlaceholderCounter
        
        
        //check if objective list is empty - if so, then remove project and all placeholders - completing last remaining objective is akin to completing project
        if ((currentProject?.objectiveList.isEmpty) != nil) {
            print("project needs to be deleted")
        }
        
    }
    
    func completeProject(project: Project) {
        //remove placeholders
        var currentProject = projectDictionary[project.name]
        
        //create temporary arrays
        let tempActiveArray = activeArray.filter({$0.project != project.name})
        let tempInactiveArray = inactiveArray.filter({$0.project != project.name})
        
        //update master arrays
        activeArray = tempActiveArray
        inactiveArray = tempInactiveArray
        
    }
    
    
    
    func completeItem(index: Int) {
//        let currentIndex = activeArray.firstIndex { $0.indx == index }
        
        let currentProjectOfItem = activeArray[index].project
        let placeholderIndex = activeArray[index].indx
        
//        let projectType = projectDictionary[currentProjectOfItem]!.type
        
        //handle placeholders
//        print(activeArray[index])
        activeArray[index].indx = projectDictionary[currentProjectOfItem]!.placeholderCounter
//        print(activeArray[index].indx)
        activeArray[index].status = "Inact"
        
        inactiveArray.append(activeArray[index])
        projectDictionary[currentProjectOfItem]!.placeholderCounter += 1
//        print(projectDictionary[currentProjectOfItem]!.placeholderCounter)
//
//        print(activeArray[currentIndex!].title)
        activeArray[index].status = "Done"
        activeArray[index].timeDone = Date()
        activeArray.remove(at: index)
        
        
        //handle actual items
        var currentProject = projectDictionary[currentProjectOfItem]!
//        let actualItemIndex = currentProject.activeItems.firstIndex { $0.uniqueNum == placeholderIndex }
        let activeItemIndex = 0
        
        var currentObjective = currentProject.objectiveList[0].name
        
        
//        var currentObjective = currentProject.activeItems[actualItemIndex].objective
        var currentItem = currentProject.activeItems[activeItemIndex]
        
//        print(currentItem)
//        print(currentProject.activeItems)
        
        let indexOfObjective = currentProject.objectiveList.firstIndex { $0.name == currentObjective }
//        print(indexOfObjective)
        
        if currentProject.objectiveList[indexOfObjective!].cycle {
            

            
            
            //count objective items
            let filteredObjectiveItems = currentProject.objectiveList[indexOfObjective!].items.filter({$0.status == "Active"})
            let objectiveCount = filteredObjectiveItems.count
            print(objectiveCount)
            
            let indexOfItemInObjectiveList = currentProject.objectiveList[indexOfObjective!].items.firstIndex { $0.uniqueNum == currentItem.uniqueNum }
            //            let indexOfItemInObjectiveList = actualItemIndex
            //complete existing item within objective list
            currentProject.objectiveList[indexOfObjective!].items[indexOfItemInObjectiveList!].status = "Done"

            
            
            
            //create duplicate item
            var duplicateItem = currentItem
            duplicateItem.uniqueNum = currentProject.itemCounter
            duplicateItem.status = "Active"
//            print(duplicateItem)
            //update the item counter of Project
            currentProject.itemCounter += 1
//            print(currentProject.itemCounter)
            
            //insert the duplicate item into the Objective items list
            currentProject.objectiveList[indexOfObjective!].items.append(duplicateItem)
//            print(currentProject.objectiveList[indexOfObjective!].items)
            //insert duplicate item into active list based on the current objective's count. This only works for the 1st Objective level
            
            


            currentProject.activeItems.insert(duplicateItem, at: objectiveCount)
            
            //complete existing item within both the objective and active list
//            print(actualItemIndex)
            currentProject.activeItems[activeItemIndex].status = "Done"
//            print(currentProject.activeItems[actualItemIndex!].title)
            
            //remove item from active list
            currentProject.activeItems.remove(at: activeItemIndex)
            
            //find item's index in objective list

            
            
            
            
            
            
            //replace entire project
            
            
        } else {
            projectDictionary[currentProjectOfItem]!.activeItems[activeItemIndex].status = "Done"
            //find item's index in objective list
            let indexOfItemInObjectiveList = currentProject.objectiveList[indexOfObjective!].items.firstIndex { $0.uniqueNum == currentItem.uniqueNum }
            projectDictionary[currentProjectOfItem]!.objectiveList[indexOfObjective!].items[indexOfItemInObjectiveList!].status = "Done"
        }
        
        projectDictionary[currentProjectOfItem] = currentProject

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
