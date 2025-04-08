//
//  AuthView.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import UIKit


class AuthenticateView: UIView {
    
    let size = Size.shared
    
    lazy var imageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "authIcon")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: size.scaleWidth(226)).isActive = true
        image.heightAnchor.constraint(equalToConstant: size.scaleHeight(183)).isActive = true
        return image
    }()
    
    lazy var labelCreateAccount: UILabel = {
        let lbl = UILabel()
        lbl.text = StringConstantsAuth.create
        lbl.font = .systemFont(ofSize: 20, weight: .medium)
        lbl.textColor = .colorBlack1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var label1: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.textColor = .colorBlack1
        lbl.text = StringConstantsAuth.alreadyHave
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var buttonLabelSignIn: UIButton = {
        let lbl = UIButton()
        lbl.setTitle(StringConstantsAuth.logIn, for: .normal)
        lbl.setTitleColor(.colorPurple, for: .normal)
        lbl.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var stackView1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var label3: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.textColor = .colorBlack1
        lbl.text = StringConstantsAuth.create
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var buttonLabelRegistration: UIButton = {
        let lbl = UIButton()
        lbl.setTitle(StringConstantsAuth.registration, for: .normal)
        lbl.setTitleColor(.colorPurple, for: .normal)
        lbl.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var stackView2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alpha = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var textFieldName = UITextField().authField(size: size, placeholder: StringConstantsAuth.name)
    lazy var textFieldEmail = UITextField().authField(size: size, placeholder: StringConstantsAuth.email)
    lazy var textFieldPassword = UITextField().authField(size: size, placeholder: StringConstantsAuth.password)
    
//    lazy var textFieldWeightNow = UITextField().authField(size: size, placeholder: "Вес сейчас")
//    lazy var textFieldWeightGoal = UITextField().authField(size: size, placeholder: "Вес цель")
//    lazy var textFieldCaloriesGoal = UITextField().authField(size: size, placeholder: "Калории цель")
    
    lazy var buttonRegistration = UIButton().buttonLogIn(size: size, text: StringConstantsAuth.registration)
    lazy var buttonSignIn = UIButton().buttonLogIn(size: size, text: StringConstantsAuth.logIn)
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentSize = CGSize(width: frame.width, height: size.scaleHeight(430))
        view.frame = bounds
        view.alwaysBounceVertical = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        addSubview(imageIcon)
        addSubview(labelCreateAccount)
        addSubview(scrollView)
        addSubview(textFieldName)
        addSubview(textFieldEmail)
        addSubview(textFieldPassword)
        addSubview(buttonRegistration)
        addSubview(buttonSignIn)
        buttonSignIn.alpha = 0
        addSubview(stackView1)
        stackView1.addArrangedSubview(label1)
        stackView1.addArrangedSubview(buttonLabelSignIn)
        addSubview(stackView2)
        stackView2.addArrangedSubview(label3)
        stackView2.addArrangedSubview(buttonLabelRegistration)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageIcon.topAnchor.constraint(equalTo: topAnchor, constant: size.scaleHeight(70)),
            
            labelCreateAccount.topAnchor.constraint(equalTo: imageIcon.bottomAnchor, constant: size.scaleHeight(30)),
            labelCreateAccount.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelCreateAccount.bottomAnchor, constant: size.scaleHeight(30)),
            textFieldEmail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            textFieldEmail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(16)),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: size.scaleHeight(10)),
            textFieldPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            textFieldPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(16)),
            
            textFieldName.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: size.scaleHeight(10)),
            textFieldName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            textFieldName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(16)),
            
            buttonRegistration.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: size.scaleHeight(30)),
            buttonRegistration.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackView1.topAnchor.constraint(equalTo: buttonRegistration.bottomAnchor, constant: size.scaleHeight(60)),
            stackView1.centerXAnchor.constraint(equalTo: buttonRegistration.centerXAnchor),
            
            buttonSignIn.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: size.scaleHeight(30)),
            buttonSignIn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            
            stackView2.topAnchor.constraint(equalTo: buttonSignIn.bottomAnchor, constant: size.scaleHeight(60)),
            stackView2.centerXAnchor.constraint(equalTo: buttonSignIn.centerXAnchor),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
