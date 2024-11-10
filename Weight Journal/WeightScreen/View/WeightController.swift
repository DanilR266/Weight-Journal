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
    var graphView = GraphView()
    var userInfo: UserInfo?
    let viewModel: WeightViewModel
    let disposeBag = DisposeBag()
    var data: [(key: String, value: String)] = []
    
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
        setupLabels()
        setupGraph()
        
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
                self?.viewModel.tableData = data
                self?.data = data
                self?.view.layoutIfNeeded()
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.sortedDictionary()
    }
    
    private func setupGraph() {
    
        graphView.dataPoints = data.map { ($0.key, Double($0.value) ?? 0) }

        graphView.translatesAutoresizingMaskIntoConstraints = false
        graphView.backgroundColor = .clear
        graphView.layer.cornerRadius = 20
        
        subView.unViewGraph.addSubview(graphView)
        NSLayoutConstraint.activate([
            graphView.topAnchor.constraint(equalTo: subView.unViewGraph.topAnchor),
            graphView.leadingAnchor.constraint(equalTo: subView.unViewGraph.leadingAnchor),
            graphView.trailingAnchor.constraint(equalTo: subView.unViewGraph.trailingAnchor),
            graphView.bottomAnchor.constraint(equalTo: subView.unViewGraph.bottomAnchor),
        ])
    }
    
    private func setupLabels() {
        if let userInfo = viewModel.userInfo {
            subView.labelNow.text = "\(StringConstantsWeight.labelNow) \(userInfo.weightNow) \(StringConstantsWeight.mass)"
            subView.labelGoal.text = "\(StringConstantsWeight.labelGoal) \(userInfo.weightGoal) \(StringConstantsWeight.mass)"
        }
    }
    
    override func setupActions() {
        subView.buttonBack.addTarget(self, action: #selector(buttonBackAction), for: .touchUpInside)
        subView.buttonMinus.addTarget(self, action: #selector(buttonMinusTap), for: .touchUpInside)
        subView.buttonPlus.addTarget(self, action: #selector(buttonPlusTap), for: .touchUpInside)
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
        
        viewModel.weightNow
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] value in
                self?.subView.labelNow.text = "Текущий: \(value) кг"
                self?.view.layoutIfNeeded()
            })
            .disposed(by: disposeBag)
        
    }
    
    @objc func buttonMinusTap() {
        viewModel.buttonMinusTap()
        subView.fieldWeight.text = "\(viewModel.currentWeightNow)"
    }
    
    @objc func buttonPlusTap() {
        viewModel.buttonPlusTap()
        subView.fieldWeight.text = "\(viewModel.currentWeightNow)"
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        viewModel.checkValidString(textField: textField.text as NSString?, range: range, string: string, textFieldText: textField.text)
    }
}
