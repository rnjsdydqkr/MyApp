//
//  MainRepository.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import Foundation

class MainRepository: MCRepositoryProtocol {
  func requestMainList(userId: String, name: String, onComplete: @escaping (MainResponse?, APIError?) -> Void) {
    APIProvider.shared.requestMainList(userId: userId, name: name, onComplete: onComplete)
  }
  
//  func requestMainList(userId: String, name: String, onComplete: @escaping (MainModelReponse?, APIError?) -> Void) {
//    APIProvider.shared.requestMainList(userId: userId, name: name, onComplete: onComplete)
//  }
}
