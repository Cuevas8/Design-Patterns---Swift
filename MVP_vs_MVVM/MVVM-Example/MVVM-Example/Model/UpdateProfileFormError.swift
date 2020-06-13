//
//  UpdateProfileFormError.swift
//  MVVM-Example
//
//  Created by Bryan Cuevas on 6/12/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

enum UpdateProfileFormError: Error {
    case emptyName
    case invalidMobileNumber
    case invalidEmailAddress
    case veryYoung
    
    var localizedDescription: String {
        
        switch self {
        case .emptyName:
            return "Please, enter your name"
        case .invalidMobileNumber:
            return "Please, enter a valid mobile number"
        case .invalidEmailAddress:
            return "Please, enter a valid email address"
        case .veryYoung:
            return "Minimum age should be 18"
        }

    }
}
/*

 UpdateProfileFormError enum is just for differentiate between the validation errors that can happen, it has three cases emptyName, invalidMobilNumber, invalidEmailAddress and veryYoung. The enum conforms to Error protocol which means that, this defined Type (UpdateProfileFormError) is a kind of error, and also in order to provide localizedDescription for each error
 
*/
