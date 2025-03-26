//
//  CaloriesController.swift
//  Weight Journal
//
//  Created by Данила on 11.11.2024.
//

import Foundation
import UIKit

class CaloriesController: RootController {
    
    let subView = CaloriesView()
    let tableView = UITableView()
    
    let viewModel: CaloriesViewModel
    let userInfo: UserInfo?
    
    init(viewModel: CaloriesViewModel = .shared, userInfo: UserInfo?) {
        self.viewModel = viewModel
        self.userInfo = userInfo
        super.init(customView: subView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.userInfo = userInfo
        setupLabels()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupLabels() {
        if let userInfo = viewModel.userInfo {
            subView.labelNow.text = "\(StringConstantsCalories.now) \(userInfo.caloriesNow)"
            subView.labelGoal.text = "\(StringConstantsCalories.goal) \(userInfo.caloriesGoal)"
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ButtonsCaloriesCell.self, forCellReuseIdentifier: "caloriesButtons")
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        subView.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: subView.unViewSlider.bottomAnchor, constant: size.scaleHeight(20)),
            tableView.leadingAnchor.constraint(equalTo: subView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: subView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: subView.bottomAnchor),
        ])
    }
    
    override func setupActions() {
        subView.buttonBack.addTarget(self, action: #selector(buttonBackAction), for: .touchUpInside)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        subView.slider.thumbView.addGestureRecognizer(panGesture)
    }
    
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: subView.slider)
        switch gesture.state {
        case .began:
            break
        case .changed:
            self.subView.slider.sliderValue = Int(translation.x)
            self.subView.slider.updateThumbPosition()
            
        case .ended, .cancelled, .failed:
            viewModel.changeNowValue(Int(translation.x))
            UIView.animate(withDuration: 0.3) {
                self.subView.slider.sliderValue = 0
                self.subView.slider.updateThumbPosition()
            }
        default:
            break
        }
    }
    
}


extension CaloriesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.buttons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "caloriesButtons", for: indexPath) as! ButtonsCaloriesCell
        cell.label.text = viewModel.buttons[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return size.scaleHeight(70)
    }
    
    
}
