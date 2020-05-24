import UIKit
import PlaygroundSupport

extension Notification.Name {
    static let HWSSettingsDidChange = Notification.Name("HWSSettingsDidChangeNotification")
    
}

class Controller {
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadSettings), name: .HWSSettingsDidChange, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(reloadSettings), name: .HWSSettingsDidChange, object: self)
    }
    @objc func reloadSettings(note: Notification) {
        print("Reloading settings!")
        if let userInfo = note.userInfo {
            print(userInfo)
        }
    }
}

let controller = Controller()

//Synchronous
//print("Before")
 //NotificationCenter.default.post(name: .HWSSettingsDidChange, object: controller, userInfo: ["theme": "dark"])
NotificationCenter.default.post(name: .HWSSettingsDidChange, object: nil, userInfo: ["theme": "dark"])
//print("After")


//Asynchronous
//print("Before")
//let notification = Notification(name: .HWSSettingsDidChange)
//NotificationQueue.default.enqueue(notification, postingStyle: .whenIdle, coalesceMask: .none, forModes: nil)
//PlaygroundPage.current.needsIndefiniteExecution = true
//print("After")


/*
 Notes:
 * You don't need to remove observeres you add; the system removes them automatically.
 
 Posting Styles for asyn notifcation call.
 • .whenIdle waits until the run loop is empty before posting the notification. This could be some time in executing, so you should use this for “nice to have” notifications.
 • .asap will run during the next run loop, like using afterDelay: 0 when performing selectors.
 • .now will post the notification immediately, like a regular post() call.
 
*/
