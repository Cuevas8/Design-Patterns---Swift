//
//  SharePromptView.swift
//  MVC-CodingInterface
//
//  Created by Bryan Cuevas on 6/6/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import UIKit

class SharePromptView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    func createSubviews() {
        // all the layout code from above
        backgroundColor = UIColor(white: 0.9, alpha: 1)
         let stackView = UIStackView()
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.spacing = 10
         self.addSubview(stackView)
         stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
         stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
         stackView.axis = .vertical
         let notice = UILabel()
         notice.numberOfLines = 0
         notice.text = "Your child has attempted to share the following photo from the camera:"
         stackView.addArrangedSubview(notice)
        // let imageView = UIImageView(image: shareImage)
         //stackView.addArrangedSubview(imageView)
         let prompt = UILabel()
         prompt.numberOfLines = 0
         prompt.text = "What do you want to do?"
         stackView.addArrangedSubview(prompt)
         for option in ["Always Allow", "Allow Once", "Deny", "Manage Settings"] {
             let button = UIButton(type: .system)
             button.setTitle(option, for: .normal)
             stackView.addArrangedSubview(button)
         }
    }
    
}
