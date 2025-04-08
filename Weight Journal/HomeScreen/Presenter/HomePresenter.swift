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
                await MainActor.run { [weak self] in
                    let vc = AuthenticateBuilder.authenticateBuild()
                    self?.view?.moveToRootController(vc: vc)
                }
            }
        }
    }
    
    func buttonWeightTapped() {
        
        let vc = WeightBuilder.build(userTarget: SelectGoal(rawValue: userInfo?.target ?? "regular") ?? .regular)
        view?.moveToViewController(vc: vc)
    }
    
    func buttonCaloriesTapped() {
//        let vc = CaloriesBuilder.build()
//        view?.moveToViewController(vc: vc)
    }
}

private extension HomePresenter {
    
}
