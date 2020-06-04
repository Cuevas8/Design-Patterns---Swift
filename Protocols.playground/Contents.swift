import UIKit

//protocol MoviePlayerDelegate {
//    func movieDidLoad()
//    func movieShouldPause() -> Bool
//    func movieWillEnd()
//}

@objc protocol MoviePlayerDelegate {
    @objc optional func movieShouldPause() -> Bool
    func movieWillEnd()
}

struct MoviePlayer {
    var delegate: MoviePlayerDelegate?
    func pausePressed() -> Bool {
        return delegate?.movieShouldPause?() ?? true
    }
    
}


protocol Identifiable {
    associatedtype IDType
    var id: IDType {get set}
}

struct Person: Identifiable {
    var id: String
}
struct WebPage: Identifiable {
    var id: URL
}

let taylor = Person(id: "555-55-5555") //Legal

//let taylor: Identifiable = Person(id: "555-55-5555") //Not legal
