//
//  UserInfoController.swift
//  Weight Journal
//
//  Created by Данила on 03.11.2024.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class UserInfoController: BaseUIViewController {
    
    let subView = UserInfoView()
    let loadView = LoadView()
    let viewModel = UserInfoViewModel.shared
    let disposeBag = DisposeBag()
    
    var name: String
    var email: String
    var password: String
    
    var page = 0
    
    var positionPageOne: NSLayoutConstraint!
    var positionPageTwo: NSLayoutConstraint!
    var positionPageThree: NSLayoutConstraint!
    
    var widthButtonWomen: NSLayoutConstraint!
    var heightButtonWomen: NSLayoutConstraint!
    var widthButtonMan: NSLayoutConstraint!
    var heightButtonMan: NSLayoutConstraint!
    var widthImageWomen: NSLayoutConstraint!
    var heightImageWomen: NSLayoutConstraint!
    var widthImageMan: NSLayoutConstraint!
    var heightImageMan: NSLayoutConstraint!
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
        super.init(customView: subView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        viewModel.delegate = self
        bindToViewModel()
        
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
        heightButtonWomen = subView.imageWomen.imageView?.heightAnchor.constraint(equalToConstant: size.scaleHeight(170))
        widthButtonWomen = subView.imageWomen.imageView?.widthAnchor.constraint(equalToConstant: size.scaleWidth(57))
        heightButtonMan = subView.imageMan.imageView?.heightAnchor.constraint(equalToConstant: size.scaleHeight(170))
        widthButtonMan = subView.imageMan.imageView?.widthAnchor.constraint(equalToConstant: size.scaleWidth(57))
        
        NSLayoutConstraint.activate([
            heightImageWomen, widthImageWomen, heightImageMan, widthImageMan,
            heightButtonWomen, widthButtonWomen, heightButtonMan, widthButtonMan
        ])
    }
    
    private func setName() {
        subView.helloLabel.text = StringConstantsInfoUser.helloText + name
    }
    
    private func setSelectGoal() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1) {
                switch self.viewModel.selectGoal {
                case .down:
                    self.subView.selectOne.backgroundColor = .customYellow
                    self.subView.selectTwo.backgroundColor = .clear
                    self.subView.selectThree.backgroundColor = .clear
                    self.view.layoutIfNeeded()
                case .up:
                    self.subView.selectOne.backgroundColor = .clear
                    self.subView.selectTwo.backgroundColor = .customYellow
                    self.subView.selectThree.backgroundColor = .clear
                    self.view.layoutIfNeeded()
                case .regular:
                    self.subView.selectOne.backgroundColor = .clear
                    self.subView.selectTwo.backgroundColor = .clear
                    self.subView.selectThree.backgroundColor = .customYellow
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    private func setSizeImageManWomen() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1) {
                self.subView.buttonNext.isEnabled = true
                switch self.viewModel.sex {
                case .man:
                    self.helpChangeConstraint(75, 217, 57, 170)
                    self.view.layoutIfNeeded()
                case .women:
                    self.helpChangeConstraint(57, 170, 75, 217)
                    self.view.layoutIfNeeded()
                default:
                    break
                }
            }
        }
    }
    
    private func helpChangeConstraint(_ widthMan: CGFloat, _ heightMan: CGFloat, _ widthWomen: CGFloat, _ heightWomen: CGFloat) {
        self.widthImageWomen.constant = self.size.scaleWidth(widthWomen)
        self.heightImageWomen.constant = self.size.scaleHeight(heightWomen)
        self.widthButtonWomen.constant = self.size.scaleWidth(widthWomen)
        self.heightButtonWomen.constant = self.size.scaleHeight(heightWomen)
        
        self.widthImageMan.constant = self.size.scaleWidth(widthMan)
        self.widthButtonMan.constant = self.size.scaleWidth(widthMan)
        self.heightButtonMan.constant = self.size.scaleHeight(heightMan)
        self.heightImageMan.constant = self.size.scaleHeight(heightMan)
    }
    
    private func setLoader() {
        loadView.isUserInteractionEnabled = false
        loadView.translatesAutoresizingMaskIntoConstraints = false
        subView.addSubview(loadView)
        NSLayoutConstraint.activate([
            loadView.topAnchor.constraint(equalTo: subView.topAnchor),
            loadView.leadingAnchor.constraint(equalTo: subView.leadingAnchor)
        ])
    }
    
    override func setupActions() {
        subView.buttonNext.addTarget(self, action: #selector(onButtonNextTap), for: .touchUpInside)
        subView.imageMan.addTarget(self, action: #selector(onButtonManTap), for: .touchUpInside)
        subView.imageWomen.addTarget(self, action: #selector(onButtonWomenTap), for: .touchUpInside)
        subView.selectOne.addTarget(self, action: #selector(onSelectOneTap), for: .touchUpInside)
        subView.selectTwo.addTarget(self, action: #selector(onSelectTwoTap), for: .touchUpInside)
        subView.selectThree.addTarget(self, action: #selector(onSelectThreeTap), for: .touchUpInside)
    }
    
}

extension UserInfoController {
    @objc func onButtonNextTap() {
        
        if page == 1 {
            if viewModel.currentAge == "" ||
                viewModel.currentHeight == "" ||
                viewModel.currentWeightNow == "" ||
                viewModel.currentWeightGoal == "" {
                return
            }
        }
        
        DispatchQueue.main.async {
            self.page += 1
            switch self.page {
            case 1:
                UIView.animate(withDuration: 0.4) {
                    self.positionPageOne.constant = -self.size.screenHeight()
                    self.positionPageTwo.constant = self.size.scaleHeight(33)
                    self.subView.circle2.backgroundColor = .colorBlack1
                    self.view.layoutIfNeeded()
                }
            case 2:
                self.viewModel.getCurrentCcal()
                UIView.animate(withDuration: 0.4) {
                    self.positionPageTwo.constant = -self.size.screenHeight()
                    self.positionPageThree.constant = self.size.scaleHeight(33)
                    self.subView.circle3.backgroundColor = .colorBlack1
                    self.subView.buttonNext.setTitle(StringConstantsInfoUser.go, for: [])
                    self.view.layoutIfNeeded()
                }
            default:
                self.setLoader()
                self.viewModel.registration(name: self.name, email: self.email, password: self.password)
            }
        }
    }
    
    @objc func onButtonManTap() {
        viewModel.sex = .man
        setSizeImageManWomen()
    }
    @objc func onButtonWomenTap() {
        viewModel.sex = .women
        setSizeImageManWomen()
    }
    
    @objc func onSelectOneTap() {
        viewModel.selectGoal = .down
        setSelectGoal()
    }
    
    @objc func onSelectTwoTap() {
        viewModel.selectGoal = .up
        setSelectGoal()
    }
    
    @objc func onSelectThreeTap() {
        viewModel.selectGoal = .regular
        setSelectGoal()
    }
}

extension UserInfoController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        DispatchQueue.main.async {
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        DispatchQueue.main.async {
            if textField == self.subView.fieldCcal {
                UIView.animate(withDuration: 0.1) {
                    self.positionPageThree.constant = -self.size.scaleHeight(50)
                    self.view.layoutIfNeeded()
                }
            }
            else {
                UIView.animate(withDuration: 0.1) {
                    self.positionPageTwo.constant = -self.size.scaleHeight(50)
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        viewModel.checkValidString(textField: textField.text as NSString?, range: range, string: string, textFieldText: textField.text)
    }

}

extension UserInfoController {
    
    private func bindToViewModel() {
        
        subView.fieldAge.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: viewModel.age)
            .disposed(by: disposeBag)
        
        subView.fieldHeight.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: viewModel.height)
            .disposed(by: disposeBag)
        
        subView.fieldWeightNow.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: viewModel.weightNow)
            .disposed(by: disposeBag)
        
        subView.fieldWeightGoal.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: viewModel.weightGoal)
            .disposed(by: disposeBag)
        
        subView.fieldCcal.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .bind(to: viewModel.ccal)
            .disposed(by: disposeBag)
        
        viewModel.getCcal
            .map { "\($0)" }
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { value in
                self.subView.labelGetCcal.text = "\(value)"
                
            })
            .disposed(by: disposeBag)
    }
}


extension UserInfoController: LoaderProtocol {
    func stopLoad() {
        loadView.removeFromSuperview()
    }
}
