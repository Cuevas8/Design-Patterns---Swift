import UIKit

protocol CalendarDelegate: class {
    // Using the class keyword for the protocol restrict it to be used only with classes, thus in turn
    //this allows us to store instances of the delegate using the weak keyboard to avoid retain cycles.
    func calendar(_ calendar: Calendar, willDisplay year: Int)
    func calendar(_ calendar: Calendar, didSelect date: Date)
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool
}

class RemindersCalendarDelegate: CalendarDelegate {
    
    var parentController: ReminderPresenting?
    
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool {
        return true
    }
    
    func calendar(_ calendar: Calendar, willDisplay year: Int) {
        parentController?.yearChanged(to: year)
    }
    
    func calendar(_ calendar: Calendar, didSelect date: Date) {
        print("You selected \(date)")
    }
}

protocol ReminderPresenting {
    func yearChanged(to year: Int)
}

protocol CalendarDataSource {
    
    func calendar(_ calendar: Calendar, eventsFor date: Date) -> [String]
    func calendar(_ calendar: Calendar, add event: String, to date: Date)
}

class RemindersCalendarDataSource: CalendarDataSource {
    
    func calendar(_ calendar: Calendar, eventsFor date: Date) -> [String] {
        return ["Organize sock drawer", "Take over the world"]
    }
    
    func calendar(_ calendar: Calendar, add event: String, to date: Date) {
        print("You're going to \(event) on \(date).")
    }
}

class Calendar {
    
    weak var delegate: CalendarDelegate?
    var dataSource: CalendarDataSource?
    
    var selectedDate: Date = Date()
    var currentYear: Int = 2018
    
    func changeDate(to date: Date) {
        delegate?.calendar(self, didSelect: date)
        selectedDate = date
        
        if let items = dataSource?.calendar(self, eventsFor: date) {
            print("Today's events are...")
            items.forEach { print($0) }
        } else {
            print("You have no events today.")
        }
    }
    
    func changeYear(to year: Int) {
        if delegate?.calendarShouldChangeYear(self) ?? true {
            delegate?.calendar(self, willDisplay: year)
            currentYear = year
        }
    }
}

class Reminders: ReminderPresenting {
    
    var title = "Year: 2018"
    var calendar = Calendar()
    
    init() {
        calendar.delegate = RemindersCalendarDelegate()
        calendar.dataSource = RemindersCalendarDataSource()
    }
    
    func calendar(_ calendar: Calendar, willDisplay year: Int) {
        title = "Year: \(year)"
    }
    
    func calendar(_ calendar: Calendar, didSelect date: Date) {
        print("You selected \(date)")
    }
    
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool {
        return true
    }
    
    
    func calendar(_ calendar: Calendar, eventsFor date: Date) -> [String] {
        return ["Organize sock drawer", "Take over the world"]
    }
    
    func calendar(_ calendar: Calendar, add event: String, to date: Date) {
        print("You're going to \(event) on \(date).")
    }
    
    func yearChanged(to year: Int) { //ReminderPresenting
        title = "Year: \(year)"
    }
}
/*
Notes:
 
Calendar class has no knowledge of Reminders class - one is designed to be reusable in a variety of forms,
and the other is a specific implementation to solve an app-specific problem. Both classes work together by using
the CalendarDelegate & CalendarDataSource protocols, which is what we are using to loose coupling.
As long as the protocol remains fixed, either of the two classes could be changed without breaking code.

SOLID:
 • The Single responsibility principle, where one class should be responsible for only one thing.
 • The Open/closed principle, which states that software should be open for extension but closed for modification.
 • The Liskov substitution principle, which allows a subclass to be used where one of its arent classes would be.
 • The Interface segregation principle, which states that having multiple small interfaces is
 better than having one large one.
 • And the Dependency inversion principle, which states that it’s better to depend on
 abstractions than concrete things.
*/
