//
//  WeightViewModel.swift
//  Weight Journal
//
//  Created by Данила on 05.11.2024.
//

import Foundation

class WeightViewModel {
    
    var userInfo: UserInfo?
    let model = WeightModel()
//    let homeViewModel = HomeViewModel.shared
    static let shared = WeightViewModel()
//    var weightNow: PublishSubject<Double> = PublishSubject<Double>()
    var currentWeightNow: Double = 0
//    var sortedDict: PublishSubject<Array<(key: String, value: String)>> = PublishSubject<Array<(key: String, value: String)>>()
    var tableData: Array<(key: String, value: String)> = []
    
    
    init() {
        bindToSubjects()
    }
    
    func sortedDictionary() {
//        if let userInfo = userInfo {
//            sortedDict.onNext(userInfo.weightDate.sorted(by: { $0.key < $1.key }))
//            weightNow.onNext(userInfo.weightNow)
//        }
    }
    
    func checkValidString(textField: NSString?, range: NSRange,
                          string: String, textFieldText: String?) -> Bool {
        return ValidationTextFieldInput.shared.checkValidString(textField: textField, range: range, string: string, textFieldText: textFieldText)
    }
    
    private func bindToSubjects() {
//        weightNow.subscribe(onNext: { [weak self] value in
//            self?.currentWeightNow = value
//            self?.userInfo?.weightNow = value
//        }).disposed(by: disposeBag)
    }
    
    func updateDataToStorage() {
        guard let userInfo = userInfo else { return }
//        homeViewModel.setDataToStorage(userInfo)
    }
    
    func buttonPlusTap() {
//        guard var userInfo = userInfo else { return }
//        userInfo.weightNow += 0.5
//        weightNow.onNext(userInfo.weightNow)
//        self.userInfo = userInfo
    }
    
    func buttonMinusTap() {
//        guard var userInfo = userInfo else { return }
//        userInfo.weightNow -= 0.5
//        weightNow.onNext(userInfo.weightNow)
//        self.userInfo = userInfo
    }
    
}
