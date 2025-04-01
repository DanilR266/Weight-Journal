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
    func calculateCalories(_ age: String, _ height: String, _ weight: String)
    /// registration
    func setUserInfo(age: String, height: String, weightNow: String, weightGoal: String, caloriesGoal: String)
    /// buttonsAction
    func buttonManAction()
    func buttonWomenAction()
    func buttonSelectDownAction()
    func buttonSelectUpAction()
    func buttonSelectRegularAction()
    func buttonNextAction()
}
