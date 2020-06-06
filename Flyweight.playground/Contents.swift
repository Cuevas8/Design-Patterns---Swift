import UIKit

let font1 = UIFont.systemFont(ofSize: 32)
let font2 = UIFont.systemFont(ofSize: 32)
let font3 = UIFont.systemFont(ofSize: 32)
let font4 = UIFont.systemFont(ofSize: 32)

if font1 === font2 {
    print("Fonts are the same!")
}

let number1 = NSNumber(value: 556)
let number2 = NSNumber(value: 556)
if number1 === number2 {
    print("Numbers match!")
}



struct CarBase {
   let manufacturer: String
   let model: String
   let length: Int
   let width: Int
   let safetyRating: Int
}

struct Car {
   let base: CarBase
   var registration: String
   var color: UIColor
}


let jaguarXJ220 = CarBase(manufacturer: "Jaguar", model: "XJ220", length: 4930, width: 2009, safetyRating: 4)
var jag1 = Car(base: jaguarXJ220, registration: "X118 CJM", color: .black)
var jag2 = Car(base: jaguarXJ220, registration: "X119 CJM", color: .red)
