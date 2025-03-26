//
//  UserInfoViewModel.swift
//  Weight Journal
//
//  Created by Данила on 03.11.2024.
//

import Foundation



class UserInfoPresenter: UserInfoPresenterProtocol {
    
    private let userModel = UserInfoModel()
    private var sex = SelectedSex.none
    private var selectGoal = SelectGoal.regular
    private let validateInput = ValidationTextFieldInput.shared
    private var viewPages = 0
    
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

    
    var userInfo: UserInfo?
    
    func registrationUser(age: Int, height: Double, weightNow: Double, weightGoal: Double, caloriesGoal: Int) {
        let user = UserInfo(name: name, email: email, id: userId, caloriesGoal: caloriesGoal, age: age, height: height, weightNow: weightNow, weightGoal: weightGoal, sex: sex.rawValue, caloriesNow: 0, max: 0, min: 0, savedFood: [], foodDate: [:], weightDate: [:], caloriesDate: [:])
        
        registrationUser(userInfo: user)
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
    
    func registrationUser(userInfo: UserInfo) {
        view?.setLoader()
        Task {
            do {
                let success = try await userInfoModelServer.setUserInfo(user: userInfo)
            } catch {
                print("Error set user")
            }
            await MainActor.run { [weak self] in
                self?.view?.stopLoader()
            }
        }
    }
    
}
