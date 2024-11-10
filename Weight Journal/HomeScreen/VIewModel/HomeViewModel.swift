//
//  HomeViewModel.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import RxSwift
import RxCocoa


class HomeViewModel {
    
    let userName: PublishSubject<String> = PublishSubject()
    private let disposeBag = DisposeBag()
    
    static let shared = HomeViewModel()
    var userNameTest: String = ""
    var authModel = FirebaseAuthenticate.shared
    private let model = HomeModel()
    var userInfo: UserInfo?
    
    init() {
        print("InitViewModel")
    }
    
    func fetchData() {
        model.fetchUser(completion: { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching user: \(error.localizedDescription)")
                self.userName.onNext("\(StringConstantsHome.helloText)")
                return
            }
            guard let user = user else {
                self.userInfo = user
                self.userName.onNext("\(StringConstantsHome.helloText)")
                return
            }
            self.userName
                .onNext("\(StringConstantsHome.helloText)\(user.name)")
            self.userNameTest = user.name
            self.userInfo = user
            self.setValuesForToday(user)
            setUsernameStorage(user.name)
        })
    }
    
    func setValuesForToday(_ userInfo: UserInfo) {
        var weightDate = userInfo.weightDate
        weightDate[dateFormatter()] = "\(userInfo.weightNow)"
        self.userInfo?.weightDate = weightDate
        model.setValuesForToday(weightDate: weightDate) { error in
            if let error = error {
                print("Error fetching user: \(error.localizedDescription)")
            }
        }
    }
    
    func setDataToStorage(_ userInfo: UserInfo) {
        model.setUserInfo(userInfo) { error in
            if let error = error {
                print(error)
                return
            }
            self.userInfo = userInfo
            self.fetchData()
        }
    }
    
    private func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"

        let today = Date()
        let dateString = dateFormatter.string(from: today)
        return dateString
    }
    
    
    
    
    
    func signOut() {
        authModel.signOut()
    }
    
    func storageNameGet() -> String {
        return UserDefaults.standard.string(forKey: "UserName") ?? ""
    }
    
    func setUsernameStorage(_ name: String) {
        UserDefaults.standard.set(name, forKey: "UserName")
    }
}
