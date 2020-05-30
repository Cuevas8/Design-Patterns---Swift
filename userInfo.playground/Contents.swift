import UIKit

struct User {
    var name: String
    var age: Int
    var userInfo: [String: Any]
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.userInfo = [:]
    }
}
extension User {
    private var favoriteIceCreamKey: String {
        return "@FavoriteIceCream@"
        
    }
    
    var favoriteIceCream: String? {
        get {
            return userInfo[favoriteIceCreamKey] as? String
        }
        set {
            userInfo[favoriteIceCreamKey] = newValue
        }
        
    }
}
