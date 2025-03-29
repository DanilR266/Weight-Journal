////
////  UserInfoController.swift
////  Weight Journal
////
////  Created by Данила on 03.11.2024.
////

import Foundation
import UIKit


class UserInfoController: UIViewController {
    
    private let size = Size.shared
    
    var presenter: UserInfoPresenterProtocol?
    
    private let subView = UserInfoView()
    private let loaderView = LoadView()
    
    private var positionPageOne: NSLayoutConstraint!
    private var positionPageTwo: NSLayoutConstraint!
    private var positionPageThree: NSLayoutConstraint!
    
    private var widthButtonWomen: NSLayoutConstraint!
    private var heightButtonWomen: NSLayoutConstraint!
    private var widthButtonMan: NSLayoutConstraint!
    private var heightButtonMan: NSLayoutConstraint!
    private var widthImageWomen: NSLayoutConstraint!
    private var heightImageWomen: NSLayoutConstraint!
    private var widthImageMan: NSLayoutConstraint!
    private var heightImageMan: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        presenter?.viewDidload()
        setupActions()
        setupTextFields()
        setupConstraints()
    }
    
    override func loadView() {
        super.loadView()
        view = subView
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
        
        NSLayoutConstraint.activate([ positionPageOne, positionPageTwo, positionPageThree ])
        
        heightImageWomen = subView.imageWomen.heightAnchor.constraint(equalToConstant: size.scaleHeight(170))
        widthImageWomen = subView.imageWomen.widthAnchor.constraint(equalToConstant: size.scaleWidth(57))
        heightImageMan = subView.imageMan.heightAnchor.constraint(equalToConstant: size.scaleHeight(170))
        widthImageMan = subView.imageMan.widthAnchor.constraint(equalToConstant: size.scaleWidth(57))
        heightButtonWomen = subView.imageWomen.imageView?.heightAnchor.constraint(equalToConstant: size.scaleHeight(170))
        widthButtonWomen = subView.imageWomen.imageView?.widthAnchor.constraint(equalToConstant: size.scaleWidth(57))
        heightButtonMan = subView.imageMan.imageView?.heightAnchor.constraint(equalToConstant: size.scaleHeight(170))
        widthButtonMan = subView.imageMan.imageView?.widthAnchor.constraint(equalToConstant: size.scaleWidth(57))
        
        NSLayoutConstraint.activate([
            heightImageWomen, widthImageWomen, heightImageMan, widthImageMan,
            heightButtonWomen, widthButtonWomen, heightButtonMan, widthButtonMan
        ])
    }
    
    private func helpChangeConstraint(_ widthMan: CGFloat, _ heightMan: CGFloat, _ widthWomen: CGFloat, _ heightWomen: CGFloat) {
        widthImageWomen.constant = size.scaleWidth(widthWomen)
        heightImageWomen.constant = size.scaleHeight(heightWomen)
        widthButtonWomen.constant = size.scaleWidth(widthWomen)
        heightButtonWomen.constant = size.scaleHeight(heightWomen)
        
        widthImageMan.constant = size.scaleWidth(widthMan)
        widthButtonMan.constant = size.scaleWidth(widthMan)
        heightButtonMan.constant = size.scaleHeight(heightMan)
        heightImageMan.constant = size.scaleHeight(heightMan)
    }
    
    private func setupActions() {
        subView.buttonNext.addTarget(self, action: #selector(onButtonNextTap), for: .touchUpInside)
        subView.imageMan.addTarget(self, action: #selector(onButtonManTap), for: .touchUpInside)
        subView.imageWomen.addTarget(self, action: #selector(onButtonWomenTap), for: .touchUpInside)
        subView.selectOne.addTarget(self, action: #selector(onSelectOneTap), for: .touchUpInside)
        subView.selectTwo.addTarget(self, action: #selector(onSelectTwoTap), for: .touchUpInside)
        subView.selectThree.addTarget(self, action: #selector(onSelectThreeTap), for: .touchUpInside)
    }
    
}

extension UserInfoController {
    
    @objc private func onButtonNextTap() {
        presenter?.buttonNextAction()
    }
    
    @objc private func onButtonManTap() {
        presenter?.buttonManAction()
    }
    @objc private func onButtonWomenTap() {
        presenter?.buttonWomenAction()
    }
    
    @objc private func onSelectOneTap() {
        presenter?.buttonSelectDownAction()
    }
    
    @objc private func onSelectTwoTap() {
        presenter?.buttonSelectUpAction()
    }
    
    @objc private func onSelectThreeTap() {
        presenter?.buttonSelectRegularAction()
    }
}

extension UserInfoController: UserInfoViewProtocol {
    
    func setNextPage(page: Int) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            switch page {
            case 1:
                UIView.animate(withDuration: 0.4) {
                    self.positionPageOne.constant = -self.size.screenHeight()
                    self.positionPageTwo.constant = self.size.scaleHeight(33)
                    self.subView.circle2.backgroundColor = .colorBlack1
                    self.view.layoutIfNeeded()
                }
            case 2:
                UIView.animate(withDuration: 0.4) {
                    self.positionPageTwo.constant = -self.size.screenHeight()
                    self.positionPageThree.constant = self.size.scaleHeight(33)
                    self.subView.circle3.backgroundColor = .colorBlack1
                    self.subView.buttonNext.setTitle(StringConstantsInfoUser.go, for: [])
                    self.view.layoutIfNeeded()
                }
            default:
                let age = self.subView.fieldAge.text ?? ""
                let height = self.subView.fieldHeight.text ?? ""
                let weightNow = self.subView.fieldWeightNow.text ?? ""
                let weightGoal = self.subView.fieldWeightGoal.text ?? ""
                let caloriesGoal = self.subView.fieldCcal.text ?? ""
                self.presenter?.setUserInfo(age: age, height: height, weightNow: weightNow, weightGoal: weightGoal, caloriesGoal: caloriesGoal)
            }
        }
    }
    
    func setSizeImageManWomen(sex: SelectedSex) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1) { [weak self] in
                guard let self else { return }
                self.subView.buttonNext.isEnabled = true
                switch sex {
                case .man:
                    self.helpChangeConstraint(75, 217, 57, 170)
                    self.view.layoutIfNeeded()
                case .women:
                    self.helpChangeConstraint(57, 170, 75, 217)
                    self.view.layoutIfNeeded()
                default: break
                }
            }
        }
    }
    
    func setSelectGoal(goal: SelectGoal) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1) { [weak self] in
                guard let self else { return }
                self.subView.selectOne.backgroundColor = goal == .down ? .customYellow : .clear
                self.subView.selectTwo.backgroundColor = goal == .up ? .customYellow : .clear
                self.subView.selectThree.backgroundColor = goal == .regular ? .customYellow : .clear
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func updateViewDidload(name: String) {
        subView.helloLabel.text = StringConstantsInfoUser.helloText + name
    }
    
    func stopLoader() {
        loaderView.removeFromSuperview()
        view.layoutIfNeeded()
    }
    
    func setLoader() {
        loaderView.isUserInteractionEnabled = false
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        subView.addSubview(loaderView)
        NSLayoutConstraint.activate([
            loaderView.topAnchor.constraint(equalTo: subView.topAnchor),
            loaderView.leadingAnchor.constraint(equalTo: subView.leadingAnchor)
        ])
        view.layoutIfNeeded()
    }
    
}

extension UserInfoController: UITextFieldDelegate {
    
    private func handleTextFieldBegin(_ textField: UITextField) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let constant = -self.size.scaleHeight(50)
            let targetConstraint = textField == self.subView.fieldCcal
                ? self.positionPageThree
                : self.positionPageTwo
            
            UIView.animate(withDuration: 0.1) {
                targetConstraint?.constant = constant
                self.view.layoutIfNeeded()
            }
        }
    }
    
    private func handleTextFieldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if textField == self.subView.fieldCcal {
                UIView.animate(withDuration: 0.1) {
                    self.positionPageThree.constant = self.size.scaleHeight(33)
                    self.view.layoutIfNeeded()
                }
            }
            else {
                UIView.animate(withDuration: 0.1) {
                    self.positionPageTwo.constant = self.size.scaleHeight(33)
                    self.view.layoutIfNeeded()
                }
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return handleTextFieldReturn(textField)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        handleTextFieldBegin(textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        presenter?.checkValidString(textField: textField.text as NSString?, range: range, string: string, textFieldText: textField.text) ?? false
    }

}
