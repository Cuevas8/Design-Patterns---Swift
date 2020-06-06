import UIKit

protocol TableViewCell {
    var identifier: String { get set }
    init(identifier: String)
    func clone() -> Self
    
}

struct ExampleCell: TableViewCell {
    var identifier: String
    func clone() -> ExampleCell {
        return ExampleCell(identifier: identifier)
    }
    
}

struct TableView {
    var identifierCache = [String: TableViewCell]()
    var cellCache = [String: [TableViewCell]]()
    
    mutating func register(_ type: TableViewCell.Type, for identifier: String) {
        identifierCache[identifier] = type.init(identifier: identifier)
    }
    
    mutating func enqueue(_ cell: TableViewCell) {
        print("Enqueing cell with identifier \(cell.identifier)")
        cellCache[cell.identifier, default: []].append(cell)
    }
    
    mutating func dequeue(identifier: String) -> TableViewCell {
        // attempt to find a cached cell for this identifier
        if let cell = cellCache[identifier]?.popLast() {
            
            print("Dequeuing cell with identifier \(identifier)")
            return cell
        } else {
            
            // attempt to find the prototype for this identifier
            if let cellType = identifierCache[identifier] {
                print("Creating new cell with identifier \(identifier)")
                return cellType.clone()
            } else {
                // no prototype – error!
                fatalError("No worker registered for \(identifier)")
            }
        }
    }
}

var tableView = TableView()
tableView.register(ExampleCell.self, for: "Default")
let first = tableView.dequeue(identifier: "Default")
let second = tableView.dequeue(identifier: "Default")
tableView.enqueue(first)
let third = tableView.dequeue(identifier: "Default")
tableView.enqueue(second)
let fourth = tableView.dequeue(identifier: "Default")
let fifth = tableView.dequeue(identifier: "Unknown")
