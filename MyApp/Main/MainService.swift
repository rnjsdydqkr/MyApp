//
//  MainService.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import Foundation

class MainService: SLServiceProtocol {
  private let repository = MainRepository()
  
  func requestMainList(userId: String, name: String, onCompleted: @escaping ((MainListResponse?, APIError?) -> Void)) {
    repository.requestMainList(userId: userId, name: name, callback: onCompleted)
//    repository.requestMainList(userId: userId, name: name) { response, error in
//      guard let resp = response else {
//        return onCompleted(nil, error)
//      }
//      print("respresp: \(resp)")
//      return onCompleted(resp, nil)
//    }
  }
  
  func requestPopularMovieInfo(onCompleted: @escaping ((PopularMovieInfoResponse?, APIError?) -> Void)) {
    repository.requestPopularMovieInfo(callback: onCompleted)
  }
  
}
