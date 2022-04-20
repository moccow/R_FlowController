//
//  AppFlowController.swift
//  R_FlowController
//
//  Created by admin on 2022/04/20.
//

import UIKit

final class AppFlowController: UIViewController {
    // Here we use protocol composition to create a Factory type that includes
    // all the factory protocols that this view controller needs.
    
    // FlowControllerFactory: DependencyContainerで定義したprotocol
    typealias Factory = FlowControllerFactory

    private let factory: Factory

    init(factory: Factory) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        children.first?.view.frame = view.bounds
    }

    func start() {
        let firstFlowController = factory.makeFirstFlowController()
        add(child: firstFlowController)
        firstFlowController.start()
    }
}
