import UIKit

//This creates a new Responder protocol so that all conforming types must define what comes next in the chain (if anything), as well as amethod that will run a selector if possible or forward it otherwise.
protocol Responder {
    var next: Responder? { get set }
    
    func run(selector: Selector)
}


class Control: NSObject, Responder {
    var next: Responder?
    
    init(next: Responder? = nil) {
        self.next = next
    }
    
    func run(selector: Selector) {
        if responds(to: selector) {
            perform(selector)
        } else {
            print("Forwarding to next responder.")
            next?.run(selector: selector)
        }
    }
}

class MessagingControler: Control {
    @objc func printMessage() {
        print("Running!")
    }
}

let root = MessagingControler()
let first = Control(next: root)
let second = Control(next: first)
let third = Control(next: second)

let action = #selector(MessagingControler.printMessage)
third.run(selector: action)
