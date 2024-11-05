//
//  AuthViewModel.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import RxSwift
import RxCocoa


class AuthViewModel {
    
    static let shared = AuthViewModel()
    
    let model = AuthModel()
    
    var delegate: LoaderProtocol?
    
    let email = PublishSubject<String>()
    let password = PublishSubject<String>()
    let name = PublishSubject<String>()
    private let disposeBag = DisposeBag()
    
    var currentEmail: String = ""
    var currentPassword: String = ""
    var currentName: String = ""
    
    
    let authModel = FirebaseAuthenticate.shared
    
    init() {
        subscribeOnUpdate()
        authModel.delegate = self
    }
    
    func registrationCurrent() -> Bool {
        return model.isNameValid(currentName) &&
        model.isEmailValid(currentEmail) &&
        model.isPasswordValid(currentPassword)
    }
    
    func logIn() {
        authModel.logIn(email: currentEmail, password: currentPassword)
    }
    
    private func subscribeOnUpdate() {
        email.subscribe(onNext: { [weak self] value in
            self?.currentEmail = value
        }).disposed(by: disposeBag)
        
        password.subscribe(onNext: { [weak self] value in
            self?.currentPassword = value
        }).disposed(by: disposeBag)
        
        name.subscribe(onNext: { [weak self] value in
            self?.currentName = value
        }).disposed(by: disposeBag)
    }
}


extension AuthViewModel: LoaderProtocol {
    func stopLoad() {
        delegate?.stopLoad()
    }
    
    
}
