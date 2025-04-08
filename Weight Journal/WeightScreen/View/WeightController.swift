//
//  WeightController.swift
//  Weight Journal
//
//  Created by Данила on 05.11.2024.
//

import Foundation
import UIKit


class WeightController: UIViewController {
    
    private let size = Size.shared
    private let subView = WeightView()
    private var tableView = UITableView()
    private let loaderView = LoadView()
    
    var presenter: WeightPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupActions()
        setupTableView()
        setupTextField()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Disappear")
        presenter?.setWeightData()
    }
    
    override func loadView() {
        super.loadView()
        view = subView
    }
    
    private func setupTextField() {
        subView.fieldWeight.delegate = self
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryWeightCell.self, forCellReuseIdentifier: "historyWeight")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        subView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: subView.unViewGraph.bottomAnchor, constant: size.scaleHeight(16)),
            tableView.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: size.scaleWidth(14)),
            tableView.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -size.scaleWidth(14)),
            tableView.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: -size.scaleHeight(20))
        ])
    }
    
    private func setupActions() {
        subView.buttonBack.addTarget(self, action: #selector(buttonBackTapped), for: .touchUpInside)
        subView.buttonMinus.addTarget(self, action: #selector(buttonMinusTapped), for: .touchUpInside)
        subView.buttonPlus.addTarget(self, action: #selector(buttonPlusTapped), for: .touchUpInside)
    }
}

extension WeightController: WeightViewProtocol {
    
    func updateFieldWeight(text: String) {
        subView.fieldWeight.text = text
        subView.labelNow.text = "\(StringConstantsWeight.labelNow) \(text) \(StringConstantsWeight.mass)"
        view.layoutIfNeeded()
    }
    
    func moveToPreviousView() {
        navigationController?.popViewController(animated: true)
    }
    
    func stopLoader() {
        loaderView.removeFromSuperview()
        view.layoutIfNeeded()
    }
    
    func setLoader() {
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loaderView)
        NSLayoutConstraint.activate([
            loaderView.topAnchor.constraint(equalTo: subView.topAnchor),
            loaderView.leadingAnchor.constraint(equalTo: subView.leadingAnchor)
        ])
        view.layoutIfNeeded()
    }
    
    func updateDataAfterFetch(weightNow: String, weightGoal: String) {
        subView.labelNow.text = "\(StringConstantsWeight.labelNow) \(weightNow) \(StringConstantsWeight.mass)"
        subView.labelGoal.text = "\(StringConstantsWeight.labelGoal) \(weightGoal) \(StringConstantsWeight.mass)"
        subView.fieldWeight.text = weightNow
    }
    
    func updateTableViewAndGraph(dataX: [String], dataY: [CGFloat]) {
        tableView.reloadData()
        subView.setGraphData(dataX: dataX, dataY: dataY)
        view.layoutIfNeeded()
    }
}


extension WeightController {
    
    @objc private func buttonBackTapped() {
        presenter?.backButton()
    }
    
    @objc private func buttonMinusTapped() {
        presenter?.buttonMinus()
    }
    
    @objc private func buttonPlusTapped() {
        presenter?.buttonPlus()
    }
    
}

extension WeightController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter else { return 0 }
        return presenter.tableViewHistoryCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyWeight", for: indexPath) as! HistoryWeightCell
        let data = presenter.tableViewHistoryData()
        let dataProgress = presenter.checkPreviousValue(index: indexPath.row)
        cell.setupCell(textDate: data[indexPath.row].date, textValue: "\(data[indexPath.row].weight)", textProgress: dataProgress.0, colorProgress: dataProgress.1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return size.scaleHeight(61)
    }
}

extension WeightController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        presenter?.setTextFieldWeight(text: textField.text ?? "")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return presenter?.checkValidString(textField: textField.text as NSString?, range: range, string: string, textFieldText: textField.text) ?? false
    }
}
