import UIKit

////Iterating finite sequences
//class LinkedList<T> {
//    var start: LinkedListNode<T>?
//}
//
//class LinkedListNode<T> {
//    var value: T
//    var next: LinkedListNode?
//
//    init(value: T) {
//        self.value = value
//    }
//}
//
//class LinkedListIterator<T>: IteratorProtocol {
//    // holds the item we're currently reading
//    private var current: LinkedListNode<T>?
//
//    // an initializer giving us the start of the list
//    init(start: LinkedListNode<T>?) {
//        current = start
//    }
//
//    // move one place along and return that node
//    func next() -> LinkedListNode<T>? {
//        defer { current = current?.next }
//        return current
//    }
//
//}
//
//extension LinkedList: Sequence {
//    func makeIterator() -> LinkedListIterator<T> {
//        return LinkedListIterator(start: start)
//    }
//}
//
//
//let list = LinkedList<Int>()
//let first = LinkedListNode(value: 1)
//let second = LinkedListNode(value: 1)
//let third = LinkedListNode(value: 2)
//let fourth = LinkedListNode(value: 3)
//let fifth = LinkedListNode(value: 5)
//let sixth = LinkedListNode(value: 8)
//
//list.start = first
//first.next = second
//second.next = third
//third.next = fourth
//fourth.next = fifth
//fifth.next = sixth
//
//for item in list {
//    print(item.value)
//}

//Iterating infinite Sequences
struct FibonacciGenerator {
    var previous = 0
    var current = 1
}

extension FibonacciGenerator: Sequence, IteratorProtocol {
    mutating func next() -> Int? {
    defer {
        let next = previous + current
        previous = current
        current = next
    }
    return current
    }
}

var count = 0
for fib in FibonacciGenerator() {
    print(fib)
    count += 1
    if count == 25 { break }
}
