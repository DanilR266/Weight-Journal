//
//  ViewController.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import UIKit
import RxSwift
import RxCocoa

class HomeController: UIViewController {

    private let homeView = HomeView()
    private let homeViewModel: HomeViewModel
    private let disposeBag = DisposeBag()
    
    init(homeViewModel: HomeViewModel = HomeViewModel.shared) {
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        
        bindToViewModel()
        homeViewModel.fetchData()
        
        setupButtonsActions()
    }
    
    override func loadView() {
        super.loadView()
        view = homeView
    }

    
    @objc func buttonWeightTap() {
//        let vc = WeightScreenController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonCaloriesTap() {
//        let vc = CaloriesScreenController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonWaterTap() {
        homeViewModel.signOut()
    }
    
    private func setupButtonsActions() {
        homeView.buttonWeight.addTarget(self, action: #selector(buttonWeightTap), for: .touchUpInside)
        homeView.buttonCalories.addTarget(self, action: #selector(buttonCaloriesTap), for: .touchUpInside)
        homeView.buttonWater.addTarget(self, action: #selector(buttonWaterTap), for: .touchUpInside)
    }

}

extension HomeController {
    
    private func bindToViewModel() {
        homeViewModel.userName
            .observe(on: MainScheduler.instance)
            .bind(to: homeView.labelHello.rx.text)
            .disposed(by: disposeBag)
    }
    
}

