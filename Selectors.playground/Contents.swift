import UIKit

class BookStore: NSObject {
    let manager = Manager()
    func open() {
        let customer = Customer()
        let sel = NSSelectorFromString("greetWithCustomer:")
        perform(sel, with: customer)
        perform(#selector(turnOnLights), with: 10)
        perform(#selector(openDoors))
        //perform(#selector(startMusic), with: nil, afterDelay: 10)
        perform(NSSelectorFromString("handleComplaint"))
    }
    
    @objc func turnOnLights(intensity: Int) {
        print("The lights are on at intensity \(intensity)")
    }
    
    @objc func openDoors() {
        print("The doors are open")
    }
    
//    @objc func greet(_ customer: Customer) {
//        print("Hello, \(customer.name)!")
//    }
    
    @objc func greet(customer: Customer) { print("Hello, \(customer.name)!")
    }
    
   // @objc func buyBook(name: String) { }
   // @objc func buyBook(name: NSString) { }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
       return manager
    }
}

class Manager {
    @objc func handleComplaint() {
        print("Here's a refund and a free latte.")
        
    }
}

class Customer: NSObject {
    var name = "Taylor Swift"
}


let store = BookStore()
store.open()

/*
 Notes:
 * Selectors do not include parameter information.
*/
