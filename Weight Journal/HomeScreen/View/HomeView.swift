//
//  HomeView.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    let size = Size.shared
    
    private lazy var labelHello: UILabel = {
        let label = UILabel()
        label.text = StringConstantsHome.helloText
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: frame.width, height: size.scaleHeight(430))
        scrollView.frame = bounds
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var viewCitate: UIView = {
        let view = UIView()
        view.backgroundColor = .colorRectangleView
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textCitate: UILabel = {
        let label = UILabel()
        label.text = StringConstantsHome.descriptionHome
        label.textColor = .colorFhy
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var buttonWeight = UIButton().buttonMainScreen(size: size)
    private lazy var labelWeight = UILabel().labelOnButton(text: StringConstantsHome.weightMeasurement, size: size)
    private lazy var circle1 = UIView().circle(size: size)
    private lazy var imageWeight: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "weightIcon")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var buttonCalories = UIButton().buttonMainScreen(size: size)
    private lazy var labelCalories = UILabel().labelOnButton(text: StringConstantsHome.calories, size: size)
    private lazy var circle2 = UIView().circle(size: size)
    private lazy var imageCalories: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "caloriesIcon")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var buttonWater = UIButton().buttonMainScreen(size: size)
    private lazy var labelWater = UILabel().labelOnButton(text: StringConstantsHome.water, size: size)
    private lazy var circle3 = UIView().circle(size: size)
    private lazy var imageWater: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "waterIcon")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var buttonTrain = UIButton().buttonMainScreen(size: size)
    private lazy var labelTrain = UILabel().labelOnButton(text: StringConstantsHome.workouts, size: size)
    private lazy var circle4 = UIView().circle(size: size)
    private lazy var imageTrain: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "trainIcon")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = size.scaleWidth(13)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView2: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = size.scaleWidth(13)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setNameLabel(name: String) {
        labelName.text = name
    }

    func setupView() {
        addSubview(labelHello)
        addSubview(labelName)
        addSubview(viewCitate)
        viewCitate.addSubview(textCitate)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(stackView2)
        
        stackView.addArrangedSubview(buttonWeight)
        buttonWeight.addSubview(labelWeight)
        buttonWeight.addSubview(circle1)
        buttonWeight.addSubview(imageWeight)
        
        stackView.addArrangedSubview(buttonCalories)
        buttonCalories.addSubview(labelCalories)
        buttonCalories.addSubview(circle2)
        buttonCalories.addSubview(imageCalories)
        
        stackView2.addArrangedSubview(buttonWater)
        buttonWater.addSubview(labelWater)
        buttonWater.addSubview(circle3)
        buttonWater.addSubview(imageWater)
        
        stackView2.addArrangedSubview(buttonTrain)
        buttonTrain.addSubview(labelTrain)
        buttonTrain.addSubview(circle4)
        buttonTrain.addSubview(imageTrain)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            labelHello.topAnchor.constraint(equalTo: topAnchor, constant: size.scaleHeight(80)),
            labelHello.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(24)),
            labelName.leadingAnchor.constraint(equalTo: labelHello.trailingAnchor, constant: size.scaleWidth(7)),
            labelName.topAnchor.constraint(equalTo: labelHello.topAnchor),
            labelName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: size.scaleWidth(24)),
            
            viewCitate.topAnchor.constraint(equalTo: topAnchor, constant: size.scaleHeight(130)),
            viewCitate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(18)),
            viewCitate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(18)),
            viewCitate.heightAnchor.constraint(equalToConstant: size.scaleHeight(74)),
            textCitate.leadingAnchor.constraint(equalTo: viewCitate.leadingAnchor, constant: size.scaleWidth(18)),
            textCitate.trailingAnchor.constraint(equalTo: viewCitate.trailingAnchor, constant: -size.scaleWidth(18)),
            textCitate.centerYAnchor.constraint(equalTo: viewCitate.centerYAnchor),

            scrollView.topAnchor.constraint(equalTo: viewCitate.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: size.scaleHeight(200)),
            
            stackView2.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: size.scaleHeight(10)),
            stackView2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView2.heightAnchor.constraint(equalToConstant: size.scaleHeight(200)),
            
            
            
            ])
        scrollViewButtons(label: labelWeight, button: buttonWeight, view: circle1, image: imageWeight, width: 88)
        scrollViewButtons(label: labelCalories, button: buttonCalories, view: circle2, image: imageCalories, width: 88)
        scrollViewButtons(label: labelWater, button: buttonWater, view: circle3, image: imageWater, width: 95)
        scrollViewButtons(label: labelTrain, button: buttonTrain, view: circle4, image: imageTrain, width: 128)
    }
    
    private func scrollViewButtons(label: UILabel, button: UIButton, view: UIView, image: UIImageView, width: CGFloat) {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: button.topAnchor, constant: size.scaleHeight(20)),
            label.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: size.scaleWidth(20)),
            view.topAnchor.constraint(equalTo: button.topAnchor, constant: size.scaleHeight(70)),
            view.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: size.scaleWidth(45)),
            
            image.widthAnchor.constraint(equalToConstant: size.scaleWidth(width)),
            image.heightAnchor.constraint(equalToConstant: size.scaleHeight(165)),
            image.topAnchor.constraint(equalTo: button.topAnchor, constant: size.scaleHeight(55)),
            image.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: size.scaleHeight(52))
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

