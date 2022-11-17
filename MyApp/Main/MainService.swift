//
//  MainService.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import Foundation

class MainService: MCServiceProtocol {
  private let repository = MainRepository()
  
  func requestMainList(userId: String, name: String, onCompleted: @escaping ((MainResponse?, APIError?) -> Void)) {
    repository.requestMainList(userId: userId, name: name) { response, error in
      guard let resp = response else {
        return onCompleted(nil, error)
      }
      print("respresp: \(resp)")
      return onCompleted(resp, nil)
    }
  }
  
}
