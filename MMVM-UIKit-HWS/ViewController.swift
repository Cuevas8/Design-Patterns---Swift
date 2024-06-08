//
//  ViewController.swift
//  MMVM-UIKit-HWS
//
//  Created by Bryan Cuevas on 6/7/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: BoundTextField!
    
    var user = User(name: Observable("Paul Hudson"))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        username.bind(to: user.name)
        
        // see the change from model to textfield.
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.user.name.value = "Bilbo Baggins"
        }

    }


}

