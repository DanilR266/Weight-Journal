//
//  CaloriesViewModel.swift
//  Weight Journal
//
//  Created by Данила on 11.11.2024.
//

import Foundation

class CaloriesPresenter {

    let buttons = [StringConstantsCalories.add,
                   StringConstantsCalories.addYour,
                   StringConstantsCalories.myDish]
    
    private weak var view: CaloriesViewProtocol?
    private var caloriesModelServer: CaloriesInfoServerManagerProtocol
    private var caloriesInfo: CaloriesInfoGet?

    init(view: CaloriesViewProtocol, caloriesModelServer: CaloriesInfoServerManagerProtocol = CaloriesInfoServerManager.shared) {
        self.view = view
        self.caloriesModelServer = caloriesModelServer
    }
    
    func changeNowValue(_ value: Int) {

    }
}

extension CaloriesPresenter: CaloriesPresenterProtocol {
    func backButtonTapped() {
        view?.removeViewController()
    }
    
    func viewDidLoad() {
        getCaloriesData()
    }
}

private extension CaloriesPresenter {
    func getCaloriesData() {
        view?.setLoader()
        Task {
            do {
                let success = try await caloriesModelServer.getCaloriesInfo()
                caloriesInfo = success
                await MainActor.run { [weak self] in
                    guard let self = self else { return }
                    view?.updatedView()
                }
            } catch {
                print("Error get calories")
            }
            await MainActor.run { [weak self] in
                guard let self = self else { return }
                view?.stopLoader()
            }
        }
    }
}
