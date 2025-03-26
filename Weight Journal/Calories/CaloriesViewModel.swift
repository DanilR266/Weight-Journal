//
//  CaloriesViewModel.swift
//  Weight Journal
//
//  Created by Данила on 11.11.2024.
//

import Foundation

class CaloriesViewModel {
    
    static var shared = CaloriesViewModel()
    var userInfo: UserInfo?
    let buttons = [StringConstantsCalories.add,
                   StringConstantsCalories.addYour,
                   StringConstantsCalories.myDish]
    
//    var caloriesNow = PublishSubject<Int>()
    
    init() {
        bindToSubjects()
    }
    
    func changeNowValue(_ value: Int) {
//        if let userInfo = userInfo {
//            let newValue = userInfo.caloriesNow + value
//            caloriesNow.onNext(newValue >= 0 ? newValue : 0)
//        }
    }
    
    private func bindToSubjects() {
//        caloriesNow.subscribe(onNext: { [weak self] value in
//            self?.userInfo?.caloriesNow = value
//        }).disposed(by: disposeBag)
    }
    
}
