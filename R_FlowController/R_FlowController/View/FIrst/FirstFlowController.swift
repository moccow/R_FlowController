//
//  FirstFlowController.swift
//  R_FlowController
//
//  Created by admin on 2022/04/20.
//

import UIKit

class FirstFlowController: UIViewController {
    typealias Factory = FlowControllerFactory & ViewControllerFactory

    private let factory: Factory
    private var embeddedNavigationController: UINavigationController?

    init(factory: Factory) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)

        let nav = factory.makeNavigationController()
        embeddedNavigationController = nav
        let vc = factory.getFirstViewController(navigationController: nav)
        vc.delegate = self
        add(child: nav)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func start() {
    // do addtional initialization
    }
}

extension FirstFlowController: FirstViewControllerDelegate {
    func nextButtonTapped() {
        print("next")
        let flow = factory.makeSecondFlowController()
        flow.start()
        embeddedNavigationController?.pushViewController(flow, animated: true)
    }
}
