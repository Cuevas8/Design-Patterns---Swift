//
//  UserProfileViewProtocol.swift
//  MVVM-Example
//
//  Created by Bryan Cuevas on 6/12/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

protocol UserProfileViewProtocol: class {

    func setName(_ name: String)
    func setMobile(_ mobile: String)
    func setEmail(_ email: String)
    func setAge(_ age: Int)
    func setGender(atIndex index: Int)
    func getName() -> String
    func getMobileNumber() -> String
    func getEmail() -> String
    func getAge() -> Int
    func getGenderIndex() -> Int
    func showAlert(withTitle title: String, andErrorMessage message: String)
}
