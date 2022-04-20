//
//  SecondViewController.swift
//  R_FlowController
//
//  Created by admin on 2022/04/20.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {}

class SecondViewController: UIViewController {
    typealias Factory = ServiceFactory
    
    @IBOutlet weak var cntLabel: UILabel!
    
    weak var delegate: SecondViewControllerDelegate?
    
    private let countService: CountService
    
    init?(coder: NSCoder, factory: Factory) {
        self.countService = factory.getCountService()
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cntLabel.text = String(self.countService.read())
    }
    
    private func reset() {
        self.countService.clear()
        self.cntLabel.text = String(self.countService.read())
    }
    
    @IBAction func countButtonTapped(_ sender: UIButton) {
        cntLabel.text = String(self.countService.count())
    }
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        self.reset()
    }
    
}

