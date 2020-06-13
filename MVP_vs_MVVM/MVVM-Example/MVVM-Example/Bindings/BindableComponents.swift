//
//  BindableComponents.swift
//  MVVM-Example
//
//  Created by Bryan Cuevas on 6/12/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class BindingTextField: UITextField {
    
    var textChanged: (String) -> () = { _ in }
    
    func subscribe(callback: @escaping (String) -> ()) {
        
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField :UITextField) {
        
        self.textChanged(textField.text!)
    }
    
}

class BindingSegmentedControl: UISegmentedControl {
    
    var selectionChanged: (Int) -> () = { _ in }
    
    func subscribe(callback: @escaping (Int) -> ()) {
        
        self.selectionChanged = callback
        self.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
    }
    
    @objc func selectionDidChange() {

        self.selectionChanged(self.selectedSegmentIndex)
    }
    
}

/*
 
 The first one is BindingTextField, which is a UITextField subclass which has subscribe(_ closure:) function.
 It notify us when any changes happen in the TextFiled’s Text Properly.
 The second class is BindingSegmentedControl is a UISegmentedControl subclasses which provides also the same functionality as BindingTextField.
 It’s also provides subscribe(_ closure:) function to notify us when the segmentedControl’s selectedSegmentIndex property changed.
 
 
*/
