import Foundation

struct Objective: Codable {
    var name: String
    var cycle: Bool
    var completed: Bool
    var items: [Item]
    var currentItem: Item?
    var project: String
    
}
