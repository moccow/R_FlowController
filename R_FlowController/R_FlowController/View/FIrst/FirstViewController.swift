//
//  FirstViewController.swift
//  R_FlowController
//
//  Created by admin on 2022/04/20.
//

import UIKit

protocol FirstViewControllerDelegate: AnyObject {
    func nextButtonTapped()
}

class FirstViewController: UIViewController {

    weak var delegate: FirstViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "FlowController Demo"
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        delegate?.nextButtonTapped()
    }
}

