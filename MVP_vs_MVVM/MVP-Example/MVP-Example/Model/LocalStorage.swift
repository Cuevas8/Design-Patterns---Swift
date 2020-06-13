//
//  LocalStorage.swift
//  MVP-Example
//
//  Created by Bryan Cuevas on 6/11/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

class LocalStorage {
    
    var user: User?
    static let `default` = LocalStorage()
    
    private init() {
        
        user = getUser()
    }
    
    // get the user from remote or from local, based on your business
    private func getUser() -> User? {

        return User(name: "Omar Tarek", mobileNumber: "01007336222", email: "dev.omartarek@gmail.com", age: 26, gender: .male)
    }
}
/*
 LocalStorage class is just created to provide us with the user object.
 In our example we mainly focus on the MVP architecture, so we did interested in fetching data from remote or things like that, I am just trying to make the example as simple as possible, so we can consider LocalStorage class is our data provider
*/
