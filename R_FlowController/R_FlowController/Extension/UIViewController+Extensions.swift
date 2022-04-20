//
//  UIViewController+Extensions.swift
//  R_FlowController
//
//  Created by admin on 2022/04/20.
//

import UIKit

extension UIViewController {
    func add(child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}
