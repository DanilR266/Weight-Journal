//
//  UserInfoViewExtension.swift
//  Weight Journal
//
//  Created by Данила on 03.11.2024.
//

import Foundation
import UIKit


extension UserInfoView {
    
    func setupViewExtension() {
        buttonNext.isEnabled = false
        addSubview(helloLabel)
        addSubview(textLabel)
        addSubview(buttonNext)
        addSubview(stackCircle)
        stackCircle.addArrangedSubview(circle1)
        stackCircle.addArrangedSubview(circle2)
        stackCircle.addArrangedSubview(circle3)
        
        addSubview(unView)
        
        unView.addSubview(pointOne)
        unView.addSubview(imageWomen)
        unView.addSubview(imageMan)
        unView.addSubview(labelWomen)
        unView.addSubview(labelMan)
        unView.addSubview(pointTwo)
        unView.addSubview(stackViewOne)
        stackViewOne.addArrangedSubview(labelOne)
        stackViewOne.addArrangedSubview(selectOne)
        unView.addSubview(stackViewTwo)
        stackViewTwo.addArrangedSubview(labelTwo)
        stackViewTwo.addArrangedSubview(selectTwo)
        unView.addSubview(stackViewThree)
        stackViewThree.addArrangedSubview(labelThree)
        stackViewThree.addArrangedSubview(selectThree)
        unView.addSubview(stackMain)
        stackMain.addArrangedSubview(stackViewOne)
        stackMain.addArrangedSubview(stackViewTwo)
        stackMain.addArrangedSubview(stackViewThree)
        unView.addSubview(fieldAge)
        unView.addSubview(fieldHeight)
        unView.addSubview(fieldWeightNow)
        unView.addSubview(fieldWeightGoal)
        
        unView.addSubview(pointThree)
        unView.addSubview(descriptionCcal)
        unView.addSubview(labelGetCcal)
        unView.addSubview(descriptionCcal2)
        unView.addSubview(fieldCcal)
    }
    
    func setupConstraintsExtension() {
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: topAnchor, constant: size.scaleHeight(60)),
            helloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(27)),
            helloLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(27)),
            
            textLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: size.scaleHeight(8)),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(27)),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(27)),
            
            stackCircle.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackCircle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -size.scaleHeight(120)),
            stackCircle.heightAnchor.constraint(equalToConstant: size.scaleHeight(10)),
            
            buttonNext.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonNext.bottomAnchor.constraint(equalTo: stackCircle.topAnchor, constant: -size.scaleHeight(30)),
            
            unView.centerXAnchor.constraint(equalTo: centerXAnchor),
            unView.topAnchor.constraint(equalTo: textLabel.bottomAnchor),
            unView.bottomAnchor.constraint(equalTo: buttonNext.topAnchor),
            
            pointOne.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            
            labelMan.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(76)),
            labelMan.topAnchor.constraint(equalTo: pointOne.bottomAnchor, constant: size.scaleHeight(320)),
            imageMan.bottomAnchor.constraint(equalTo: labelMan.topAnchor, constant: -size.scaleHeight(21)),
            imageMan.centerXAnchor.constraint(equalTo: labelMan.centerXAnchor),
            
            labelWomen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(76)),
            labelWomen.topAnchor.constraint(equalTo: pointOne.bottomAnchor, constant: size.scaleHeight(320)),
            imageWomen.bottomAnchor.constraint(equalTo: labelWomen.topAnchor, constant: -size.scaleHeight(21)),
            imageWomen.centerXAnchor.constraint(equalTo: labelWomen.centerXAnchor),
            
            pointTwo.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            
            stackMain.topAnchor.constraint(equalTo: pointTwo.bottomAnchor, constant: size.scaleHeight(27)),
            stackMain.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackMain.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackMain.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            fieldAge.topAnchor.constraint(equalTo: stackMain.bottomAnchor, constant: size.scaleHeight(34)),
            fieldAge.centerXAnchor.constraint(equalTo: centerXAnchor),
            fieldAge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            fieldAge.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(16)),
            fieldHeight.topAnchor.constraint(equalTo: fieldAge.bottomAnchor, constant: size.scaleHeight(10)),
            fieldHeight.centerXAnchor.constraint(equalTo: centerXAnchor),
            fieldHeight.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            fieldHeight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(16)),
            fieldWeightNow.topAnchor.constraint(equalTo: fieldHeight.bottomAnchor, constant: size.scaleHeight(10)),
            fieldWeightNow.centerXAnchor.constraint(equalTo: centerXAnchor),
            fieldWeightNow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            fieldWeightNow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(16)),
            fieldWeightGoal.topAnchor.constraint(equalTo: fieldWeightNow.bottomAnchor, constant: size.scaleHeight(10)),
            fieldWeightGoal.centerXAnchor.constraint(equalTo: centerXAnchor),
            fieldWeightGoal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            fieldWeightGoal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(16)),
            
            pointThree.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            
            descriptionCcal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(27)),
            descriptionCcal.topAnchor.constraint(equalTo: pointThree.bottomAnchor, constant: size.scaleHeight(40)),
            descriptionCcal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(40)),
            
            labelGetCcal.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelGetCcal.topAnchor.constraint(equalTo: descriptionCcal.bottomAnchor, constant: size.scaleHeight(15)),
            labelGetCcal.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelGetCcal.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            descriptionCcal2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(27)),
            descriptionCcal2.topAnchor.constraint(equalTo: labelGetCcal.bottomAnchor, constant: size.scaleHeight(15)),
            descriptionCcal2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(40)),
            
            fieldCcal.centerXAnchor.constraint(equalTo: centerXAnchor),
            fieldCcal.topAnchor.constraint(equalTo: descriptionCcal2.bottomAnchor, constant: size.scaleHeight(15)),
            fieldCcal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(16)),
            fieldCcal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(16)),
            
        ])
    }
    
}
