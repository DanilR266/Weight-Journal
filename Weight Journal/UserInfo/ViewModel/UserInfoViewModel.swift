//
//  UserInfoViewModel.swift
//  Weight Journal
//
//  Created by Данила on 03.11.2024.
//

import Foundation
import RxSwift
import RxCocoa


class UserInfoViewModel {
    
    var currentAge: String = "", currentHeight: String = "", currentWeightNow: String = ""
    var currentWeightGoal: String = "", currentCcal: String = "", getCalories: Int = 0
    
    let userModel = UserInfoModel()
    let authModel = AuthModel()
    var sex = SelectedSex.none
    var selectGoal = SelectGoal.regular
    
    var delegate: LoaderProtocol?
    
    let age = PublishSubject<String>()
    let height = PublishSubject<String>()
    let weightNow = PublishSubject<String>()
    let weightGoal = PublishSubject<String>()
    let ccal = PublishSubject<String>()
    let getCcal = PublishSubject<Int>()
    private let disposeBag = DisposeBag()
    
    var userInfo: UserInfo?
    
    let firebaseModel = FirebaseAuthenticate.shared
    
    static let shared = UserInfoViewModel()
    
    init() {
        subscribeOnUpdate()
        firebaseModel.delegate = delegate
    }
    
    func checkValidString(textField: NSString?, range: NSRange,
                          string: String, textFieldText: String?) -> Bool {
        return ValidationTextFieldInput.shared.checkValidString(textField: textField, range: range, string: string, textFieldText: textFieldText)
    }
    
    
    func getCurrentCcal() {
        getCcal.onNext(userModel.getCurrentCcal(Int(currentAge) ?? 20,
                                                Double(currentHeight) ?? 180,
                                                Double(currentWeightNow) ?? 70,
                                                sex, selectGoal))
    }
    
    
    private func subscribeOnUpdate() {
        age.subscribe(onNext: { [weak self] value in
            self?.currentAge = value
        }).disposed(by: disposeBag)
        
        height.subscribe(onNext: { [weak self] value in
            self?.currentHeight = value
        }).disposed(by: disposeBag)
        
        weightNow.subscribe(onNext: { [weak self] value in
            self?.currentWeightNow = value
        }).disposed(by: disposeBag)
        
        weightGoal.subscribe(onNext: { [weak self] value in
            self?.currentWeightGoal = value
        }).disposed(by: disposeBag)
        
        ccal.subscribe(onNext: { [weak self] value in
            self?.currentCcal = value
        }).disposed(by: disposeBag)
        
        getCcal.subscribe(onNext: { [weak self] value in
            self?.getCalories = value
        }).disposed(by: disposeBag)
    }
    
    func registration(name: String, email: String, password: String) {
        if authModel.isEmailValid(email) &&
            authModel.isPasswordValid(password) &&
            authModel.isNameValid(name) {
            firebaseModel.registration(email: email, password: password, name: name,
                                       age: Int(currentAge) ?? 20, calories: Int(currentCcal) ?? Int(getCalories),
                                       height: Double(currentHeight) ?? 180, weightNow: Double(currentWeightNow) ?? 70,
                                       weightGoal: Double(currentWeightGoal) ?? 70, sex: sex.rawValue)
        }
    }
    
}


extension UserInfoViewModel: LoaderProtocol {
    func stopLoad() {
        delegate?.stopLoad()
    }
    
    
}
