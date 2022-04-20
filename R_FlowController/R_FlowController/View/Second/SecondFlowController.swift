//
//  SecondFlowController.swift
//  R_FlowController
//
//  Created by admin on 2022/04/20.
//

import UIKit

class SecondFlowController: UIViewController {
    typealias Factory = FlowControllerFactory & ViewControllerFactory

    private let factory: Factory
    private let vc: SecondViewController

    init(factory: Factory) {
        self.factory = factory
        self.vc = factory.getSecondViewController()
        
        super.init(nibName: nil, bundle: nil)
        
        self.vc.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func start() {
        add(child: self.vc)
    }
}

extension SecondFlowController: SecondViewControllerDelegate {}

