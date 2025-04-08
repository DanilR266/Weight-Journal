//
//  AuthenticatePresenteeProtocol.swift
//  Weight Journal
//
//  Created by Данила on 25.03.2025.
//

import Foundation

protocol AuthenticatePresenteeProtocol: AnyObject {
    
    /// authenticate
    func registerUser(name: String, email: String, password: String)
    func loginUser(email: String, password: String)
    /// buttons actions
    func buttonLabelSignIn()
    func buttonLabelRegistration()
    
    /// updateView
    func changeConstraintsView(_ constant: CGFloat, _ begin: Bool)
}
