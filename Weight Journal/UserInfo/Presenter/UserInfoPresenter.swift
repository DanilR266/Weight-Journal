//
//  UserInfoViewModel.swift
//  Weight Journal
//
//  Created by Данила on 03.11.2024.
//

import Foundation



class UserInfoPresenter {
    
    private let userModel = CaloriesCalculator()
    private var sex = SelectedSex.none
    private var selectGoal = SelectGoal.regular
    private let validateInput = ValidationTextFieldInput.shared
    private var viewPages = 0
    private var calculateCalories = 0
    
    private weak var view: UserInfoViewProtocol?
    private let userInfoModelServer: UserInfoServerManagerProtocol
    private let name: String
    private let email: String
    private let userId: Int
    
    init(view: UserInfoViewProtocol, userInfoModelServer:
         UserInfoServerManagerProtocol = UserInfoServerManager.shared,
         name: String, email: String, userId: Int)
    {
        self.view = view
        self.userInfoModelServer = userInfoModelServer
        self.name = name
        self.email = email
        self.userId = userId
    }
}

extension UserInfoPresenter: UserInfoPresenterProtocol {
    func setUserInfo(age: String, height: String, weightNow: String, weightGoal: String, caloriesGoal: String) {
        guard !age.isEmpty, !height.isEmpty, !weightNow.isEmpty, !weightGoal.isEmpty
        else { return }
        guard let age = Int(age), let height = Double(height), let weightNow = Double(weightNow),
              let weightGoal = Double(weightGoal)
        else { return }
        if !caloriesGoal.isEmpty, let calories = Int(caloriesGoal) {
            calculateCalories = calories
        }
        let user = UserInfo(name: name, email: email, userID: userId, caloriesGoal: calculateCalories, age: age, height: height, weightNow: weightNow, weightGoal: weightGoal, sex: sex.rawValue)
        
        setUserInfo(userInfo: user)
    }
    
    func checkValidString(textField: NSString?, range: NSRange,
                          string: String, textFieldText: String?) -> Bool {
        return validateInput.checkValidString(textField: textField, range: range, string: string, textFieldText: textFieldText)
    }
    
    func viewDidload() {
        view?.updateViewDidload(name: name)
    }
    
    func buttonManAction() {
        sex = .man
        view?.setSizeImageManWomen(sex: sex)
    }
    
    func buttonWomenAction() {
        sex = .women
        view?.setSizeImageManWomen(sex: sex)
    }
    
    func buttonSelectDownAction() {
        selectGoal = .down
        view?.setSelectGoal(goal: selectGoal)
    }
    
    func buttonSelectUpAction() {
        selectGoal = .up
        view?.setSelectGoal(goal: selectGoal)
    }
    
    func buttonSelectRegularAction() {
        selectGoal = .regular
        view?.setSelectGoal(goal: selectGoal)
    }
    
    func buttonNextAction() {
        viewPages += 1
        view?.setNextPage(page: viewPages)
    }
}

private extension UserInfoPresenter {
    func setUserInfo(userInfo: UserInfo) {
        view?.setLoader()
        Task {
            do {
                let success = try await userInfoModelServer.setUserInfo(user: userInfo)
                print(success.text)
            } catch {
                print("Error set user")
            }
            await MainActor.run { [weak self] in
                self?.view?.stopLoader()
            }
        }
    }
}
