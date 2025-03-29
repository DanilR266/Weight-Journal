//
//  HomeViewModel.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation


class HomePresenter {
    
    private var userInfo: UserInfo?
    private let userInfoService = UserInfoServerManager.shared
    
    private weak var view: HomeViewProtocol?
    private let userInfoModelService: UserInfoServerManagerProtocol
    
    init(view: HomeViewProtocol?, userInfoModelService: UserInfoServerManagerProtocol = UserInfoServerManager.shared) {
        self.view = view
        self.userInfoModelService = userInfoModelService
    }
}

extension HomePresenter: HomePresenterProtocol {
    func fetchData() {
        Task {
            do {
                let success = try await userInfoService.getUserInfo()
                userInfo = success
                await MainActor.run { [weak self] in
                    let name = success.name
                    self?.view?.reloadData(name: name)
                }
            } catch {
                print("Error fetch", error)
            }
        }
    }
    
    func buttonWeightTapped() {
//        let vc = WeightBuilder.build()
//        view?.moveToViewController(vc: vc)
    }
    
    func buttonCaloriesTapped() {
//        let vc = CaloriesBuilder.build()
//        view?.moveToViewController(vc: vc)
    }
}

private extension HomePresenter {
    
}
