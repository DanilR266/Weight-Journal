//
//  UserInfoController.swift
//  Weight Journal
//
//  Created by Данила on 03.11.2024.
//

import Foundation
import UIKit


class UserInfoController: BaseUIViewController {
    
    let subView = UserInfoView()
    
    var name: String
    
    var page = 0
    
    var positionPageOne: NSLayoutConstraint!
    var positionPageTwo: NSLayoutConstraint!
    var positionPageThree: NSLayoutConstraint!
    
    var widthImageWomen: NSLayoutConstraint!
    var heightImageWomen: NSLayoutConstraint!
    var widthImageMan: NSLayoutConstraint!
    var heightImageMan: NSLayoutConstraint!
    
    init(name: String) {
        self.name = name
        super.init(customView: subView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupTextFields()
        setName()
        setupConstraints()
    }
    
    private func setupTextFields() {
        subView.fieldAge.delegate = self
        subView.fieldCcal.delegate = self
        subView.fieldHeight.delegate = self
        subView.fieldWeightNow.delegate = self
        subView.fieldWeightGoal.delegate = self
    }
    
    private func setupConstraints() {
        positionPageOne = subView.pointOne.topAnchor.constraint(equalTo: subView.textLabel.bottomAnchor, constant: size.scaleHeight(33))
        positionPageTwo = subView.pointTwo.topAnchor.constraint(equalTo: subView.textLabel.bottomAnchor, constant: size.screenHeight())
        positionPageThree = subView.pointThree.topAnchor.constraint(equalTo: subView.textLabel.bottomAnchor, constant: size.screenHeight())
        
        NSLayoutConstraint.activate([
            positionPageOne, positionPageTwo, positionPageThree
        ])
        
        heightImageWomen = subView.imageWomen.heightAnchor.constraint(equalToConstant: size.scaleHeight(170))
        widthImageWomen = subView.imageWomen.widthAnchor.constraint(equalToConstant: size.scaleWidth(57))
        heightImageMan = subView.imageMan.heightAnchor.constraint(equalToConstant: size.scaleHeight(170))
        widthImageMan = subView.imageMan.widthAnchor.constraint(equalToConstant: size.scaleWidth(57))
        
        NSLayoutConstraint.activate([
            heightImageWomen, widthImageWomen, heightImageMan, widthImageMan
        ])
    }
    
    private func setName() {
        subView.helloLabel.text = StringConstantsInfoUser.helloText + name
    }
    
    override func setupActions() {
        subView.buttonNext.addTarget(self, action: #selector(onButtonNextTap), for: .touchUpInside)
    }
    
}

extension UserInfoController {
    @objc func onButtonNextTap() {
        DispatchQueue.main.async {
            self.page += 1
            switch self.page {
            case 1:
                UIView.animate(withDuration: 0.4) {
                    self.positionPageOne.constant = -self.size.screenHeight()
                    self.positionPageTwo.constant = self.size.scaleHeight(33)
                    self.view.layoutIfNeeded()
                }
            case 2:
                UIView.animate(withDuration: 0.4) {
                    self.positionPageTwo.constant = -self.size.screenHeight()
                    self.positionPageThree.constant = self.size.scaleHeight(33)
                    self.view.layoutIfNeeded()
                }
            default:
                break
            }
        }
    }
}

extension UserInfoController: UITextFieldDelegate {
    
}
