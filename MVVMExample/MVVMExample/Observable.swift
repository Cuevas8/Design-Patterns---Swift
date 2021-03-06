//
//  Observable.swift
//  MVVMExample
//
//  Created by Bryan Cuevas on 5/6/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

class Observable<ObservedType> {
    private var _value: ObservedType?
    var valueChanged: ((ObservedType?) -> ())?
    
    init(_ value: ObservedType) {
        _value = value
    }
    
    public var value: ObservedType? {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("Value is now \(newValue)")
    }
}
