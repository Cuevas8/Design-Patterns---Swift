//
//  ViewController.swift
//  MVVMExample
//
//  Created by Bryan Cuevas on 5/5/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var username: BoundTextField!
    var user = User(name: Observable(""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.bind(to: user.name)
    }
    
}

