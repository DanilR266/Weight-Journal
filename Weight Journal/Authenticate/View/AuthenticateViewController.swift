//
//  AuthController.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import UIKit


class AuthenticateViewController: UIViewController {
    
    var presenter: AuthenticatePresenteeProtocol?
    
    private var imageTopConstraint: NSLayoutConstraint!
    private var registrationConstraint: NSLayoutConstraint!
    private var signInConstraint: NSLayoutConstraint!
    
    private let subView = AuthenticateView()
    private let loaderView = LoadView()
    
    let size = Size.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupActions()
        setupFields()
        setupDynamicConstraint()
    }
    
    override func loadView() {
        super.loadView()
        view = subView
    }
    
    private func setupFields() {
        subView.textFieldName.delegate = self
        subView.textFieldEmail.delegate = self
        subView.textFieldPassword.delegate = self
    }
    
    private func setupDynamicConstraint() {
        imageTopConstraint = subView.imageIcon.topAnchor.constraint(equalTo: subView.topAnchor, constant: size.scaleHeight(70))
        imageTopConstraint.isActive = true
    }
    
    func setupActions() {
        subView.buttonRegistration.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        subView.buttonLabelSignIn.addTarget(self, action: #selector(signInLabelButtonTapped), for: .touchUpInside)
        subView.buttonLabelRegistration.addTarget(self, action: #selector(registrationLabelButtonTapped), for: .touchUpInside)
        subView.buttonSignIn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
    }
}

extension AuthenticateViewController: AuthenticateViewProtocol {
    
    func pushViewController(vc: UIViewController) {
        guard let sceneDelegate = UIApplication.shared.connectedScenes
            .first?.delegate as? SceneDelegate else { return }
        let navVC = UINavigationController(rootViewController: vc)
        sceneDelegate.window?.rootViewController = navVC
    }
    
    func changeConstraint(_ constant: CGFloat, _ begin: Bool) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self else { return }
            self.imageTopConstraint.constant = self.size.scaleHeight(constant)
            self.view.layoutIfNeeded()
        }
    }
    
    func buttonsAnimation(_ alphaFirst: CGFloat, _ alphaSecond: CGFloat) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self else { return }
            self.subView.buttonRegistration.alpha = alphaFirst
            self.subView.stackView1.alpha = alphaFirst
            self.subView.textFieldName.alpha = alphaFirst
            self.subView.buttonSignIn.alpha = alphaSecond
            self.subView.stackView2.alpha = alphaSecond
            self.view.layoutIfNeeded()
        }
    }
    
    func stopLoader() {
        loaderView.removeFromSuperview()
        view.layoutIfNeeded()
    }
    
    func setLoader() {
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loaderView)
        NSLayoutConstraint.activate([
            loaderView.topAnchor.constraint(equalTo: subView.topAnchor),
            loaderView.leadingAnchor.constraint(equalTo: subView.leadingAnchor)
        ])
        view.layoutIfNeeded()
    }
}

extension AuthenticateViewController {
    
    @objc func registrationButtonTapped() {
        let name = subView.textFieldName.text ?? ""
        let email = subView.textFieldEmail.text ?? ""
        let password = subView.textFieldPassword.text ?? ""
        presenter?.registerUser(name: name, email: email, password: password)
    }
    
    @objc func loginButtonTapped() {
        let email = subView.textFieldEmail.text ?? ""
        let password = subView.textFieldPassword.text ?? ""
        presenter?.loginUser(email: email, password: password)
    }
    
    @objc func signInLabelButtonTapped() {
        presenter?.buttonLabelSignIn()
    }
    
    @objc func registrationLabelButtonTapped() {
        presenter?.buttonLabelRegistration()
    }
}

extension AuthenticateViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        presenter?.changeConstraintsView(-20, true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter?.changeConstraintsView(70, false)
    }
}
