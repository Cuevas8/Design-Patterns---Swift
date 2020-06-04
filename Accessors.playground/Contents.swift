
import UIKit

//struct Brewery {
//    public private(set) var bestSellingBeer = "Guinness" // allow everyone to read property, but only methods that belong to this class can change it.
//}
//var diageo = Brewery()
//print(diageo.bestSellingBeer)
////diageo.bestSellingBeer = "Tea"


struct Brewery {
    private var _bestSellingBeer = "Guinness"
    
    public private(set) var bestSellingBeer: String {
        get {
            return _bestSellingBeer
        }
        set {
            _bestSellingBeer = newValue
        }
    }
    lazy var revenue: Int = {
        print("Running expensive code")
        return 1_000_000
    }()
}
var diageo = Brewery()
print(diageo.bestSellingBeer)




