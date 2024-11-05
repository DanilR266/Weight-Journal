//
//  AuthController.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class AuthController: BaseUIViewController {
    
    private let authViewModel: AuthViewModel
    
    private let disposeBag = DisposeBag()
    
    var imageTopConstraint: NSLayoutConstraint!
    var registrationConstraint: NSLayoutConstraint!
    var signInConstraint: NSLayoutConstraint!
    let subView = AuthView()
    let loadView = LoadView()
    
    init(authViewModel: AuthViewModel = .shared) {
        self.authViewModel = authViewModel
        super.init(customView: subView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authViewModel.delegate = self
        bindToViewModel()
        setupFields()
        setupDynamicConstraint()
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
    
    private func changeConstraint(_ constant: CGFloat, _ begin: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.imageTopConstraint.constant = self.size.scaleHeight(constant)
            self.view.layoutIfNeeded()
        }
    }
    
    private func setLoader() {
        loadView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadView)
        NSLayoutConstraint.activate([
            loadView.topAnchor.constraint(equalTo: subView.topAnchor),
            loadView.leadingAnchor.constraint(equalTo: subView.leadingAnchor)
        ])
    }
    
    override func setupActions() {
        subView.buttonRegistration.addTarget(self, action: #selector(buttonRegistrationTap), for: .touchUpInside)
        subView.label2.addTarget(self, action: #selector(buttonLabel2), for: .touchUpInside)
        subView.label4.addTarget(self, action: #selector(buttonLabel4), for: .touchUpInside)
        subView.buttonSignIn.addTarget(self, action: #selector(buttonSignIn), for: .touchUpInside)
        
    }
    
}

extension AuthController {
    @objc func buttonRegistrationTap() {
        if authViewModel.registrationCurrent() {
            let vc = UserInfoController(name: authViewModel.currentName, email: authViewModel.currentEmail, password: authViewModel.currentPassword)
            self.navigationController?.pushViewController(vc, animated: true)
        }
//        authViewModel.registration()
//        authView.textFieldName.text = ""
//        authView.textFieldEmail.text = ""
//        authView.textFieldPassword.text = ""
//        buttonLabel2()
        
    }
    
    @objc func buttonLabel2() {
        UIView.animate(withDuration: 0.2) {
            self.subView.buttonRegistration.alpha = 0
            self.subView.stackView1.alpha = 0
            self.subView.textFieldName.alpha = 0
            self.subView.buttonSignIn.alpha = 1
            self.subView.stackView2.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func buttonLabel4() {
        UIView.animate(withDuration: 0.2) {
            self.subView.buttonRegistration.alpha = 1
            self.subView.stackView1.alpha = 1
            self.subView.textFieldName.alpha = 1
            self.subView.buttonSignIn.alpha = 0
            self.subView.stackView2.alpha = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func buttonSignIn() {
        setLoader()
        authViewModel.logIn()
    }
}

extension AuthController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        changeConstraint(-20, true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        changeConstraint(70, false)
    }
}

extension AuthController {
    
    private func bindToViewModel() {
        
        subView.textFieldEmail.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: authViewModel.email)
            .disposed(by: disposeBag)
        
        subView.textFieldPassword.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: authViewModel.password)
            .disposed(by: disposeBag)
        
        subView.textFieldName.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: authViewModel.name)
            .disposed(by: disposeBag)
    }
    
}

extension AuthController: LoaderProtocol {
    func stopLoad() {
        loadView.removeFromSuperview()
        view.layoutIfNeeded()
    }
    
    
}
