//
//  Property.swift
//  MVVM-Example
//
//  Created by Bryan Cuevas on 6/12/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

class Property<Type> {
    
    private var subscribeAction :(Type?) -> () = { _ in }
    
    func subscribe(_ closure:@escaping (Type?) -> ()) {
        subscribeAction = closure
        
        if let value = value {
            self.subscribeAction(value)
        }
    }
    
    var value :Type? {
        didSet {
            subscribeAction(value)
        }
    }
    
    init(_ v :Type) {
        value = v
    }
    
}
