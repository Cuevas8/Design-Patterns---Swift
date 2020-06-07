//
//  BoundTextField.swift
//  MVVMExample
//
//  Created by Bryan Cuevas on 5/6/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

//View
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
    }
}
