//
//  AuthModel.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation


class AuthModel {
    
    func isEmailValid(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        return password.count >= 8
    }
    
    func isNameValid(_ name: String) -> Bool {
        return name.count >= 1
    }
    
}
