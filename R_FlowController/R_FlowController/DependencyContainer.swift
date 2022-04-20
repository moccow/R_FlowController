//
//  DependencyContainer.swift
//  R_FlowController
//
//  Created by admin on 2022/04/20.
//

import UIKit

// we'll start by defining a DependencyContainer
// that will contain all of our app's core utility objects that are normally directly injected as dependencies.
class DependencyContainer {

    private lazy var countService = CountServiceImpl(factory: self)
    private lazy var dataRepository = DataRepositoryImpl()

    // SceneDelegateで一度だけ呼ぶ
    static func make() -> DependencyContainer {
        return DependencyContainer()
    }
}

// MARK: FlowControllerFactory

protocol FlowControllerFactory {
    func makeAppFlowController() -> AppFlowController
    func makeFirstFlowController() -> FirstFlowController
    func makeSecondFlowController() -> SecondFlowController
}

// FlowController生成。個々のFlowControllerに自身を渡す。
extension DependencyContainer: FlowControllerFactory {
    func makeAppFlowController() -> AppFlowController {
        return AppFlowController(factory: self)
    }
    func makeFirstFlowController() -> FirstFlowController {
        return FirstFlowController(factory: self)
    }
    func makeSecondFlowController() -> SecondFlowController {
        return SecondFlowController(factory: self)
    }
}

// MARK: ViewControllerFactory

protocol ViewControllerFactory {
    func makeNavigationController() -> CustomNavigationController
    func getFirstViewController(navigationController: CustomNavigationController) -> FirstViewController
    func getSecondViewController() -> SecondViewController
}

extension DependencyContainer: ViewControllerFactory {
    func makeNavigationController() -> CustomNavigationController {
        guard let tmp = UIStoryboard.main.instantiateInitialViewController(),
              let nv = tmp as? CustomNavigationController else {
          fatalError("navigation controller must not be null")
        }
        return nv
    }

    func getFirstViewController(navigationController: CustomNavigationController) -> FirstViewController {
        guard let vc = navigationController.children.first as? FirstViewController else {
          fatalError("firstViewController must not be null")
        }
        return vc
    }
    
    func getSecondViewController() -> SecondViewController {
        let vc = (UIStoryboard.main.instantiateViewController(identifier: "SecondViewController") { (coder) -> SecondViewController? in
          return SecondViewController(coder: coder, factory: self)
        })
        return vc
    }
}

// MARK: ServiceFactory
protocol ServiceFactory {
    func getCountService() -> CountService
}

extension DependencyContainer: ServiceFactory {
    func getCountService() -> CountService {
        return countService
    }
}

// MARK: RepositoryFactory

protocol RepositoryFactory {
  func getDataRepository() -> DataRepository
}

extension DependencyContainer: RepositoryFactory {
  func getDataRepository() -> DataRepository {
    return dataRepository
  }
}
