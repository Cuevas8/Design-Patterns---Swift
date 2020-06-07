//
//  ViewController.swift
//  MVC-CodingInterface
//
//  Created by Bryan Cuevas on 6/6/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var shareView = SharePromptView()
    
    override func loadView() {
        view = shareView
    }
    
    
}

