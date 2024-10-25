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
    func fetchData() {
        model.fetchUser(completion: { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching user: \(error.localizedDescription)")
                self.userName.onNext("\(StringConstantsHome.helloText)")
                return
            }
            guard let user = user else {
                self.userName.onNext("\(StringConstantsHome.helloText)")
                return
            }
            self.userName.onNext("\(StringConstantsHome.helloText) \(user.name)")
            self.userNameTest = user.name
            self.userInfo = user
            
        })
    }
    
    func signOut() {
        authModel.signOut()
    }
}
