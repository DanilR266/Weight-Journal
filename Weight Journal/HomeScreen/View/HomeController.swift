//
//  ViewController.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import UIKit

class HomeController: RootController {

    private let subView = HomeView()
    private let homeViewModel: HomeViewModel

    
    init(homeViewModel: HomeViewModel = HomeViewModel.shared) {
        self.homeViewModel = homeViewModel
        super.init(customView: subView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStorageName()
//        homeViewModel.fetchData()
    }
    
    override func setupActions() {
        subView.buttonWeight.addTarget(self, action: #selector(buttonWeightTap), for: .touchUpInside)
        subView.buttonCalories.addTarget(self, action: #selector(buttonCaloriesTap), for: .touchUpInside)
        subView.buttonWater.addTarget(self, action: #selector(buttonWaterTap), for: .touchUpInside)
    }
    
    private func setStorageName() {
        subView.labelHello.text = "\(StringConstantsHome.helloText)\(homeViewModel.storageNameGet())"
    }

}

extension HomeController {
    
    @objc func buttonWeightTap() {
        let vc = WeightController(userInfo: homeViewModel.userInfo)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonCaloriesTap() {
        let vc = CaloriesController(userInfo: homeViewModel.userInfo)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonWaterTap() {
        homeViewModel.signOut()
    }
    
}

