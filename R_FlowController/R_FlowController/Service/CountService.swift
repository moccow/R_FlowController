//
//  CountService.swift
//  R_FlowController
//
//  Created by admin on 2022/04/20.
//

protocol CountService {
    func count() -> Int
    func read() -> Int
    func clear()
}

final class CountServiceImpl {
    typealias Factory = ServiceFactory & RepositoryFactory
    private let factory: Factory
    private let repository: DataRepository
    private var cnt = 0

    init(factory: Factory) {
        self.factory = factory
        self.repository = self.factory.getDataRepository()
        self.cnt = self.repository.read()
    }
}

extension CountServiceImpl: CountService {
    func count() -> Int {
        cnt+=1
        self.repository.save(cnt)
        return cnt
    }
    func read() -> Int {
        return self.repository.read()
    }
    func clear() {
        self.repository.save(0)
    }
}
