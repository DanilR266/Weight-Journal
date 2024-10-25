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


class AuthController: UIViewController {
    
    private let authViewModel: AuthViewModel
    private let authView = AuthView()
    
    private let disposeBag = DisposeBag()
    
    var labelTopConstraint: NSLayoutConstraint!
    var registrationConstraint: NSLayoutConstraint!
    var signInConstraint: NSLayoutConstraint!
    
    let size = Size()
    
    init(authViewModel: AuthViewModel = .shared) {
        self.authViewModel = authViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindToViewModel()
        
        setupUI()
        setupButtonsActions()
    }
    
    override func loadView() {
        super.loadView()
        view = authView
    }
    
    private func setupUI() {
        view.backgroundColor = .backgroundColor
        authView.textFieldName.delegate = self
        authView.textFieldEmail.delegate = self
        authView.textFieldPassword.delegate = self
        
        labelTopConstraint = authView.labelCreateAccount.topAnchor.constraint(equalTo: authView.topAnchor, constant: 280)
        labelTopConstraint.isActive = true
    }
    
    private func changeConstraint(_ constant: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            self.labelTopConstraint.constant = self.size.scaleHeight(constant)
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func buttonRegistrationTap() {
        authViewModel.registration()
//        authView.textFieldName.text = ""
//        authView.textFieldEmail.text = ""
//        authView.textFieldPassword.text = ""
        buttonLabel2()
    }
    
    @objc func buttonLabel2() {
        UIView.animate(withDuration: 0.2) {
            self.authView.buttonRegistration.alpha = 0
            self.authView.stackView1.alpha = 0
            self.authView.textFieldName.alpha = 0
            self.authView.buttonSignIn.alpha = 1
            self.authView.stackView2.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func buttonLabel4() {
        UIView.animate(withDuration: 0.2) {
            self.authView.buttonRegistration.alpha = 1
            self.authView.stackView1.alpha = 1
            self.authView.textFieldName.alpha = 1
            self.authView.buttonSignIn.alpha = 0
            self.authView.stackView2.alpha = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func buttonSignIn() {
        authViewModel.logIn()
    }
    
    private func setupButtonsActions() {
        authView.buttonRegistration.addTarget(self, action: #selector(buttonRegistrationTap), for: .touchUpInside)
        authView.label2.addTarget(self, action: #selector(buttonLabel2), for: .touchUpInside)
        authView.label4.addTarget(self, action: #selector(buttonLabel4), for: .touchUpInside)
        authView.buttonSignIn.addTarget(self, action: #selector(buttonSignIn), for: .touchUpInside)
        
    }
    
}

extension AuthController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        changeConstraint(180)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        changeConstraint(280)
    }
}

extension AuthController {
    
    private func bindToViewModel() {
        
        authView.textFieldEmail.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: authViewModel.email)
            .disposed(by: disposeBag)
        
        authView.textFieldPassword.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: authViewModel.password)
            .disposed(by: disposeBag)
        
        authView.textFieldName.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: authViewModel.name)
            .disposed(by: disposeBag)
    }
    
}
