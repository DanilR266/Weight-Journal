//
//  AuthViewModel.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation


class AuthenticatePresenter {
    
    private let authenticateModel = AuthenticateValidateModel()
    private weak var view: AuthenticateViewProtocol?
    
    private let authenticateModelServer: AuthorizationManagerProtocol
    
    init(view: AuthenticateViewProtocol, authenticateModelServer: AuthorizationManagerProtocol = AuthorizationManager.shared) {
        self.view = view
        self.authenticateModelServer = authenticateModelServer
    }
}

extension AuthenticatePresenter: AuthenticatePresenteeProtocol {
    func registerUser(name: String, email: String, password: String) {
        guard
            !name.isEmpty, !email.isEmpty, !password.isEmpty,
            registrationCurrent(currentName: name, currentEmail: email, currentPassword: password)
        else { return }
        let user = UserRegistration(username: name, email: email, password: password)
        registrationUser(user: user)
    }
    
    func loginUser(email: String, password: String) {
        guard
            !email.isEmpty, !password.isEmpty,
            loginCurrent(currentEmail: email, currentPassword: password)
        else { return }
        let user = UserLogin(email: email, password: password)
        loginUser(user: user)
    }
    
    func buttonLabelSignIn() {
        view?.buttonsAnimation(0, 1)
    }
    
    func buttonLabelRegistration() {
        view?.buttonsAnimation(1, 0)
    }
    
    func changeConstraintsView(_ constant: CGFloat, _ begin: Bool) {
        view?.changeConstraint(constant, begin)
    }
}

extension AuthenticatePresenter {
    
    func loginUser(user: UserLogin) {
        view?.setLoader()
        Task {
            do {
                let success = try await authenticateModelServer.loginUser(user: user)
                await MainActor.run { [weak self] in
                    self?.view?.stopLoader()
                    let vc = HomeBuilder.build()
                    self?.view?.pushViewController(vc: vc)
                }
            }
            catch {
                print("Error auth: \(error)")
            }
            await MainActor.run { [weak self] in
                self?.view?.stopLoader()
            }
        }
    }
    
    func registrationUser(user: UserRegistration) {
        view?.setLoader()
        Task {
            do {
                let success = try await authenticateModelServer.registrationUser(user: user)
                await MainActor.run { [weak self] in
                    self?.view?.stopLoader()
                    let vc = UserInfoBuilder.build(name: success.name, email: success.email, userId: success.user_id)
                    self?.view?.pushViewController(vc: vc)
                }
            } catch {
                print("Error auth: \(error)")
            }
            await MainActor.run { [weak self] in
                self?.view?.stopLoader()
            }
        }
    }
    
    private func registrationCurrent(currentName: String, currentEmail: String, currentPassword: String) -> Bool {
        return authenticateModel.isNameValid(currentName) &&
        authenticateModel.isEmailValid(currentEmail) &&
        authenticateModel.isPasswordValid(currentPassword)
    }
    
    private func loginCurrent(currentEmail: String, currentPassword: String) -> Bool {
        return authenticateModel.isEmailValid(currentEmail) &&
        authenticateModel.isPasswordValid(currentPassword)
    }
}
