import UIKit

protocol CalendarDelegate: class {
    // Using the class keyword for the protocol restrict it to be used only with classes, thus in turn
    //this allows us to store instances of the delegate using the weak keyboard to avoid retain cycles.
    func calendar(_ calendar: Calendar, willDisplay year: Int)
    func calendar(_ calendar: Calendar, didSelect date: Date)
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool
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


class Reminders: CalendarDelegate, CalendarDataSource {
    
    var title = "Year: 2018"
    var calendar = Calendar()
    
    init() {
        calendar.delegate = self
        calendar.dataSource = self
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
    
}
