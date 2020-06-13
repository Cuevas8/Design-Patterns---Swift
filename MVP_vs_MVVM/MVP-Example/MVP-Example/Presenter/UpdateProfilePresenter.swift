//
//  UpdateProfilePresenter.swift
//  MVP-Example
//
//  Created by Bryan Cuevas on 6/11/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

class UpdateProfilePresenter {
   
    var user: User?
    weak var updateProfileViewController: UserProfileViewProtocol!
    
    init(user: User?, viewController: UserProfileViewProtocol) {
        self.user = user
        self.updateProfileViewController = viewController
        
        if let user  = self.user {
            self.setUserDate(user)
        }
        
    }
    
    func setUserDate(_ user: User){
        self.updateProfileViewController.setName(user.name)
        self.updateProfileViewController.setMobile(user.mobileNumber)
        self.updateProfileViewController.setEmail(user.email)
        self.updateProfileViewController.setAge(user.age)
        self.updateProfileViewController.setGender(atIndex: user.gender.rawValue)
    }
    
    func validateInput(name: String, mobileNumber: String, age: Int, email: String) -> UpdateProfileFormError? {
       
        if name.isEmpty {
            return .emptyName
            
        } else if !validate(mobileNumber: mobileNumber) {
            return .invalidMobileNumber
            
        } else if !validate(email: email){
            return .invalidEmailAddress
       
        } else if age < 18 {
            return .veryYoung
        }
        
        return nil
    }
    
    func validate(mobileNumber: String) -> Bool {
        let alphaNumericRegex = "^[0-9]{11}$"
        let alphaNumericTest = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegex)
        return alphaNumericTest.evaluate(with: mobileNumber)
    }
    
    func validate(email: String) -> Bool {
        let regex = "([\\w-+]+(?:\\.[\\w-+]+)*@(?:[\\w-]+\\.)+[a-zA-Z]{2,7})"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailTest.evaluate(with: email)
    }
    
    func saveButtonClicked() {
        if let error = self.validateInput(name: updateProfileViewController.getName(),
                                          mobileNumber: updateProfileViewController.getMobileNumber(),
                                          age: updateProfileViewController.getAge(),
                                          email: updateProfileViewController.getEmail()) {
            
            self.updateProfileViewController.showAlert(withTitle: "Error", andErrorMessage: error.localizedDescription)
        } else {
            self.saveProfileData(name: updateProfileViewController.getName(),
                                 mobileNumber: updateProfileViewController.getMobileNumber(),
                                 email: updateProfileViewController.getEmail(),
                                 age: updateProfileViewController.getAge(),
                                 gender: Gender(rawValue: updateProfileViewController.getGenderIndex())! )
            
            self.updateProfileViewController.showAlert(withTitle: "Success", andErrorMessage: "The profile updated successfully")
        }
    }
    
     func saveProfileData(name: String, mobileNumber: String, email: String, age: Int, gender: Gender) {
        
        self.updateLocalStoreWithUserData(name: name, mobileNumber: mobileNumber, email: email, age: age, gender: gender)
        self.updateUserModel(name: name, mobileNumber: mobileNumber, email: email, age: age, gender: gender)
    }
    
    func updateLocalStoreWithUserData(name: String, mobileNumber: String,email: String, age: Int, gender: Gender) {
        // update local data
        LocalStorage.default.user?.name = name
        LocalStorage.default.user?.mobileNumber = mobileNumber
        LocalStorage.default.user?.gender = gender
        LocalStorage.default.user?.email = email
        LocalStorage.default.user?.age = age
    }
    
    func updateUserModel(name: String, mobileNumber: String, email: String, age: Int, gender: Gender) {
        // update the model
        self.user?.name = name
        self.user?.mobileNumber = mobileNumber
        self.user?.gender = gender
        self.user?.email = email
        self.user?.age = age
    }
    
}
