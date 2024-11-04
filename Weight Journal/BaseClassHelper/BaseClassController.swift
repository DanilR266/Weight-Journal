//
//  BaseClassController.swift
//  Weight Journal
//
//  Created by Данила on 02.11.2024.
//

import Foundation
import UIKit


class BaseUIViewController: UIViewController {
    
    let size = Size()
    var customView: UIView
    
    init(customView: UIView) {
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    override func loadView() {
        super.loadView()
        self.view = customView
    }
    
    open func setupActions() { }
    
}
