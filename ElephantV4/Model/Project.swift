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
//    var objectives: [Objective]?
    
    var itemCounter: Int
    var activeItems: [Item]
    var inactiveItems: [Item]
    
    var objectiveCounter: Int
    var objectiveList: [Objective]
    
    var placeholderCounter: Int
    
    mutating func itemAdd(newItem: Item){
        var currentItem = newItem
        currentItem.projCounter = itemCounter
        activeItems.append(currentItem)
        itemCounter += 1
    }
    
    
}
