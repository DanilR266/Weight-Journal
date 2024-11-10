//
//  ViewController.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import UIKit
import RxSwift
import RxCocoa

class HomeController: BaseUIViewController {

    private let subView = HomeView()
    private let homeViewModel: HomeViewModel
    private let disposeBag = DisposeBag()

    
    init(homeViewModel: HomeViewModel = HomeViewModel.shared) {
        self.homeViewModel = homeViewModel
        super.init(customView: subView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
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
//        let vc = CaloriesScreenController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonWaterTap() {
        homeViewModel.signOut()
    }
    
}

extension HomeController {
    
    private func bindToViewModel() {
        homeViewModel.userName
            .observe(on: MainScheduler.instance)
            .bind(to: subView.labelHello.rx.text)
            .disposed(by: disposeBag)
    }
    
}

