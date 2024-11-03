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
        return stack
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
    
    lazy var imageWomen: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "womenImage")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var imageMan: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "manImage")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
    
    lazy var selectOne: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = size.scaleHeight(33/2)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        return view
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
    
    lazy var selectTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = size.scaleHeight(33/2)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        return view
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
    
    lazy var selectThree: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = size.scaleHeight(33/2)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customYellow.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        view.heightAnchor.constraint(equalToConstant: size.scaleWidth(33)).isActive = true
        return view
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
        stack.spacing = size.scaleHeight(3)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: size.scaleWidth(115)).isActive = true
        stack.heightAnchor.constraint(equalToConstant: size.scaleHeight(60)).isActive = true
        return stack
    }()
    
    lazy var stackViewTwo: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = size.scaleHeight(3)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: size.scaleWidth(115)).isActive = true
        stack.heightAnchor.constraint(equalToConstant: size.scaleHeight(60)).isActive = true
        return stack
    }()
    
    lazy var stackViewThree: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = size.scaleHeight(3)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: size.scaleWidth(115)).isActive = true
        stack.heightAnchor.constraint(equalToConstant: size.scaleHeight(60)).isActive = true
        return stack
    }()
    
    lazy var stackMain: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = size.scaleWidth(30)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.heightAnchor.constraint(equalToConstant: size.scaleHeight(60)).isActive = true
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
