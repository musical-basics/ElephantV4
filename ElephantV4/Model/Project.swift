//
//  Project.swift
//  ElephantTesting2
//
//  Created by Lionel Yu on 1/8/23.
//

import Foundation


struct Project: Codable {
    var name: String
    var completed: Bool
    var priority: Int
    var type: String
    var deadline: Date?
    var objectives: [Objective]?
    
    var itemCounter: Int
    var activeItems: [Item]
    var inactiveItems: [Item]
    
    var placeholderCounter: Int
    var activePlaceholders: [Placeholder]
    var inactivePlaceholders: [Placeholder]
    
    mutating func itemAdd(newItem: Item){
        var currentItem = newItem
        currentItem.projCounter = itemCounter
        activeItems.append(currentItem)
        itemCounter += 1
    }
    
    mutating func priorityDeclaration() {
        for _ in 1...priority {
            let newPlaceholder = Placeholder(title: "\(name) Placeholder", project: name, indx: placeholderCounter, status: "Active")
            placeholderCounter += 1
            activePlaceholders.append(newPlaceholder)
        }
    }
    
    mutating func priorityChange(newPriority: Int) {
        if newPriority > priority {
            let priorityDiff = newPriority - priority
            for _ in 1...priorityDiff {
                let newPlaceholder = Placeholder(title: "\(name) Placeholder", project: name, indx: placeholderCounter, status: "Inactive")
                placeholderCounter += 1
                inactivePlaceholders.append(newPlaceholder)
            }
            priority = newPriority
        } else {
            priority = newPriority
        }
    }
    
    mutating func inactivateItems(counter: Int) {
        var tempArray: [Placeholder] = []
        for index in counter...activePlaceholders.count {
            let newItem = activePlaceholders[index]
            tempArray.append(newItem)
            activePlaceholders.remove(at: index)
        }
        inactivePlaceholders.insert(contentsOf: tempArray, at: 0)
    }
}

