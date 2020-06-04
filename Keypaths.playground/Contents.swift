import UIKit

//Key Value Coding
/*
 KVC allows users to access properties using strings, more or less tossing away type safety.
 */


struct Character {
    var name: String
    var city: City
}
struct City {
    var name: String
    var sights: [String]
}

let london = City(name: "London", sights: ["Tower of London", "Buckingham Palace"])
let bear = Character(name: "Paddington Bear", city: london)
let detective = Character(name: "Sherlock Holmes", city: london)
let spy = Character(name: "James Bond", city: london)

let characterName = \Character.name
let cityName = \Character.city.name
let exampleSight = \Character.city.sights[0]
let characterSight = spy[keyPath: exampleSight]

//print(characterSight)
//print(spy[keyPath: cityName])
//print(bear[keyPath: characterName])
//print(detective[keyPath: characterName])
//print(spy[keyPath: characterName])

//Using keypaths in this way allows us to refer to the same property in multiple types without having to repeat ouselves.
//If you decide you want a different property you can just change one line, and it will be applied across the board.


//Key Value Observing

class CoffeeShop: NSObject {
    @objc dynamic var remainingBeans = 10_000
}

let blueBottle = CoffeeShop()

blueBottle.observe(\.remainingBeans, options: .new) { (coffeeShop, change) in
    print(coffeeShop.remainingBeans)
}

blueBottle.remainingBeans -= 1
blueBottle.remainingBeans -= 5
blueBottle.remainingBeans -= 3



let vw = UIView()

vw.observe(\.isHidden, options: .new) { view, change in
    print(view.isHidden)
}
vw.isHidden = true
vw.isHidden = false
vw.isHidden = true

//Acting as adapter

protocol Identifiable {
    associatedtype ID
    static var idKey: WritableKeyPath<Self, ID> { get }
}

struct Person: Identifiable {
    static let idKey = \Person.socialSecurityNumber
    
   var socialSecurityNumber: String
   var name: String
}
struct Book: Identifiable {
    
    static let idKey = \Book.isbn
   var isbn: String
   var title: String
}

func printID<T: Identifiable>(thing: T) {
    print(thing[keyPath: T.idKey])
}
let taylor = Person(socialSecurityNumber: "555-55-5555", name: "Taylor Swift")
printID(thing: taylor)


