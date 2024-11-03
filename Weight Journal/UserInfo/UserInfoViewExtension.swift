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
        addSubview(helloLabel)
        addSubview(textLabel)
        addSubview(buttonNext)
        addSubview(stackCircle)
        stackCircle.addArrangedSubview(circle1)
        stackCircle.addArrangedSubview(circle2)
        stackCircle.addArrangedSubview(circle3)
        
        addSubview(pointOne)
        addSubview(imageWomen)
        addSubview(imageMan)
        addSubview(labelWomen)
        addSubview(labelMan)
        
        addSubview(pointTwo)
        addSubview(stackViewOne)
        stackViewOne.addArrangedSubview(labelOne)
        stackViewOne.addArrangedSubview(selectOne)
        addSubview(stackViewTwo)
        stackViewTwo.addArrangedSubview(labelTwo)
        stackViewTwo.addArrangedSubview(selectTwo)
        addSubview(stackViewThree)
        stackViewThree.addArrangedSubview(labelThree)
        stackViewThree.addArrangedSubview(selectThree)
        addSubview(stackMain)
        stackMain.addArrangedSubview(stackViewOne)
        stackMain.addArrangedSubview(stackViewTwo)
        stackMain.addArrangedSubview(stackViewThree)
        addSubview(fieldAge)
        addSubview(fieldHeight)
        addSubview(fieldWeightNow)
        addSubview(fieldWeightGoal)
        
        addSubview(pointThree)
        addSubview(descriptionCcal)
        addSubview(labelGetCcal)
        addSubview(descriptionCcal2)
        addSubview(fieldCcal)
    }
    
    func setupConstraintsExtension() {
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: topAnchor, constant: size.scaleHeight(44)),
            helloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(27)),
            helloLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(27)),
            
            textLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: size.scaleHeight(8)),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.scaleWidth(27)),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(27)),
            
            stackCircle.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackCircle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -size.scaleHeight(120)),
            stackCircle.heightAnchor.constraint(equalToConstant: size.scaleHeight(10)),
            stackCircle.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackCircle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            buttonNext.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonNext.bottomAnchor.constraint(equalTo: stackCircle.topAnchor, constant: -size.scaleHeight(30)),
            
            pointOne.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            
            imageWomen.topAnchor.constraint(equalTo: pointOne.bottomAnchor, constant: size.scaleHeight(80)),
            imageWomen.leadingAnchor.constraint(equalTo: pointOne.leadingAnchor, constant: size.scaleWidth(54)),
            labelWomen.centerXAnchor.constraint(equalTo: imageWomen.centerXAnchor),
            labelWomen.topAnchor.constraint(equalTo: imageWomen.bottomAnchor, constant: size.scaleHeight(21)),
            
            imageMan.topAnchor.constraint(equalTo: pointOne.bottomAnchor, constant: size.scaleHeight(80)),
            imageMan.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.scaleWidth(81)),
            labelMan.centerXAnchor.constraint(equalTo: imageMan.centerXAnchor),
            labelMan.topAnchor.constraint(equalTo: imageMan.bottomAnchor, constant: size.scaleHeight(21)),
            
            pointTwo.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            
            stackMain.topAnchor.constraint(equalTo: pointTwo.bottomAnchor, constant: size.scaleHeight(47)),
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
