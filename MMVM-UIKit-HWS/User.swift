//
//  User.swift
//  MMVM-UIKit-HWS
//
//  Created by Bryan Cuevas on 6/7/24.
//

import Foundation
import UIKit

struct User {
    var name: Observable<String>
}

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

class BoundTextField: UITextField {
    var changedClosure: (() -> ())?
    
    @objc func valueChanged() {
        changedClosure?()
    }
    
    func bind(to observable: Observable<String>) {
        addTarget(self, action: #selector(BoundTextField.valueChanged), for: .editingChanged)

        changedClosure = { [weak self] in
            observable.bindingChanged(to: self?.text ?? "")
        }

        observable.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }

        // set our initial value, or an empty string if empty
        text = observable.value ?? ""
    }
}

