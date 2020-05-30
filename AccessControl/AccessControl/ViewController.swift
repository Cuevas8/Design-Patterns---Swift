//
//  ViewController.swift
//  AccessControl
//
//  Created by Bryan Cuevas on 5/25/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit
import FooFramework

class Boat: Vehicle {
    
}

//class BMW: Car { // Cannot inherit from non-open class 'Car' outside of its defining module
//    
//}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let object = MathDoer()
//        let sum = object.perform(x: 1, y: 2)
//        print(sum)
        
        let car = Car()
        let vehicle = Vehicle()
        
        car.drive()
        let currentColor = vehicle.color
        
    }


}

