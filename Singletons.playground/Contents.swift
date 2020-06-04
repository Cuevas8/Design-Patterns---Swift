import UIKit

//Basic implementation of a singleton
class Settings {
    static let shared = Settings()
    var username: String?
    var sharedInstanceExists = false
    
    private init() {
        sharedInstanceExists = true
    }
}


