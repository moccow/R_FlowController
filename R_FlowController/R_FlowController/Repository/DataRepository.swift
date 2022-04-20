//
//  DataRepository.swift
//  R_FlowController
//
//  Created by admin on 2022/04/20.
//

import Foundation


protocol DataRepository {
  func save(_ data: Int)
  func read() -> Int
}

final class DataRepositoryImpl: DataRepository {

  func save(_ data: Int) {
    UserDefaults.standard.set(data, forKey: kData)
  }

  func read() -> Int {
    let dat =  UserDefaults.standard.object(forKey: kData) as? Int ?? 0
    return dat
  }
}
