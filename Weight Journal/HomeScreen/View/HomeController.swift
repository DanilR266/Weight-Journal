//
//  ViewController.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import UIKit

class HomeController: UIViewController {

    private let subView = HomeView()
    private let loaderView = LoadView()
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        presenter?.fetchData()
    }
    
    override func loadView() {
        super.loadView()
        self.view = subView
    }
    
    func setupActions() {
        subView.buttonWeight.addTarget(self, action: #selector(buttonWeightTapped), for: .touchUpInside)
        subView.buttonCalories.addTarget(self, action: #selector(buttonCaloriesTapped), for: .touchUpInside)
        subView.buttonWater.addTarget(self, action: #selector(buttonWaterTapped), for: .touchUpInside)
    }
}

extension HomeController: HomeViewProtocol {
    func moveToViewController(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func reloadData(name: String) {
        subView.setNameLabel(name: name)
        view.layoutIfNeeded()
    }
}

extension HomeController {
    
    @objc func buttonWeightTapped() {
        presenter?.buttonWeightTapped()
    }
    
    @objc func buttonCaloriesTapped() {
        presenter?.buttonCaloriesTapped()
    }
    
    @objc func buttonWaterTapped() {
//        homeViewModel.signOut()
    }
    
}

