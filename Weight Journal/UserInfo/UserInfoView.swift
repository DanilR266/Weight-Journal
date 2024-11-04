//
//  UserInfoView.swift
//  Weight Journal
//
//  Created by Данила on 03.11.2024.
//

import Foundation
import UIKit


class UserInfoView: BaseUIView {
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.helloText
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.description
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()
    
    lazy var buttonNext = UIButton().buttonLogIn(size: size, text: StringConstantsInfoUser.next)
    
    lazy var circle1: UIView = {
        let view = UIView()
        view.backgroundColor = .colorBlack1
        view.layer.cornerRadius = size.scaleHeight(10/2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(10)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleWidth(10)).isActive = true
        return view
    }()
    
    lazy var circle2: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = size.scaleHeight(10/2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(10)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleWidth(10)).isActive = true
        return view
    }()
    
    lazy var circle3: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = size.scaleHeight(10/2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(10)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleWidth(10)).isActive = true
        return view
    }()
    
    lazy var stackCircle: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: size.scaleWidth(40)).isActive = true
        return stack
    }()
    
    lazy var unView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.screenWidth()).isActive = true
        return view
    }()
    
    // MARK: Page one
    
    lazy var pointOne: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.pointOneText
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .colorBlack1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    lazy var imageWomen: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "womenImage"), for: [])
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var imageMan: UIButton = {
        let button = UIButton()
        button.setImage( UIImage(named: "manImage"), for: [])
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var labelWomen: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.women
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    lazy var labelMan: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.man
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: Page two
    
    lazy var pointTwo: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.pointTwoText
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .colorBlack1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    lazy var selectOne: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = size.scaleHeight(33/2)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        button.heightAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        return button
    }()
    
    lazy var labelOne: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.selectOneText
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    lazy var selectTwo: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = size.scaleHeight(33/2)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        button.heightAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        return button
    }()
    
    lazy var labelTwo: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.selectTwoText
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    lazy var selectThree: UIButton = {
        let button = UIButton()
        button.backgroundColor = .customYellow
        button.layer.cornerRadius = size.scaleHeight(33/2)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        button.heightAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        return button
    }()
    
    lazy var labelThree: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.selectThreeText
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    lazy var stackViewOne: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = size.scaleHeight(3)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: size.scaleWidth(115)).isActive = true
        stack.heightAnchor.constraint(equalToConstant: size.scaleHeight(60)).isActive = true
        return stack
    }()
    
    lazy var stackViewTwo: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = size.scaleHeight(3)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: size.scaleWidth(115)).isActive = true
        stack.heightAnchor.constraint(equalToConstant: size.scaleHeight(60)).isActive = true
        return stack
    }()
    
    lazy var stackViewThree: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = size.scaleHeight(3)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: size.scaleWidth(115)).isActive = true
        stack.heightAnchor.constraint(equalToConstant: size.scaleHeight(60)).isActive = true
        return stack
    }()
    
    lazy var stackMain: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = size.scaleWidth(10)
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.heightAnchor.constraint(equalToConstant: size.scaleHeight(60)).isActive = true
//        stack.widthAnchor.constraint(equalToConstant: size.scaleWidth(323)).isActive = true
        return stack
    }()
    
    lazy var fieldAge = UITextField().authField(size: size, placeholder: StringConstantsInfoUser.age)
    lazy var fieldHeight = UITextField().authField(size: size, placeholder: StringConstantsInfoUser.height)
    lazy var fieldWeightNow = UITextField().authField(size: size, placeholder: StringConstantsInfoUser.weightNow)
    lazy var fieldWeightGoal = UITextField().authField(size: size, placeholder: StringConstantsInfoUser.weightGoal)
    
    
    // MARK: Page three
    
    lazy var pointThree: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.pointTwoText
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .colorBlack1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    lazy var descriptionCcal: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.ccalDescription
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = .colorBlack1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        return label
    }()
    
    lazy var labelGetCcal: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .colorBlack1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    lazy var descriptionCcal2: UILabel = {
        let label = UILabel()
        label.text = StringConstantsInfoUser.ccalDescription2
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .colorBlack1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    lazy var fieldCcal = UITextField().authField(size: size, placeholder: StringConstantsInfoUser.goalCcal)
    
    
    override func setupView() {
        setupViewExtension()
    }
    
    override func setupConstraints() {
        setupConstraintsExtension()
    }
    
}
