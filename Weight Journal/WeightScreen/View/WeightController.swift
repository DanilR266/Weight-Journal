//
//  WeightController.swift
//  Weight Journal
//
//  Created by Данила on 05.11.2024.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class WeightController: BaseUIViewController {
    
    let subView = WeightView()
    var tableView = UITableView()
    var userInfo: UserInfo?
    let viewModel: WeightViewModel
    let disposeBag = DisposeBag()
    
    init(viewModel: WeightViewModel = .shared, userInfo: UserInfo?) {
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
        setupTableView()
        setupTextField()
        bindToSubjects()
    }
    
    private func setupTextField() {
        subView.fieldWeight.delegate = self
        subView.fieldWeight.text = "\(viewModel.userInfo?.weightNow ?? 0)"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryWeightCell.self, forCellReuseIdentifier: "historyWeight")
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = .colorFhy
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        subView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: subView.labelHistory.bottomAnchor, constant: size.scaleHeight(11)),
            tableView.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: size.scaleWidth(14)),
            tableView.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -size.scaleWidth(14)),
            tableView.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: -size.scaleHeight(100))
        ])
        
        viewModel.sortedDict
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] data in
                print("SUBSCRIBE")
                self?.viewModel.tableData = data
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.sortedDictionary()
    }
    
    override func setupActions() {
        subView.buttonBack.addTarget(self, action: #selector(buttonBackAction), for: .touchUpInside)
    }
    
    @objc override func buttonBackAction() {
        super.buttonBackAction()
        viewModel.updateDataToStorage()
    }
    
}

extension WeightController {
    
    func bindToSubjects() {
        
        subView.fieldWeight.rx.text
            .orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .map { Double($0) ?? 0.0 }
            .bind(to: viewModel.weightNow)
            .disposed(by: disposeBag)
        
    }
    
}

extension WeightController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyWeight", for: indexPath) as! HistoryWeightCell
        
        cell.labelDate.text = "\(viewModel.tableData[indexPath.row].key)"
        cell.labelWeight.text = "\(viewModel.tableData[indexPath.row].value)"
        return cell
    }
    
}

extension WeightController: UITextFieldDelegate {
    
}
