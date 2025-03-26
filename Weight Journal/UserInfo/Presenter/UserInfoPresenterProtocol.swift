//
//  UserInfoPresenterProtocol.swift
//  Weight Journal
//
//  Created by Данила on 26.03.2025.
//

import Foundation

protocol UserInfoPresenterProtocol: AnyObject {
    
    /// updateView
    func viewDidload()
    /// checkView
    func checkValidString(textField: NSString?, range: NSRange, string: String, textFieldText: String?) -> Bool
    /// registration
    func registrationUser(age: Int, height: Double, weightNow: Double, weightGoal: Double, caloriesGoal: Int)
    /// buttonsAction
    func buttonManAction()
    func buttonWomenAction()
    func buttonSelectDownAction()
    func buttonSelectUpAction()
    func buttonSelectRegularAction()
    func buttonNextAction()
}
