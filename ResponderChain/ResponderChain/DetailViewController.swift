//
//  DetailViewController.swift
//  ResponderChain
//
//  Created by Bryan Cuevas on 6/4/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

extension UIView {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { print("UIView")
        next?.touchesBegan(touches, with: event)
        
    }
}
extension UIViewController {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { print("UIViewController")
        next?.touchesBegan(touches, with: event)
    }
    
}
extension UIWindow {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { print("UIWindow")
        next?.touchesBegan(touches, with: event)
        
    }
}
extension AppDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { print("AppDelegate")
    }
    
}

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

